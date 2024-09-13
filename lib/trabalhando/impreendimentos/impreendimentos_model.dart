import '/anunciante/componentes/mostrar_cards_lista/mostrar_cards_lista_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'impreendimentos_widget.dart' show ImpreendimentosWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ImpreendimentosModel extends FlutterFlowModel<ImpreendimentosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for mostrarCardsLista component.
  late MostrarCardsListaModel mostrarCardsListaModel;

  @override
  void initState(BuildContext context) {
    mostrarCardsListaModel =
        createModel(context, () => MostrarCardsListaModel());
  }

  @override
  void dispose() {
    mostrarCardsListaModel.dispose();
  }
}
