import 'dart:async';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:subjects_api/subjects_api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// {@template subjects_api.subjects_api}
/// # Subjects API.
/// {@endtemplate}
class SubjectsApi {
  /// {@macro subjects_api.subjects_api}
  const SubjectsApi({
    required this.supabase,
  });

  /// The Supabase client used to interact with the database.
  @visibleForTesting
  final SupabaseClient supabase;

  /// The name of the table that contains subjects.
  @visibleForTesting
  static const subjectsTableName = 'subjects';

  /// The equality utility used to compare [Iterable]s of [Subject]s.
  static const IterableEquality<Subject> subjectsIterableEquality =
      IterableEquality();

  /// Creates a new subject.
  Future<Subject> createSubject(
    CreateSubjectDto createSubjectDto,
  ) async {
    return supabase
        .from(subjectsTableName)
        .insert(createSubjectDto.toMap())
        .select()
        .single()
        .withConverter(Subject.fromJson);
  }

  /// Retrieves the quantity of subjects in the database.
  Future<int> getSubjectsCount() async {
    return await supabase.from(subjectsTableName).count();
  }

  /// Watches the quantity of subjects in the database.
  Stream<int> watchSubjectsCount() {
    late StreamController<int> streamController;
    late RealtimeChannel channel;

    Future<void> emitCount() async {
      final count = await getSubjectsCount();
      if (streamController.isClosed) return;
      streamController.add(count);
    }

    Future<void> onListen() async {
      await emitCount();
      if (streamController.isClosed) return;
      channel = supabase
          .channel('watch-subjects-count')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            table: subjectsTableName,
            callback: (payload) async {
              if (streamController.isClosed) return;
              await emitCount();
            },
          )
          .subscribe();
    }

    Future<void> onCancel() async {
      await streamController.close();
      await channel.unsubscribe();
    }

    streamController = StreamController.broadcast(
      onListen: onListen,
      onCancel: onCancel,
    );
    return streamController.stream.distinct();
  }

  /// Retrieves a paginated list of subjects.
  Future<Iterable<Subject>> getSubjects({
    required int offset,
    required int limit,
  }) async {
    return await supabase
        .from(subjectsTableName)
        .select()
        .range(offset, offset + limit)
        .withConverter((rows) => rows.map(Subject.fromJson));
  }

  /// Watches a paginated list of subjects.
  Stream<Iterable<Subject>> watchPaginatedSubjects({
    required int offset,
    required int limit,
  }) {
    late StreamController<Iterable<Subject>> streamController;
    late RealtimeChannel channel;

    Future<void> emitSubjects() async {
      final subjects = await getSubjects(offset: offset, limit: limit);
      if (streamController.isClosed) return;
      streamController.add(subjects);
    }

    Future<void> onListen() async {
      await emitSubjects();
      if (streamController.isClosed) return;
      channel = supabase
          .channel('watch-paginated-subjects')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            table: subjectsTableName,
            callback: (payload) async {
              if (streamController.isClosed) return;
              await emitSubjects();
            },
          )
          .subscribe();
    }

    Future<void> onCancel() async {
      await streamController.close();
      await channel.unsubscribe();
    }

    streamController = StreamController.broadcast(
      onListen: onListen,
      onCancel: onCancel,
    );
    return streamController.stream.distinct(subjectsIterableEquality.equals);
  }

  /// Updates a subject.
  Future<Subject> updateSubject(Subject subject) async {
    final results = await supabase
        .from(subjectsTableName)
        .update(subject.toMap())
        .eq(Subject.idColumnName, subject.id)
        .select()
        .withConverter((rows) => rows.map(Subject.fromJson));
    return results.single;
  }

  /// Deletes a subject by its [id].
  Future<void> deleteSubjectById(int id) async {
    await supabase
        .from(subjectsTableName)
        .delete()
        .eq(Subject.idColumnName, id);
  }
}
