import '/anunciante/componentes/map_google/map_google_widget.dart';
import '/anunciante/new_componentes/avaliacoes/avaliacoes_widget.dart';
import '/anunciante/new_componentes/card_produto/card_produto_widget.dart';
import '/anunciante/new_componentes/grid_produto/grid_produto_widget.dart';
import '/anunciante/new_componentes/mostrar_lista_componente/mostrar_lista_componente_widget.dart';
import '/anunciante/new_componentes/sobre_anunciante/sobre_anunciante_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'templete_anunciante_widget.dart' show TempleteAnuncianteWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TempleteAnuncianteModel
    extends FlutterFlowModel<TempleteAnuncianteWidget> {
  ///  Local state fields for this component.

  bool mostrarEmLista = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for mostrarListaComponente component.
  late MostrarListaComponenteModel mostrarListaComponenteModel1;
  // Model for mostrarListaComponente component.
  late MostrarListaComponenteModel mostrarListaComponenteModel2;
  // Model for mostrarListaComponente component.
  late MostrarListaComponenteModel mostrarListaComponenteModel3;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mostrarListaComponenteModel1 =
        createModel(context, () => MostrarListaComponenteModel());
    mostrarListaComponenteModel2 =
        createModel(context, () => MostrarListaComponenteModel());
    mostrarListaComponenteModel3 =
        createModel(context, () => MostrarListaComponenteModel());
  }

  @override
  void dispose() {
    mostrarListaComponenteModel1.dispose();
    mostrarListaComponenteModel2.dispose();
    mostrarListaComponenteModel3.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
