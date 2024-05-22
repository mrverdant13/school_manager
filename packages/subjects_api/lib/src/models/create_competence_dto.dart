import 'package:dart_mappable/dart_mappable.dart';

part 'create_competence_dto.mapper.dart';

/// {@template subjects_api.create_competence_dto}
/// # Create Competence DTO
///
/// A DTO that contains the information needed to create a new competence for a
/// subject.
/// {@endtemplate}
@MappableClass()
class CreateCompetenceDto with CreateCompetenceDtoMappable {
  /// {@macro subjects_api.create_competence_dto}
  const CreateCompetenceDto({
    required this.subjectId,
    required this.name,
  });

  /// The ID of the subject that teaches the competence.
  final int subjectId;

  /// The name of the subject.
  final String name;
}
