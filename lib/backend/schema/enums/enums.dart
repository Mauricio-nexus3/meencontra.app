import 'package:collection/collection.dart';

enum Templetes {
  Ecommerce,
  Gastronomico,
  Juridico,
  Tecnologia,
  Entreterimento,
  Moda,
  Marketing,
  Saude,
  Autonomo,
}

enum TelasMenuDrawer {
  Inicio,
  categorias,
  meinforma,
  mecontrata,
  mediverte,
  Meu_negocio,
  Painel_administrativo,
  Catalogo,
  Editar_perfil,
  Anunciar_vaga,
  Clube_Assinante,
  Anuncie_conosco,
  Fale_meencontre,
  Suporte,
  Assinatura,
  Configuracoes,
  Teste_Atual,
  dashboard_me,
  perfil,
}

enum PerfilUsuario {
  Admin,
  Anunciante,
  Imprensa,
  Usuario,
  Assinante,
}

enum PlanoAssinatura {
  gratis,
  meencontra,
  medestaca,
  meimpulsiona,
  medestacaplus,
  meimpulsionaPlus,
}

enum BoolToString {
  Sim,
  Nao,
}

enum TipoAlerta {
  confirmacao,
  alerta,
  exclusao,
}

enum Status {
  novo,
  editar,
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
    case (Templetes):
      return Templetes.values.deserialize(value) as T?;
    case (TelasMenuDrawer):
      return TelasMenuDrawer.values.deserialize(value) as T?;
    case (PerfilUsuario):
      return PerfilUsuario.values.deserialize(value) as T?;
    case (PlanoAssinatura):
      return PlanoAssinatura.values.deserialize(value) as T?;
    case (BoolToString):
      return BoolToString.values.deserialize(value) as T?;
    case (TipoAlerta):
      return TipoAlerta.values.deserialize(value) as T?;
    case (Status):
      return Status.values.deserialize(value) as T?;
    default:
      return null;
  }
}
