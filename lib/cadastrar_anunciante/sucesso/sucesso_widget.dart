import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'sucesso_model.dart';
export 'sucesso_model.dart';

class SucessoWidget extends StatefulWidget {
  const SucessoWidget({
    super.key,
    required this.anuncianteREF,
  });

  final DocumentReference? anuncianteREF;

  @override
  State<SucessoWidget> createState() => _SucessoWidgetState();
}

class _SucessoWidgetState extends State<SucessoWidget> {
  late SucessoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SucessoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Parabens!',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontSize: 32.0,
                            ),
                      ),
                      Text(
                        'Sua assinatura está ativa',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_xlkxtmul.json',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                    frameRate: FrameRate(60.0),
                    repeat: false,
                    animate: true,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Lembre-se que um perfil atualizado com publicações de produtos e serviços ajudam o cliente a encontrar seu perfil',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                      ),
                    ]
                        .divide(SizedBox(height: 18.0))
                        .around(SizedBox(height: 18.0)),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'ConcluirCadastro',
                        queryParameters: {
                          'anuncianteRef': serializeParam(
                            widget.anuncianteREF,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: 'Avançar',
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.white,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
