import 'package:dart_mappable/dart_mappable.dart';

part 'competence.mapper.dart';

/// {@template subjects_api.competence}
/// # Competence
///
/// A competence that a subject can teach.
/// {@endtemplate}
@MappableClass()
class Competence with CompetenceMappable {
  /// {@macro subjects_api.competence}
  const Competence({
    required this.id,
    required this.subjectId,
    required this.name,
  });

  /// The name of the ID column in the database.
  static final idColumnName = CompetenceMapper._f$id.key;

  /// The name of the subject ID column in the database.
  static final subjectIdColumnName = CompetenceMapper._f$subjectId.key;

  /// The ID of the competence.
  final int id;

  /// The ID of the subject that teaches the competence.
  final int subjectId;

  /// The name of the competence.
  final String name;

  /// Creates a [Competence] from a JSON object.
  static const fromJson = CompetenceMapper.fromMap;
}
