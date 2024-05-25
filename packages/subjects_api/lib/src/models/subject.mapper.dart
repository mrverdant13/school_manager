// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'subject.dart';

class SubjectMapper extends ClassMapperBase<Subject> {
  SubjectMapper._();

  static SubjectMapper? _instance;
  static SubjectMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubjectMapper._());
      MapperContainer.globals.useAll([Int32ColorMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'Subject';

  static int _$id(Subject v) => v.id;
  static const Field<Subject, int> _f$id = Field('id', _$id);
  static String _$name(Subject v) => v.name;
  static const Field<Subject, String> _f$name = Field('name', _$name);
  static String _$abbreviation(Subject v) => v.abbreviation;
  static const Field<Subject, String> _f$abbreviation =
      Field('abbreviation', _$abbreviation);
  static Color _$color(Subject v) => v.color;
  static const Field<Subject, Color> _f$color = Field('color', _$color);
  static int _$ordinalPosition(Subject v) => v.ordinalPosition;
  static const Field<Subject, int> _f$ordinalPosition =
      Field('ordinalPosition', _$ordinalPosition, key: 'ordinal_position');

  @override
  final MappableFields<Subject> fields = const {
    #id: _f$id,
    #name: _f$name,
    #abbreviation: _f$abbreviation,
    #color: _f$color,
    #ordinalPosition: _f$ordinalPosition,
  };

  static Subject _instantiate(DecodingData data) {
    return Subject(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        abbreviation: data.dec(_f$abbreviation),
        color: data.dec(_f$color),
        ordinalPosition: data.dec(_f$ordinalPosition));
  }

  @override
  final Function instantiate = _instantiate;

  static Subject fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Subject>(map);
  }

  static Subject fromJson(String json) {
    return ensureInitialized().decodeJson<Subject>(json);
  }
}

mixin SubjectMappable {
  String toJson() {
    return SubjectMapper.ensureInitialized()
        .encodeJson<Subject>(this as Subject);
  }

  Map<String, dynamic> toMap() {
    return SubjectMapper.ensureInitialized()
        .encodeMap<Subject>(this as Subject);
  }

  SubjectCopyWith<Subject, Subject, Subject> get copyWith =>
      _SubjectCopyWithImpl(this as Subject, $identity, $identity);
  @override
  String toString() {
    return SubjectMapper.ensureInitialized().stringifyValue(this as Subject);
  }

  @override
  bool operator ==(Object other) {
    return SubjectMapper.ensureInitialized()
        .equalsValue(this as Subject, other);
  }

  @override
  int get hashCode {
    return SubjectMapper.ensureInitialized().hashValue(this as Subject);
  }
}

extension SubjectValueCopy<$R, $Out> on ObjectCopyWith<$R, Subject, $Out> {
  SubjectCopyWith<$R, Subject, $Out> get $asSubject =>
      $base.as((v, t, t2) => _SubjectCopyWithImpl(v, t, t2));
}

abstract class SubjectCopyWith<$R, $In extends Subject, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? name,
      String? abbreviation,
      Color? color,
      int? ordinalPosition});
  SubjectCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SubjectCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Subject, $Out>
    implements SubjectCopyWith<$R, Subject, $Out> {
  _SubjectCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Subject> $mapper =
      SubjectMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? name,
          String? abbreviation,
          Color? color,
          int? ordinalPosition}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (abbreviation != null) #abbreviation: abbreviation,
        if (color != null) #color: color,
        if (ordinalPosition != null) #ordinalPosition: ordinalPosition
      }));
  @override
  Subject $make(CopyWithData data) => Subject(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      abbreviation: data.get(#abbreviation, or: $value.abbreviation),
      color: data.get(#color, or: $value.color),
      ordinalPosition: data.get(#ordinalPosition, or: $value.ordinalPosition));

  @override
  SubjectCopyWith<$R2, Subject, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SubjectCopyWithImpl($value, $cast, t);
}
