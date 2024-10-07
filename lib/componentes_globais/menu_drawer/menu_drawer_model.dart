import '/assinatura/estrela_bloqueio/estrela_bloqueio_widget.dart';
import '/assinatura/upgrade/upgrade_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_drawer_widget.dart' show MenuDrawerWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MenuDrawerModel extends FlutterFlowModel<MenuDrawerWidget> {
  ///  Local state fields for this component.

  bool menuDrawerOpen = true;

  Color pageON = Color(4285005984);

  Color pageOff = Color(4284903557);

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion_teste widget.
  bool mouseRegionTesteHovered = false;
  // State field(s) for MouseRegion_dash widget.
  bool mouseRegionDashHovered = false;
  // State field(s) for MouseRegion_Inicio widget.
  bool mouseRegionInicioHovered = false;
  // State field(s) for MouseRegion_meinforma widget.
  bool mouseRegionMeinformaHovered = false;
  // State field(s) for MouseRegion_mecontrata widget.
  bool mouseRegionMecontrataHovered = false;
  // State field(s) for MouseRegion_medivirta widget.
  bool mouseRegionMedivirtaHovered = false;
  // State field(s) for MouseR_cadastrarMeuNegocio widget.
  bool mouseRCadastrarMeuNegocioHovered = false;
  // State field(s) for MouseRegion_meuNegocio widget.
  bool mouseRegionMeuNegocioHovered = false;
  // State field(s) for MouseRegion_painelAdm widget.
  bool mouseRegionPainelAdmHovered = false;
  // State field(s) for MouseRegion_catalogo widget.
  bool mouseRegionCatalogoHovered = false;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel;
  // State field(s) for MouseR_suporte_Anunciante widget.
  bool mouseRSuporteAnuncianteHovered = false;
  // State field(s) for MouseRegion_perfil widget.
  bool mouseRegionPerfilHovered = false;
  // State field(s) for MouseRegion_anuncieVaga widget.
  bool mouseRegionAnuncieVagaHovered = false;
  // State field(s) for MouseRegion_club widget.
  bool mouseRegionClubHovered = false;
  // State field(s) for MouseRegion_anuncieME widget.
  bool mouseRegionAnuncieMEHovered = false;
  // State field(s) for MouseRegion_faleMe widget.
  bool mouseRegionFaleMeHovered = false;
  // State field(s) for MouseRegion_suporte_user widget.
  bool mouseRegionSuporteUserHovered = false;
  // State field(s) for MouseRegion_assinatura widget.
  bool mouseRegionAssinaturaHovered = false;
  // State field(s) for MouseRegion_config widget.
  bool mouseRegionConfigHovered = false;

  @override
  void initState(BuildContext context) {
    estrelaBloqueioModel = createModel(context, () => EstrelaBloqueioModel());
  }

  @override
  void dispose() {
    estrelaBloqueioModel.dispose();
  }
}
