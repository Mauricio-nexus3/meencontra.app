import '/assinatura/selos_anunciante/selos_anunciante_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'resultado_algolia_anunciantes_model.dart';
export 'resultado_algolia_anunciantes_model.dart';

class ResultadoAlgoliaAnunciantesWidget extends StatefulWidget {
  const ResultadoAlgoliaAnunciantesWidget({
    super.key,
    this.logo,
    this.nome,
    this.planoAssinatura,
    this.endereco,
    this.categoria,
    this.subCategoria,
    required this.parameter7,
    this.resgatado,
  });

  final String? logo;
  final String? nome;
  final String? planoAssinatura;
  final String? endereco;
  final String? categoria;
  final String? subCategoria;
  final AnuncianteRecord? parameter7;
  final bool? resgatado;

  @override
  State<ResultadoAlgoliaAnunciantesWidget> createState() =>
      _ResultadoAlgoliaAnunciantesWidgetState();
}

class _ResultadoAlgoliaAnunciantesWidgetState
    extends State<ResultadoAlgoliaAnunciantesWidget> {
  late ResultadoAlgoliaAnunciantesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultadoAlgoliaAnunciantesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('RESULTADO_ALGOLIA_ANUNCIANTES_Row_76uzva');

            context.pushNamed(
              'AnunciantePerfil',
              queryParameters: {
                'referenciaAnunciante': serializeParam(
                  widget!.parameter7?.reference,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent3,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                ),
                child: Container(
                  width: 34.0,
                  height: 34.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    widget!.logo!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Text(
                              widget!.nome!.maybeHandleOverflow(maxChars: 22),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.selosAnuncianteModel,
                            updateCallback: () => safeSetState(() {}),
                            child: SelosAnuncianteWidget(
                              planoAnunciante: widget!.planoAssinatura!,
                              tamanhoPequenoNormalGrande: 'Pequeno',
                              resgatado: widget!.resgatado!,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '${widget!.categoria}, ${widget!.subCategoria}',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).accent1,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ),
              FlutterFlowIconButton(
                borderRadius: 20.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 20.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
    );
  }
}
