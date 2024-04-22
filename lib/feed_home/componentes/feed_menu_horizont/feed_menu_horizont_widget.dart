import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/login/componentes/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'feed_menu_horizont_model.dart';
export 'feed_menu_horizont_model.dart';

class FeedMenuHorizontWidget extends StatefulWidget {
  const FeedMenuHorizontWidget({
    super.key,
    required this.paginaAtual,
    this.drawerAcao,
    this.notificacao,
  });

  final String? paginaAtual;
  final Future Function()? drawerAcao;
  final List<NotificacaoRecord>? notificacao;

  @override
  State<FeedMenuHorizontWidget> createState() => _FeedMenuHorizontWidgetState();
}

class _FeedMenuHorizontWidgetState extends State<FeedMenuHorizontWidget>
    with TickerProviderStateMixin {
  late FeedMenuHorizontModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedMenuHorizontModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FEED_MENU_HORIZONT_FeedMenuHorizont_ON_I');
      setState(() {
        _model.showMoreOptions = false;
      });
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(0.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent4,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.16,
                    decoration: BoxDecoration(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'FEED_MENU_HORIZONT_Image_52b75x4x_ON_TAP');

                        context.pushNamed(
                          'Feed',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/MEENCONTRA_VECTOR.png',
                          height: 28.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AlignedTooltip(
                            content: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  'Pagina Inicial',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                )),
                            offset: 4.0,
                            preferredDirection: AxisDirection.up,
                            borderRadius: BorderRadius.circular(8.0),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            tailBaseWidth: 24.0,
                            tailLength: 12.0,
                            waitDuration: Duration(milliseconds: 200),
                            showDuration: Duration(milliseconds: 200),
                            triggerMode: TooltipTriggerMode.tap,
                            child: MouseRegion(
                              opaque: true,
                              cursor:
                                  SystemMouseCursors.click ?? MouseCursor.defer,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'FEED_MENU_HORIZONT_Column_ikevfrlt_ON_TA');

                                  context.pushNamed('Feed');
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          _model.hover == 'Pagina inicial'
                                              ? FlutterFlowTheme.of(context)
                                                  .accent4
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Icon(
                                        FFIcons.khomeOFFStroke,
                                        color: widget.paginaAtual ==
                                                'Pagina inicial'
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .accent2,
                                        size: 28.0,
                                      ),
                                    ),
                                    if (widget.paginaAtual == 'Pagina inicial')
                                      Container(
                                        width: 100.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation1']!),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                              onEnter: ((event) async {
                                setState(
                                    () => _model.mouseRegion1Hovered = true);
                                logFirebaseEvent(
                                    'FEED_MENU_HORIZONT_MouseRegion1_ON_TOGGL');
                                setState(() {
                                  _model.hover = 'Pagina inicial';
                                });
                              }),
                              onExit: ((event) async {
                                setState(
                                    () => _model.mouseRegion1Hovered = false);
                                logFirebaseEvent(
                                    'FEED_MENU_HORIZONT_MouseRegion1_ON_TOGGL');
                                setState(() {
                                  _model.hover = 'null';
                                });
                              }),
                            ),
                          ),
                        ),
                        AlignedTooltip(
                          content: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Pesquisar',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              )),
                          offset: 4.0,
                          preferredDirection: AxisDirection.up,
                          borderRadius: BorderRadius.circular(8.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          tailBaseWidth: 24.0,
                          tailLength: 12.0,
                          waitDuration: Duration(milliseconds: 200),
                          showDuration: Duration(milliseconds: 200),
                          triggerMode: TooltipTriggerMode.tap,
                          child: MouseRegion(
                            opaque: true,
                            cursor:
                                SystemMouseCursors.click ?? MouseCursor.defer,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'FEED_MENU_HORIZONT_Column_zgcklj6x_ON_TA');

                                context.pushNamed('Categorias');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: _model.hover == 'Pesquisar'
                                          ? FlutterFlowTheme.of(context).accent4
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Icon(
                                      FFIcons.klupa,
                                      color: valueOrDefault<Color>(
                                        widget.paginaAtual == 'Pesquisar'
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .accent2,
                                        FlutterFlowTheme.of(context).accent2,
                                      ),
                                      size: 28.0,
                                    ),
                                  ),
                                  if (widget.paginaAtual == 'Pesquisar')
                                    Container(
                                      width: 100.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation2']!),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mouseRegionHovered1 = true);
                              logFirebaseEvent(
                                  'FEED_MENU_HORIZONT_MouseRegion_s968iw54_');
                              setState(() {
                                _model.hover = 'Pesquisar';
                              });
                            }),
                            onExit: ((event) async {
                              setState(
                                  () => _model.mouseRegionHovered1 = false);
                              logFirebaseEvent(
                                  'FEED_MENU_HORIZONT_MouseRegion_s968iw54_');
                              setState(() {
                                _model.hover = 'null';
                              });
                            }),
                          ),
                        ),
                        AlignedTooltip(
                          content: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'me informa',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              )),
                          offset: 4.0,
                          preferredDirection: AxisDirection.up,
                          borderRadius: BorderRadius.circular(8.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          tailBaseWidth: 24.0,
                          tailLength: 12.0,
                          waitDuration: Duration(milliseconds: 200),
                          showDuration: Duration(milliseconds: 100),
                          triggerMode: TooltipTriggerMode.tap,
                          child: MouseRegion(
                            opaque: true,
                            cursor:
                                SystemMouseCursors.click ?? MouseCursor.defer,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'FEED_MENU_HORIZONT_Column_ze78ej5u_ON_TA');
                                if (loggedIn == true) {
                                  context.pushNamed('meInforma');
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
                                              MediaQuery.viewInsetsOf(context),
                                          child:
                                              UsarDeslogadoUsoExclusivoCompWidget(
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
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: _model.hover == 'meinforma'
                                          ? FlutterFlowTheme.of(context).accent4
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Icon(
                                      FFIcons.kmeInformaON,
                                      color: widget.paginaAtual == 'meinforma'
                                          ? FlutterFlowTheme.of(context)
                                              .alternate
                                          : FlutterFlowTheme.of(context)
                                              .accent2,
                                      size: 28.0,
                                    ),
                                  ),
                                  if (widget.paginaAtual == 'meinforma')
                                    Container(
                                      width: 100.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation3']!),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mouseRegionHovered2 = true);
                              logFirebaseEvent(
                                  'FEED_MENU_HORIZONT_MouseRegion_ja786npo_');
                              setState(() {
                                _model.hover = 'meinforma';
                              });
                            }),
                            onExit: ((event) async {
                              setState(
                                  () => _model.mouseRegionHovered2 = false);
                              logFirebaseEvent(
                                  'FEED_MENU_HORIZONT_MouseRegion_ja786npo_');
                              setState(() {
                                _model.hover = 'null';
                              });
                            }),
                          ),
                        ),
                        AlignedTooltip(
                          content: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'me contrata',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              )),
                          offset: 4.0,
                          preferredDirection: AxisDirection.up,
                          borderRadius: BorderRadius.circular(8.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          tailBaseWidth: 24.0,
                          tailLength: 12.0,
                          waitDuration: Duration(milliseconds: 100),
                          showDuration: Duration(milliseconds: 100),
                          triggerMode: TooltipTriggerMode.tap,
                          child: MouseRegion(
                            opaque: true,
                            cursor:
                                SystemMouseCursors.click ?? MouseCursor.defer,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'FEED_MENU_HORIZONT_Column_avc7u6ka_ON_TA');
                                if (loggedIn == true) {
                                  context.pushNamed('meContrata');
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
                                              MediaQuery.viewInsetsOf(context),
                                          child:
                                              UsarDeslogadoUsoExclusivoCompWidget(
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
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: _model.hover == 'mecontrata'
                                          ? FlutterFlowTheme.of(context).accent4
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Icon(
                                      FFIcons.kmeContrataOFF,
                                      color: widget.paginaAtual == 'mecontrata'
                                          ? FlutterFlowTheme.of(context)
                                              .secondary
                                          : FlutterFlowTheme.of(context)
                                              .accent2,
                                      size: 28.0,
                                    ),
                                  ),
                                  if (widget.paginaAtual == 'mecontrata')
                                    Container(
                                      width: 100.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation4']!),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mouseRegionHovered3 = true);
                              logFirebaseEvent(
                                  'FEED_MENU_HORIZONT_MouseRegion_lwdlu5k0_');
                              setState(() {
                                _model.hover = 'mecontrata';
                              });
                            }),
                            onExit: ((event) async {
                              setState(
                                  () => _model.mouseRegionHovered3 = false);
                              logFirebaseEvent(
                                  'FEED_MENU_HORIZONT_MouseRegion_lwdlu5k0_');
                              setState(() {
                                _model.hover = 'null';
                              });
                            }),
                          ),
                        ),
                        AlignedTooltip(
                          content: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'me divirta',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              )),
                          offset: 4.0,
                          preferredDirection: AxisDirection.up,
                          borderRadius: BorderRadius.circular(8.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          tailBaseWidth: 24.0,
                          tailLength: 12.0,
                          waitDuration: Duration(milliseconds: 200),
                          showDuration: Duration(milliseconds: 100),
                          triggerMode: TooltipTriggerMode.tap,
                          child: MouseRegion(
                            opaque: true,
                            cursor:
                                SystemMouseCursors.click ?? MouseCursor.defer,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'FEED_MENU_HORIZONT_Column_9aua6hys_ON_TA');
                                if (loggedIn == true) {
                                  context.pushNamed('meDivirta');
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
                                              MediaQuery.viewInsetsOf(context),
                                          child:
                                              UsarDeslogadoUsoExclusivoCompWidget(
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
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: _model.hover == 'medivirta'
                                          ? FlutterFlowTheme.of(context).accent4
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Icon(
                                      FFIcons.kmeDivirtaON,
                                      color: widget.paginaAtual == 'medivirta'
                                          ? FlutterFlowTheme.of(context)
                                              .tertiary
                                          : FlutterFlowTheme.of(context)
                                              .accent2,
                                      size: 28.0,
                                    ),
                                  ),
                                  if (widget.paginaAtual == 'medivirta')
                                    Container(
                                      width: 100.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation5']!),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mouseRegionHovered4 = true);
                              logFirebaseEvent(
                                  'FEED_MENU_HORIZONT_MouseRegion_fnxtifhx_');
                              setState(() {
                                _model.hover = 'medivirta';
                              });
                            }),
                            onExit: ((event) async {
                              setState(
                                  () => _model.mouseRegionHovered4 = false);
                              logFirebaseEvent(
                                  'FEED_MENU_HORIZONT_MouseRegion_fnxtifhx_');
                              setState(() {
                                _model.hover = 'null';
                              });
                            }),
                          ),
                        ),
                      ].divide(SizedBox(width: 4.0)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (currentUserEmail == 'mauricio@meencontra.app')
                          AlignedTooltip(
                            content: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  'Teste',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                )),
                            offset: 4.0,
                            preferredDirection: AxisDirection.up,
                            borderRadius: BorderRadius.circular(8.0),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            tailBaseWidth: 24.0,
                            tailLength: 12.0,
                            waitDuration: Duration(milliseconds: 200),
                            showDuration: Duration(milliseconds: 100),
                            triggerMode: TooltipTriggerMode.tap,
                            child: FlutterFlowIconButton(
                              borderRadius: 200.0,
                              buttonSize: 48.0,
                              fillColor: FlutterFlowTheme.of(context).info,
                              icon: Icon(
                                Icons.devices_other_outlined,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'FEED_MENU_HORIZONT_devices_other_outline');

                                context.pushNamed('testeAtual');
                              },
                            ),
                          ),
                        if (valueOrDefault(currentUserDocument?.perfil, '') ==
                            'Admin')
                          AuthUserStreamWidget(
                            builder: (context) => AlignedTooltip(
                              content: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text(
                                    'Dashboard',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  )),
                              offset: 4.0,
                              preferredDirection: AxisDirection.up,
                              borderRadius: BorderRadius.circular(8.0),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 4.0,
                              tailBaseWidth: 24.0,
                              tailLength: 12.0,
                              waitDuration: Duration(milliseconds: 200),
                              showDuration: Duration(milliseconds: 100),
                              triggerMode: TooltipTriggerMode.tap,
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 200.0,
                                buttonSize: 48.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.space_dashboard_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'FEED_MENU_HORIZONT_space_dashboard_outli');

                                  context.pushNamed('meDashboard');
                                },
                              ),
                            ),
                          ),
                        AuthUserStreamWidget(
                          builder: (context) => AlignedTooltip(
                            content: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  valueOrDefault(currentUserDocument?.perfil,
                                              '') ==
                                          'Usuario'
                                      ? 'Cadastrar o meu negócio'
                                      : 'Meu negócio',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                )),
                            offset: 4.0,
                            preferredDirection: AxisDirection.down,
                            borderRadius: BorderRadius.circular(8.0),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            tailBaseWidth: 24.0,
                            tailLength: 12.0,
                            waitDuration: Duration(milliseconds: 100),
                            showDuration: Duration(milliseconds: 100),
                            triggerMode: TooltipTriggerMode.tap,
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 200.0,
                              buttonSize: 48.0,
                              fillColor: FlutterFlowTheme.of(context).accent4,
                              icon: Icon(
                                FFIcons.kshop,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'FEED_MENU_HORIZONT_COMP_shop_ICN_ON_TAP');
                                if (valueOrDefault(
                                        currentUserDocument?.perfil, '') ==
                                    'Usuario') {
                                  context.pushNamed(
                                    'NovoAnunciante',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 400),
                                      ),
                                    },
                                  );
                                } else {
                                  _model.anuncianteReferencia =
                                      await queryAnuncianteRecordOnce(
                                    queryBuilder: (anuncianteRecord) =>
                                        anuncianteRecord.where(
                                      'aid',
                                      isEqualTo: valueOrDefault(
                                          currentUserDocument?.iDUser, ''),
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);

                                  context.pushNamed(
                                    'AnunciantePage',
                                    queryParameters: {
                                      'documentoRefAnunciante': serializeParam(
                                        _model.anuncianteReferencia,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'documentoRefAnunciante':
                                          _model.anuncianteReferencia,
                                    },
                                  );
                                }

                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        if (widget.paginaAtual == 'Pagina inicial')
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: AlignedTooltip(
                                content: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      'Notificações',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    )),
                                offset: 4.0,
                                preferredDirection: AxisDirection.down,
                                borderRadius: BorderRadius.circular(8.0),
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 4.0,
                                tailBaseWidth: 24.0,
                                tailLength: 12.0,
                                waitDuration: Duration(milliseconds: 200),
                                showDuration: Duration(milliseconds: 100),
                                triggerMode: TooltipTriggerMode.tap,
                                child: MouseRegion(
                                  opaque: true,
                                  cursor: SystemMouseCursors.click ??
                                      MouseCursor.defer,
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'FEED_MENU_HORIZONT_Container_45kdzk2s_ON');
                                          if (loggedIn == true) {
                                            context.pushNamed(
                                              'notificacoes',
                                              queryParameters: {
                                                'notificacoes': serializeParam(
                                                  widget.notificacao,
                                                  ParamType.Document,
                                                  true,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'notificacoes':
                                                    widget.notificacao,
                                              },
                                            );
                                          } else {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
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
                                                      usoExclusivo: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        },
                                        child: Container(
                                          width: 48.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                            color: _model.hover ==
                                                    'Notificações'
                                                ? Color(0xFFDBDBDB)
                                                : FlutterFlowTheme.of(context)
                                                    .accent4,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Stack(
                                            children: [
                                              if (widget.notificacao!.length <
                                                  1)
                                                FaIcon(
                                                  FontAwesomeIcons.solidBell,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                              if (widget.notificacao!.length >=
                                                  1)
                                                Icon(
                                                  FFIcons.kbell,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                              if (responsiveVisibility(
                                                context: context,
                                                desktop: false,
                                              ))
                                                Container(
                                                  width: 16.0,
                                                  height: 16.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .warning,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      '1',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (widget.notificacao!.length >= 1)
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '1',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  onEnter: ((event) async {
                                    setState(() =>
                                        _model.mouseRegionHovered5 = true);
                                    logFirebaseEvent(
                                        'FEED_MENU_HORIZONT_MouseRegion_54ihtq88_');
                                    setState(() {
                                      _model.hover = 'Notificações';
                                    });
                                  }),
                                  onExit: ((event) async {
                                    setState(() =>
                                        _model.mouseRegionHovered5 = false);
                                    logFirebaseEvent(
                                        'FEED_MENU_HORIZONT_MouseRegion_54ihtq88_');
                                    setState(() {
                                      _model.hover = 'Null';
                                    });
                                  }),
                                ),
                              ),
                            ),
                          ),
                        AlignedTooltip(
                          content: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Mostrar mais',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              )),
                          offset: 4.0,
                          preferredDirection: AxisDirection.down,
                          borderRadius: BorderRadius.circular(8.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          tailBaseWidth: 24.0,
                          tailLength: 12.0,
                          waitDuration: Duration(milliseconds: 200),
                          showDuration: Duration(milliseconds: 100),
                          triggerMode: TooltipTriggerMode.tap,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'FEED_MENU_HORIZONT_Container_3vmt5zp7_ON');
                              setState(() {
                                _model.showMoreOptions =
                                    !_model.showMoreOptions;
                              });
                              await widget.drawerAcao?.call();
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: MouseRegion(
                                opaque: false,
                                cursor: SystemMouseCursors.click ??
                                    MouseCursor.defer,
                                child: Stack(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'FEED_MENU_HORIZONT_Image_6reyssud_ON_TAP');
                                            setState(() {
                                              _model.showMoreOptions =
                                                  !_model.showMoreOptions;
                                            });
                                            await widget.drawerAcao?.call();
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(200.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: currentUserPhoto,
                                              width: 48.0,
                                              height: 48.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'FEED_MENU_HORIZONT_Column_epi450ai_ON_TA');
                                          setState(() {
                                            _model.showMoreOptions =
                                                !_model.showMoreOptions;
                                          });
                                          await widget.drawerAcao?.call();
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Container(
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                  shape: BoxShape.rectangle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    1.0, 1.0),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    1.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                onEnter: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered6 = true);
                                }),
                                onExit: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered6 = false);
                                }),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ].divide(SizedBox(height: 24.0)),
      ),
    );
  }
}
