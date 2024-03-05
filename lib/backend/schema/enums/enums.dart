import 'package:collection/collection.dart';

enum Languages {
  ita,
  eng,
  spa,
  deu,
  fra,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Languages):
      return Languages.values.deserialize(value) as T?;
    default:
      return null;
  }
}
