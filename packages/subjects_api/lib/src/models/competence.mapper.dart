// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'competence.dart';

class CompetenceMapper extends ClassMapperBase<Competence> {
  CompetenceMapper._();

  static CompetenceMapper? _instance;
  static CompetenceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CompetenceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Competence';

  static int _$id(Competence v) => v.id;
  static const Field<Competence, int> _f$id = Field('id', _$id);
  static int _$subjectId(Competence v) => v.subjectId;
  static const Field<Competence, int> _f$subjectId =
      Field('subjectId', _$subjectId, key: 'subject_id');
  static String _$name(Competence v) => v.name;
  static const Field<Competence, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Competence> fields = const {
    #id: _f$id,
    #subjectId: _f$subjectId,
    #name: _f$name,
  };

  static Competence _instantiate(DecodingData data) {
    return Competence(
        id: data.dec(_f$id),
        subjectId: data.dec(_f$subjectId),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Competence fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Competence>(map);
  }

  static Competence fromJson(String json) {
    return ensureInitialized().decodeJson<Competence>(json);
  }
}

mixin CompetenceMappable {
  String toJson() {
    return CompetenceMapper.ensureInitialized()
        .encodeJson<Competence>(this as Competence);
  }

  Map<String, dynamic> toMap() {
    return CompetenceMapper.ensureInitialized()
        .encodeMap<Competence>(this as Competence);
  }

  CompetenceCopyWith<Competence, Competence, Competence> get copyWith =>
      _CompetenceCopyWithImpl(this as Competence, $identity, $identity);
  @override
  String toString() {
    return CompetenceMapper.ensureInitialized()
        .stringifyValue(this as Competence);
  }

  @override
  bool operator ==(Object other) {
    return CompetenceMapper.ensureInitialized()
        .equalsValue(this as Competence, other);
  }

  @override
  int get hashCode {
    return CompetenceMapper.ensureInitialized().hashValue(this as Competence);
  }
}

extension CompetenceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Competence, $Out> {
  CompetenceCopyWith<$R, Competence, $Out> get $asCompetence =>
      $base.as((v, t, t2) => _CompetenceCopyWithImpl(v, t, t2));
}

abstract class CompetenceCopyWith<$R, $In extends Competence, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, int? subjectId, String? name});
  CompetenceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CompetenceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Competence, $Out>
    implements CompetenceCopyWith<$R, Competence, $Out> {
  _CompetenceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Competence> $mapper =
      CompetenceMapper.ensureInitialized();
  @override
  $R call({int? id, int? subjectId, String? name}) => $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (subjectId != null) #subjectId: subjectId,
        if (name != null) #name: name
      }));
  @override
  Competence $make(CopyWithData data) => Competence(
      id: data.get(#id, or: $value.id),
      subjectId: data.get(#subjectId, or: $value.subjectId),
      name: data.get(#name, or: $value.name));

  @override
  CompetenceCopyWith<$R2, Competence, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CompetenceCopyWithImpl($value, $cast, t);
}
