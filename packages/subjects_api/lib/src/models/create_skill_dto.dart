import 'package:dart_mappable/dart_mappable.dart';

part 'create_skill_dto.mapper.dart';

/// {@template subjects_api.create_skill_dto}
/// # Create Skill DTO
///
/// A DTO that contains the information needed to create a new skill for a
/// competence.
/// {@endtemplate}
@MappableClass()
class CreateSkillDto with CreateSkillDtoMappable {
  /// {@macro subjects_api.skill}
  const CreateSkillDto({
    required this.competenceId,
    required this.name,
  });

  /// The ID of the competence that includes the skill.
  final int competenceId;

  /// The name of the skill.
  final String name;
}
