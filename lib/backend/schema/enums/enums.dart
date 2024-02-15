import 'package:collection/collection.dart';

enum EquipeMeencontra {
  Admin,
  Equipe,
}

enum EquipeAnunciante {
  Gerente,
  Equipe,
}

enum Templetes {
  ecomerce,
  delivery,
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
    case (EquipeMeencontra):
      return EquipeMeencontra.values.deserialize(value) as T?;
    case (EquipeAnunciante):
      return EquipeAnunciante.values.deserialize(value) as T?;
    case (Templetes):
      return Templetes.values.deserialize(value) as T?;
    default:
      return null;
  }
}
