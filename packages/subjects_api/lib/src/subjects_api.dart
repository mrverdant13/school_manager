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

  /// The name of the table that contains subject competences.
  @visibleForTesting
  static const subjectCompetencesTableName = 'subject_competences';

  /// The name of the table that contains competence skills.
  @visibleForTesting
  static const competenceSkillsTableName = 'competence_skills';

  /// The equality utility used to compare [Iterable]s of [Subject]s.
  static const IterableEquality<Subject> subjectsIterableEquality =
      IterableEquality();

  /// The equality utility used to compare [Iterable]s of [Competence]s.
  static const IterableEquality<Competence> competencesIterableEquality =
      IterableEquality();

  /// The equality utility used to compare [Iterable]s of [Skill]s.
  static const IterableEquality<Skill> skillsIterableEquality =
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

  /// Watches a subject by its [id].
  Stream<Subject> watchSubjectById(int id) {
    return supabase
        .from(subjectsTableName)
        .stream(primaryKey: [Subject.idColumnName])
        .eq(Subject.idColumnName, id)
        .map((rows) => Subject.fromJson(rows.single));
  }

  /// Retrieves a paginated list of subjects.
  Future<Iterable<Subject>> getSubjects({
    required int offset,
    required int limit,
  }) async {
    return await supabase
        .from(subjectsTableName)
        .select()
        .order(Subject.ordinalPositionColumnName, ascending: true)
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
    return supabase
        .from(subjectsTableName)
        .update(subject.toMap())
        .eq(Subject.idColumnName, subject.id)
        .select()
        .single()
        .withConverter(Subject.fromJson);
  }

  /// Deletes a subject by its [id].
  Future<Subject> deleteSubjectById(int id) async {
    return supabase
        .from(subjectsTableName)
        .delete()
        .eq(Subject.idColumnName, id)
        .select()
        .single()
        .withConverter(Subject.fromJson);
  }

  /// Creates a competence for a subject.
  Future<Competence> createCompetence(
    CreateCompetenceDto createCompetenceDto,
  ) async {
    return supabase
        .from(subjectCompetencesTableName)
        .insert(createCompetenceDto.toMap())
        .select()
        .single()
        .withConverter(Competence.fromJson);
  }

  /// Retrieves the quantity of competences that correspond to a subject with
  /// the given [subjectId].
  Future<int> getCompetencesCountBySubjectId(
    int subjectId,
  ) async {
    final result = await supabase
        .from(subjectCompetencesTableName)
        .select()
        .eq(Competence.subjectIdColumnName, subjectId)
        .count();
    return result.count;
  }

  /// Watches the quantity of competences that correspond to a subject with the
  /// given [subjectId].
  Stream<int> watchCompetencesCountBySubjectId(
    int subjectId,
  ) {
    late StreamController<int> streamController;
    late RealtimeChannel channel;

    Future<void> emitCount() async {
      final count = await getCompetencesCountBySubjectId(subjectId);
      if (streamController.isClosed) return;
      streamController.add(count);
    }

    Future<void> onListen() async {
      await emitCount();
      if (streamController.isClosed) return;
      channel = supabase
          .channel('watch-competences-count-by-subject-id')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            table: subjectCompetencesTableName,
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

  /// Retrieves a paginated list of competences that correspond to a subject
  /// with the given [subjectId].
  Future<Iterable<Competence>> getCompetencesBySubjectId({
    required int subjectId,
    required int offset,
    required int limit,
  }) async {
    return await supabase
        .from(subjectCompetencesTableName)
        .select()
        .eq(Competence.subjectIdColumnName, subjectId)
        .order(Competence.ordinalPositionColumnName, ascending: true)
        .range(offset, offset + limit)
        .withConverter((rows) => rows.map(Competence.fromJson));
  }

  /// Watches a paginated list of competences that correspond to a subject with
  /// the given [subjectId].
  Stream<Iterable<Competence>> watchPaginatedCompetencesBySubjectId({
    required int subjectId,
    required int offset,
    required int limit,
  }) {
    late StreamController<Iterable<Competence>> streamController;
    late RealtimeChannel channel;

    Future<void> emitCompetences() async {
      final competences = await getCompetencesBySubjectId(
        subjectId: subjectId,
        offset: offset,
        limit: limit,
      );
      if (streamController.isClosed) return;
      streamController.add(competences);
    }

    Future<void> onListen() async {
      await emitCompetences();
      if (streamController.isClosed) return;
      channel = supabase
          .channel('watch-paginated-competences-by-subject-id')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            table: subjectCompetencesTableName,
            callback: (payload) async {
              if (streamController.isClosed) return;
              await emitCompetences();
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
    return streamController.stream.distinct(competencesIterableEquality.equals);
  }

  /// Updates a competence.
  Future<Competence> updateCompetence(Competence competence) async {
    return supabase
        .from(subjectCompetencesTableName)
        .update(competence.toMap())
        .eq(Competence.idColumnName, competence.id)
        .select()
        .single()
        .withConverter(Competence.fromJson);
  }

  /// Deletes a competence by its [id].
  Future<Competence> deleteCompetenceById(int id) async {
    return supabase
        .from(subjectCompetencesTableName)
        .delete()
        .eq(Competence.idColumnName, id)
        .select()
        .single()
        .withConverter(Competence.fromJson);
  }

  /// Create a skill for a competence.
  Future<Skill> createSkill(
    CreateSkillDto createSkillDto,
  ) async {
    return supabase
        .from(competenceSkillsTableName)
        .insert(createSkillDto.toMap())
        .select()
        .single()
        .withConverter(Skill.fromJson);
  }

  /// Watches a collection of skills that correspond to a competence with the
  /// given [competenceId].
  Stream<Iterable<Skill>> watchSkillsByCompetenceId(int competenceId) {
    return supabase
        .from(competenceSkillsTableName)
        .stream(primaryKey: [Skill.idColumnName])
        .eq(Skill.competenceIdColumnName, competenceId)
        .map((rows) => rows.map(Skill.fromJson))
        .distinct(skillsIterableEquality.equals);
  }

  /// Updates a skill.
  Future<Skill> updateSkill(Skill skill) async {
    return supabase
        .from(competenceSkillsTableName)
        .update(skill.toMap())
        .eq(Skill.idColumnName, skill.id)
        .select()
        .single()
        .withConverter(Skill.fromJson);
  }

  /// Deletes a skill by its [id].
  Future<Skill> deleteSkillById(int id) async {
    return supabase
        .from(competenceSkillsTableName)
        .delete()
        .eq(Skill.idColumnName, id)
        .select()
        .single()
        .withConverter(Skill.fromJson);
  }
}
