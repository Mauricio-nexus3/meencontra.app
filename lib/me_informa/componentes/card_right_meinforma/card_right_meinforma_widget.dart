import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/login/componentes/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'card_right_meinforma_model.dart';
export 'card_right_meinforma_model.dart';

class CardRightMeinformaWidget extends StatefulWidget {
  const CardRightMeinformaWidget({
    super.key,
    this.parameter1,
    required this.tituloCategoria,
  });

  final List<MateriasRecord>? parameter1;
  final String? tituloCategoria;

  @override
  State<CardRightMeinformaWidget> createState() =>
      _CardRightMeinformaWidgetState();
}

class _CardRightMeinformaWidgetState extends State<CardRightMeinformaWidget> {
  late CardRightMeinformaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardRightMeinformaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0.8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget!.tituloCategoria,
                      'Titulo',
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).accent2,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent3,
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Builder(
                  builder: (context) {
                    final comunidade =
                        (widget!.parameter1?.toList() ?? []).take(5).toList();

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(comunidade.length, (comunidadeIndex) {
                        final comunidadeItem = comunidade[comunidadeIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CARD_RIGHT_MEINFORMA_Text_fu1dlyc6_ON_TA');
                                      if (loggedIn == true) {
                                        context.pushNamed(
                                          'meinformaDetalhesNoticia',
                                          queryParameters: {
                                            'materiadoc': serializeParam(
                                              comunidadeItem,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'materiadoc': comunidadeItem,
                                          },
                                        );
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    UsarDeslogadoUsoExclusivoCompWidget(
                                                  usoExclusivo: false,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    },
                                    child: Text(
                                      comunidadeItem.tituloMateria,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            Divider(
                              thickness: 0.8,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        );
                      }),
                    );
                  },
                ),
              ),
            ].divide(SizedBox(height: 16.0)).around(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
