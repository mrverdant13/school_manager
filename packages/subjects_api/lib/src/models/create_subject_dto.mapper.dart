// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_subject_dto.dart';

class CreateSubjectDtoMapper extends ClassMapperBase<CreateSubjectDto> {
  CreateSubjectDtoMapper._();

  static CreateSubjectDtoMapper? _instance;
  static CreateSubjectDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateSubjectDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CreateSubjectDto';

  static String _$name(CreateSubjectDto v) => v.name;
  static const Field<CreateSubjectDto, String> _f$name = Field('name', _$name);
  static String _$abbreviation(CreateSubjectDto v) => v.abbreviation;
  static const Field<CreateSubjectDto, String> _f$abbreviation =
      Field('abbreviation', _$abbreviation);
  static int _$color(CreateSubjectDto v) => v.color;
  static const Field<CreateSubjectDto, int> _f$color = Field('color', _$color);

  @override
  final MappableFields<CreateSubjectDto> fields = const {
    #name: _f$name,
    #abbreviation: _f$abbreviation,
    #color: _f$color,
  };

  static CreateSubjectDto _instantiate(DecodingData data) {
    return CreateSubjectDto(
        name: data.dec(_f$name),
        abbreviation: data.dec(_f$abbreviation),
        color: data.dec(_f$color));
  }

  @override
  final Function instantiate = _instantiate;

  static CreateSubjectDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateSubjectDto>(map);
  }

  static CreateSubjectDto fromJson(String json) {
    return ensureInitialized().decodeJson<CreateSubjectDto>(json);
  }
}

mixin CreateSubjectDtoMappable {
  String toJson() {
    return CreateSubjectDtoMapper.ensureInitialized()
        .encodeJson<CreateSubjectDto>(this as CreateSubjectDto);
  }

  Map<String, dynamic> toMap() {
    return CreateSubjectDtoMapper.ensureInitialized()
        .encodeMap<CreateSubjectDto>(this as CreateSubjectDto);
  }

  CreateSubjectDtoCopyWith<CreateSubjectDto, CreateSubjectDto, CreateSubjectDto>
      get copyWith => _CreateSubjectDtoCopyWithImpl(
          this as CreateSubjectDto, $identity, $identity);
  @override
  String toString() {
    return CreateSubjectDtoMapper.ensureInitialized()
        .stringifyValue(this as CreateSubjectDto);
  }

  @override
  bool operator ==(Object other) {
    return CreateSubjectDtoMapper.ensureInitialized()
        .equalsValue(this as CreateSubjectDto, other);
  }

  @override
  int get hashCode {
    return CreateSubjectDtoMapper.ensureInitialized()
        .hashValue(this as CreateSubjectDto);
  }
}

extension CreateSubjectDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateSubjectDto, $Out> {
  CreateSubjectDtoCopyWith<$R, CreateSubjectDto, $Out>
      get $asCreateSubjectDto =>
          $base.as((v, t, t2) => _CreateSubjectDtoCopyWithImpl(v, t, t2));
}

abstract class CreateSubjectDtoCopyWith<$R, $In extends CreateSubjectDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? abbreviation, int? color});
  CreateSubjectDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CreateSubjectDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateSubjectDto, $Out>
    implements CreateSubjectDtoCopyWith<$R, CreateSubjectDto, $Out> {
  _CreateSubjectDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateSubjectDto> $mapper =
      CreateSubjectDtoMapper.ensureInitialized();
  @override
  $R call({String? name, String? abbreviation, int? color}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (abbreviation != null) #abbreviation: abbreviation,
        if (color != null) #color: color
      }));
  @override
  CreateSubjectDto $make(CopyWithData data) => CreateSubjectDto(
      name: data.get(#name, or: $value.name),
      abbreviation: data.get(#abbreviation, or: $value.abbreviation),
      color: data.get(#color, or: $value.color));

  @override
  CreateSubjectDtoCopyWith<$R2, CreateSubjectDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CreateSubjectDtoCopyWithImpl($value, $cast, t);
}
