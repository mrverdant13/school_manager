import 'dart:ui';

import 'package:dart_mappable/dart_mappable.dart';

/// {@template subjects_api.int_32_color_mapper}
/// # Int-32 Color Mapper
///
/// A [SimpleMapper] that encodes and decodes [Color] objects as 32-bit signed
/// integers.
/// {@endtemplate}
class Int32ColorMapper extends SimpleMapper<Color> {
  /// {@macro subjects_api.int_32_color_mapper}
  const Int32ColorMapper();

  @override
  Color decode(dynamic value) {
    return Color(value as int);
  }

  @override
  int encode(Color self) {
    return self.value.toSigned(32);
  }
}
