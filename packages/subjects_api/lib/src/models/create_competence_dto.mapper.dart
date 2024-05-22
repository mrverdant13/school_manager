// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_competence_dto.dart';

class CreateCompetenceDtoMapper extends ClassMapperBase<CreateCompetenceDto> {
  CreateCompetenceDtoMapper._();

  static CreateCompetenceDtoMapper? _instance;
  static CreateCompetenceDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateCompetenceDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CreateCompetenceDto';

  static int _$subjectId(CreateCompetenceDto v) => v.subjectId;
  static const Field<CreateCompetenceDto, int> _f$subjectId =
      Field('subjectId', _$subjectId, key: 'subject_id');
  static String _$name(CreateCompetenceDto v) => v.name;
  static const Field<CreateCompetenceDto, String> _f$name =
      Field('name', _$name);

  @override
  final MappableFields<CreateCompetenceDto> fields = const {
    #subjectId: _f$subjectId,
    #name: _f$name,
  };

  static CreateCompetenceDto _instantiate(DecodingData data) {
    return CreateCompetenceDto(
        subjectId: data.dec(_f$subjectId), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static CreateCompetenceDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateCompetenceDto>(map);
  }

  static CreateCompetenceDto fromJson(String json) {
    return ensureInitialized().decodeJson<CreateCompetenceDto>(json);
  }
}

mixin CreateCompetenceDtoMappable {
  String toJson() {
    return CreateCompetenceDtoMapper.ensureInitialized()
        .encodeJson<CreateCompetenceDto>(this as CreateCompetenceDto);
  }

  Map<String, dynamic> toMap() {
    return CreateCompetenceDtoMapper.ensureInitialized()
        .encodeMap<CreateCompetenceDto>(this as CreateCompetenceDto);
  }

  CreateCompetenceDtoCopyWith<CreateCompetenceDto, CreateCompetenceDto,
          CreateCompetenceDto>
      get copyWith => _CreateCompetenceDtoCopyWithImpl(
          this as CreateCompetenceDto, $identity, $identity);
  @override
  String toString() {
    return CreateCompetenceDtoMapper.ensureInitialized()
        .stringifyValue(this as CreateCompetenceDto);
  }

  @override
  bool operator ==(Object other) {
    return CreateCompetenceDtoMapper.ensureInitialized()
        .equalsValue(this as CreateCompetenceDto, other);
  }

  @override
  int get hashCode {
    return CreateCompetenceDtoMapper.ensureInitialized()
        .hashValue(this as CreateCompetenceDto);
  }
}

extension CreateCompetenceDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateCompetenceDto, $Out> {
  CreateCompetenceDtoCopyWith<$R, CreateCompetenceDto, $Out>
      get $asCreateCompetenceDto =>
          $base.as((v, t, t2) => _CreateCompetenceDtoCopyWithImpl(v, t, t2));
}

abstract class CreateCompetenceDtoCopyWith<$R, $In extends CreateCompetenceDto,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? subjectId, String? name});
  CreateCompetenceDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CreateCompetenceDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateCompetenceDto, $Out>
    implements CreateCompetenceDtoCopyWith<$R, CreateCompetenceDto, $Out> {
  _CreateCompetenceDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateCompetenceDto> $mapper =
      CreateCompetenceDtoMapper.ensureInitialized();
  @override
  $R call({int? subjectId, String? name}) => $apply(FieldCopyWithData({
        if (subjectId != null) #subjectId: subjectId,
        if (name != null) #name: name
      }));
  @override
  CreateCompetenceDto $make(CopyWithData data) => CreateCompetenceDto(
      subjectId: data.get(#subjectId, or: $value.subjectId),
      name: data.get(#name, or: $value.name));

  @override
  CreateCompetenceDtoCopyWith<$R2, CreateCompetenceDto, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CreateCompetenceDtoCopyWithImpl($value, $cast, t);
}
