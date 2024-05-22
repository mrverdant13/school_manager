import 'package:dart_mappable/dart_mappable.dart';

part 'subject.mapper.dart';

/// {@template subjects_api.subject}
/// # Subject
///
/// A subject that can be taught in a school.
/// {@endtemplate}
@MappableClass()
class Subject with SubjectMappable {
  /// {@macro subjects_api.subject}
  const Subject({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.color,
  });

  /// The name of the ID column in the database.
  static final idColumnName = SubjectMapper._f$id.key;

  /// The ID of the subject.
  final int id;

  /// The name of the subject.
  final String name;

  /// The abbreviation of the subject.
  final String abbreviation;

  /// The color of the subject.
  final int color;

  /// Creates a [Subject] from a JSON object.
  static const fromJson = SubjectMapper.fromMap;
}
