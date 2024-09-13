import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/login/componentes/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'mecontrata_feed_model.dart';
export 'mecontrata_feed_model.dart';

class MecontrataFeedWidget extends StatefulWidget {
  const MecontrataFeedWidget({
    super.key,
    required this.parameter4,
  });

  final MeContrataVAGASRecord? parameter4;

  @override
  State<MecontrataFeedWidget> createState() => _MecontrataFeedWidgetState();
}

class _MecontrataFeedWidgetState extends State<MecontrataFeedWidget>
    with TickerProviderStateMixin {
  late MecontrataFeedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MecontrataFeedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
      child: Material(
        color: Colors.transparent,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: valueOrDefault<double>(
            MediaQuery.sizeOf(context).width > 1080.0 ? 340.0 : 314.0,
            314.0,
          ),
          height: MediaQuery.sizeOf(context).width > 1080.0 ? 240.0 : 200.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).accent4,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('MECONTRATA_FEED_Column_mr0ihjhn_ON_TAP');
                if (loggedIn == true) {
                  context.pushNamed(
                    'meContrataDetalhesVaga',
                    queryParameters: {
                      'vagaRef': serializeParam(
                        widget!.parameter4,
                        ParamType.Document,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'vagaRef': widget!.parameter4,
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
                          padding: MediaQuery.viewInsetsOf(context),
                          child: UsarDeslogadoUsoExclusivoCompWidget(
                            usoExclusivo: true,
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48.0,
                        height: 48.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          widget!.parameter4!.logoEmpresa,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget!.parameter4?.nomeVaga,
                                'nome vaga',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: MediaQuery.sizeOf(context).width >
                                            1080.0
                                        ? 20.0
                                        : 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget!.parameter4?.nomeEmpresa,
                                'empresa nome',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: MediaQuery.sizeOf(context).width >
                                            1080.0
                                        ? 14.0
                                        : 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            valueOrDefault<String>(
                              widget!.parameter4?.descricao,
                              'empresa descricao',
                            ).maybeHandleOverflow(
                              maxChars: 150,
                              replacement: '…',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Inter',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FFIcons.kpikerMap,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 16.0,
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.parameter4?.localidade,
                              'empresa local',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.dollarSign,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 16.0,
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.parameter4?.salario,
                              'empresa salario',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.home_work_outlined,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 16.0,
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget!.parameter4?.contratoTrabalho,
                                'empresa contrato',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ),
                    ].divide(SizedBox(width: 4.0)),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
