// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'skill.dart';

class SkillMapper extends ClassMapperBase<Skill> {
  SkillMapper._();

  static SkillMapper? _instance;
  static SkillMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SkillMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Skill';

  static int _$id(Skill v) => v.id;
  static const Field<Skill, int> _f$id = Field('id', _$id);
  static int _$competenceId(Skill v) => v.competenceId;
  static const Field<Skill, int> _f$competenceId =
      Field('competenceId', _$competenceId, key: 'competence_id');
  static String _$name(Skill v) => v.name;
  static const Field<Skill, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Skill> fields = const {
    #id: _f$id,
    #competenceId: _f$competenceId,
    #name: _f$name,
  };

  static Skill _instantiate(DecodingData data) {
    return Skill(
        id: data.dec(_f$id),
        competenceId: data.dec(_f$competenceId),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Skill fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Skill>(map);
  }

  static Skill fromJson(String json) {
    return ensureInitialized().decodeJson<Skill>(json);
  }
}

mixin SkillMappable {
  String toJson() {
    return SkillMapper.ensureInitialized().encodeJson<Skill>(this as Skill);
  }

  Map<String, dynamic> toMap() {
    return SkillMapper.ensureInitialized().encodeMap<Skill>(this as Skill);
  }

  SkillCopyWith<Skill, Skill, Skill> get copyWith =>
      _SkillCopyWithImpl(this as Skill, $identity, $identity);
  @override
  String toString() {
    return SkillMapper.ensureInitialized().stringifyValue(this as Skill);
  }

  @override
  bool operator ==(Object other) {
    return SkillMapper.ensureInitialized().equalsValue(this as Skill, other);
  }

  @override
  int get hashCode {
    return SkillMapper.ensureInitialized().hashValue(this as Skill);
  }
}

extension SkillValueCopy<$R, $Out> on ObjectCopyWith<$R, Skill, $Out> {
  SkillCopyWith<$R, Skill, $Out> get $asSkill =>
      $base.as((v, t, t2) => _SkillCopyWithImpl(v, t, t2));
}

abstract class SkillCopyWith<$R, $In extends Skill, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, int? competenceId, String? name});
  SkillCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SkillCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Skill, $Out>
    implements SkillCopyWith<$R, Skill, $Out> {
  _SkillCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Skill> $mapper = SkillMapper.ensureInitialized();
  @override
  $R call({int? id, int? competenceId, String? name}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (competenceId != null) #competenceId: competenceId,
        if (name != null) #name: name
      }));
  @override
  Skill $make(CopyWithData data) => Skill(
      id: data.get(#id, or: $value.id),
      competenceId: data.get(#competenceId, or: $value.competenceId),
      name: data.get(#name, or: $value.name));

  @override
  SkillCopyWith<$R2, Skill, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SkillCopyWithImpl($value, $cast, t);
}
