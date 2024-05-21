import 'package:dart_mappable/dart_mappable.dart';

part 'create_subject_dto.mapper.dart';

/// {@template subjects_api.create_subject_dto}
/// # Create Subject DTO
///
/// A DTO that contains the information needed to create a new subject.
/// {@endtemplate}
@MappableClass()
class CreateSubjectDto with CreateSubjectDtoMappable {
  /// {@macro subjects_api.create_subject_dto}
  const CreateSubjectDto({
    required this.name,
    required this.abbreviation,
    required this.color,
  });

  /// The name of the subject.
  final String name;

  /// The abbreviation of the subject.
  final String abbreviation;

  /// The color of the subject.
  final int color;
}
