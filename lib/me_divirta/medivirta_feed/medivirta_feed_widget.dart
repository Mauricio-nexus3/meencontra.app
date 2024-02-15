import '/auth/base_auth_user_provider.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/login/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'medivirta_feed_model.dart';
export 'medivirta_feed_model.dart';

class MedivirtaFeedWidget extends StatefulWidget {
  const MedivirtaFeedWidget({
    super.key,
    this.parameter1,
    required this.parameter2,
    required this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
    required this.parameter7,
    required this.parameter8,
    this.parameter9,
  });

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final String? parameter4;
  final String? parameter5;
  final DocumentReference? parameter6;
  final String? parameter7;
  final String? parameter8;
  final String? parameter9;

  @override
  State<MedivirtaFeedWidget> createState() => _MedivirtaFeedWidgetState();
}

class _MedivirtaFeedWidgetState extends State<MedivirtaFeedWidget>
    with TickerProviderStateMixin {
  late MedivirtaFeedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedivirtaFeedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (loggedIn == true) {
            context.pushNamed(
              'meDivirtiDetalhesEvento',
              queryParameters: {
                'eventoRef': serializeParam(
                  widget.parameter6,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
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
        child: Material(
          color: Colors.transparent,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Container(
            width: 280.0,
            height: 270.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8.0,
                  color: Color(0x190F1113),
                  offset: Offset(0.0, 4.0),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              border: Border.all(
                color: FlutterFlowTheme.of(context).accent4,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 200),
                            fadeOutDuration: Duration(milliseconds: 200),
                            imageUrl: widget.parameter1!,
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 12.0, 8.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 4.0, 8.0, 4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        widget.parameter2!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        widget.parameter3!,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (widget.parameter4 != null &&
                                widget.parameter4 != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 12.0, 8.0, 0.0),
                                child: Container(
                                  width: 35.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Icon(
                                    Icons.confirmation_num_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'meDivirtiDetalhesEvento',
                              queryParameters: {
                                'eventoRef': serializeParam(
                                  widget.parameter6,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.parameter5!,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_outward_sharp,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.kcalendario,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 16.0,
                                ),
                                Text(
                                  widget.parameter7!,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.access_time_sharp,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 16.0,
                                ),
                                Text(
                                  widget.parameter8!,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              FFIcons.kpikerMap,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 16.0,
                            ),
                            Flexible(
                              child: Text(
                                widget.parameter9!.maybeHandleOverflow(
                                  maxChars: 30,
                                  replacement: '…',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
