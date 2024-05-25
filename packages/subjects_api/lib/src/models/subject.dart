import 'dart:ui';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:subjects_api/src/mappers/mappers.dart';

part 'subject.mapper.dart';

/// {@template subjects_api.subject}
/// # Subject
///
/// A subject that can be taught in a school.
/// {@endtemplate}
@MappableClass(
  includeCustomMappers: [
    Int32ColorMapper(),
  ],
)
class Subject with SubjectMappable {
  /// {@macro subjects_api.subject}
  const Subject({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.color,
    required this.ordinalPosition,
  });

  /// The name of the ID column in the database.
  static final idColumnName = SubjectMapper._f$id.key;

  /// The name of the ordinal position column in the database.
  static final ordinalPositionColumnName = SubjectMapper._f$ordinalPosition.key;

  /// The ID of the subject.
  final int id;

  /// The name of the subject.
  final String name;

  /// The abbreviation of the subject.
  final String abbreviation;

  /// The color of the subject.
  final Color color;

  /// The ordinal position of the subject.
  final int ordinalPosition;

  /// Creates a [Subject] from a JSON object.
  static const fromJson = SubjectMapper.fromMap;
}
