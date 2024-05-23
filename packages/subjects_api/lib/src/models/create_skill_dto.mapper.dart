// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_skill_dto.dart';

class CreateSkillDtoMapper extends ClassMapperBase<CreateSkillDto> {
  CreateSkillDtoMapper._();

  static CreateSkillDtoMapper? _instance;
  static CreateSkillDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateSkillDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CreateSkillDto';

  static int _$competenceId(CreateSkillDto v) => v.competenceId;
  static const Field<CreateSkillDto, int> _f$competenceId =
      Field('competenceId', _$competenceId, key: 'competence_id');
  static String _$name(CreateSkillDto v) => v.name;
  static const Field<CreateSkillDto, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<CreateSkillDto> fields = const {
    #competenceId: _f$competenceId,
    #name: _f$name,
  };

  static CreateSkillDto _instantiate(DecodingData data) {
    return CreateSkillDto(
        competenceId: data.dec(_f$competenceId), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static CreateSkillDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateSkillDto>(map);
  }

  static CreateSkillDto fromJson(String json) {
    return ensureInitialized().decodeJson<CreateSkillDto>(json);
  }
}

mixin CreateSkillDtoMappable {
  String toJson() {
    return CreateSkillDtoMapper.ensureInitialized()
        .encodeJson<CreateSkillDto>(this as CreateSkillDto);
  }

  Map<String, dynamic> toMap() {
    return CreateSkillDtoMapper.ensureInitialized()
        .encodeMap<CreateSkillDto>(this as CreateSkillDto);
  }

  CreateSkillDtoCopyWith<CreateSkillDto, CreateSkillDto, CreateSkillDto>
      get copyWith => _CreateSkillDtoCopyWithImpl(
          this as CreateSkillDto, $identity, $identity);
  @override
  String toString() {
    return CreateSkillDtoMapper.ensureInitialized()
        .stringifyValue(this as CreateSkillDto);
  }

  @override
  bool operator ==(Object other) {
    return CreateSkillDtoMapper.ensureInitialized()
        .equalsValue(this as CreateSkillDto, other);
  }

  @override
  int get hashCode {
    return CreateSkillDtoMapper.ensureInitialized()
        .hashValue(this as CreateSkillDto);
  }
}

extension CreateSkillDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateSkillDto, $Out> {
  CreateSkillDtoCopyWith<$R, CreateSkillDto, $Out> get $asCreateSkillDto =>
      $base.as((v, t, t2) => _CreateSkillDtoCopyWithImpl(v, t, t2));
}

abstract class CreateSkillDtoCopyWith<$R, $In extends CreateSkillDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? competenceId, String? name});
  CreateSkillDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CreateSkillDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateSkillDto, $Out>
    implements CreateSkillDtoCopyWith<$R, CreateSkillDto, $Out> {
  _CreateSkillDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateSkillDto> $mapper =
      CreateSkillDtoMapper.ensureInitialized();
  @override
  $R call({int? competenceId, String? name}) => $apply(FieldCopyWithData({
        if (competenceId != null) #competenceId: competenceId,
        if (name != null) #name: name
      }));
  @override
  CreateSkillDto $make(CopyWithData data) => CreateSkillDto(
      competenceId: data.get(#competenceId, or: $value.competenceId),
      name: data.get(#name, or: $value.name));

  @override
  CreateSkillDtoCopyWith<$R2, CreateSkillDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CreateSkillDtoCopyWithImpl($value, $cast, t);
}
