import 'package:dart_mappable/dart_mappable.dart';

part 'skill.mapper.dart';

/// {@template subjects_api.skill}
/// # Skill
///
/// A skill that a competence includes.
/// {@endtemplate}
@MappableClass()
class Skill with SkillMappable {
  /// {@macro subjects_api.skill}
  const Skill({
    required this.id,
    required this.competenceId,
    required this.name,
  });

  /// The name of the ID column in the database.
  static final idColumnName = SkillMapper._f$id.key;

  /// The name of the competence ID column in the database.
  static final competenceIdColumnName = SkillMapper._f$competenceId.key;

  /// The ID of the skill.
  final int id;

  /// The ID of the competence that includes the skill.
  final int competenceId;

  /// The name of the skill.
  final String name;

  /// Creates a [Skill] from a JSON object.
  static const fromJson = SkillMapper.fromMap;
}
