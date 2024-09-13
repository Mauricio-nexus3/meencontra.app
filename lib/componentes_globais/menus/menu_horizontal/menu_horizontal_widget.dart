import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/login/componentes/login_criar_conta_componente/login_criar_conta_componente_widget.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'menu_horizontal_model.dart';
export 'menu_horizontal_model.dart';

class MenuHorizontalWidget extends StatefulWidget {
  const MenuHorizontalWidget({
    super.key,
    required this.paginaAtual,
    this.drawerAcao,
    this.notificacao,
    required this.notificacaoAcao,
  });

  final String? paginaAtual;
  final Future Function()? drawerAcao;
  final List<NotificacaoRecord>? notificacao;
  final Future Function()? notificacaoAcao;

  @override
  State<MenuHorizontalWidget> createState() => _MenuHorizontalWidgetState();
}

class _MenuHorizontalWidgetState extends State<MenuHorizontalWidget> {
  late MenuHorizontalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuHorizontalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MENU_HORIZONTAL_menuHorizontal_ON_INIT_S');
      _model.showMoreOptions = false;
      safeSetState(() {});
    });

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(0.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent4,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.16,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.menu_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'MENU_HORIZONTAL_menu_rounded_ICN_ON_TAP');
                                await widget.drawerAcao?.call();
                              },
                            ),
                            Text(
                              'Menu',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                        SizedBox(
                          height: 48.0,
                          child: VerticalDivider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).accent1,
                          ),
                        ),
                        AlignedTooltip(
                          content: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Message...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          offset: 4.0,
                          preferredDirection: AxisDirection.down,
                          borderRadius: BorderRadius.circular(8.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          tailBaseWidth: 24.0,
                          tailLength: 12.0,
                          waitDuration: Duration(milliseconds: 100),
                          showDuration: Duration(milliseconds: 1500),
                          triggerMode: TooltipTriggerMode.tap,
                          child: Text(
                            'Assine',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    decoration: BoxDecoration(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MENU_HORIZONTAL_Image_f2g0n94m_ON_TAP');

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
                          height: 48.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (valueOrDefault(currentUserDocument?.perfil, '') ==
                            'Admin')
                          AuthUserStreamWidget(
                            builder: (context) => Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
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
                                    ),
                                  ),
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
                                    icon: Icon(
                                      Icons.devices_other_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'MENU_HORIZONTAL_devices_other_outlined_I');

                                      context.pushNamed('testeAtual');
                                    },
                                  ),
                                ),
                                AlignedTooltip(
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
                                    ),
                                  ),
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
                                    buttonSize: 48.0,
                                    icon: Icon(
                                      Icons.space_dashboard_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'MENU_HORIZONTAL_space_dashboard_outlined');

                                      context.pushNamed('meDashboard');
                                    },
                                  ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                        if (loggedIn == false)
                          AlignedTooltip(
                            content: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Message...',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            offset: 4.0,
                            preferredDirection: AxisDirection.down,
                            borderRadius: BorderRadius.circular(8.0),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            tailBaseWidth: 24.0,
                            tailLength: 12.0,
                            waitDuration: Duration(milliseconds: 100),
                            showDuration: Duration(milliseconds: 1500),
                            triggerMode: TooltipTriggerMode.tap,
                            child: MouseRegion(
                              opaque: false,
                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                              child: Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MENU_HORIZONTAL_COMP_Row_nkrmyc0g_ON_TAP');
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: WebViewAware(
                                            child:
                                                LoginCriarContaComponenteWidget(
                                              login: 'CriarConta',
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Logar',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      FlutterFlowIconButton(
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.person_outline,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onEnter: ((event) async {
                                safeSetState(
                                    () => _model.mouseRegionHovered1 = true);
                              }),
                              onExit: ((event) async {
                                safeSetState(
                                    () => _model.mouseRegionHovered1 = false);
                              }),
                            ),
                          ),
                        if (loggedIn == true)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget!.paginaAtual ==
                                  TelasMenuDrawer.Inicio.name)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'MENU_HORIZONTAL_Container_y61q0zhy_ON_TA');
                                      await widget.notificacaoAcao?.call();
                                    },
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
                                          ),
                                        ),
                                        offset: 4.0,
                                        preferredDirection: AxisDirection.down,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        elevation: 4.0,
                                        tailBaseWidth: 24.0,
                                        tailLength: 12.0,
                                        waitDuration:
                                            Duration(milliseconds: 200),
                                        showDuration:
                                            Duration(milliseconds: 100),
                                        triggerMode: TooltipTriggerMode.tap,
                                        child: MouseRegion(
                                          opaque: true,
                                          cursor: SystemMouseCursors.click ??
                                              MouseCursor.defer,
                                          child: badges.Badge(
                                            badgeContent: Text(
                                              widget!.notificacao!.length
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            showBadge:
                                                widget!.notificacao?.length !=
                                                    0,
                                            shape: badges.BadgeShape.circle,
                                            badgeColor:
                                                FlutterFlowTheme.of(context)
                                                    .warning,
                                            elevation: 3.0,
                                            padding: EdgeInsets.all(4.0),
                                            position:
                                                badges.BadgePosition.topEnd(),
                                            animationType:
                                                badges.BadgeAnimationType.scale,
                                            toAnimate: true,
                                            child: Container(
                                              height: 36.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Icon(
                                                FFIcons.kbell,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          onEnter: ((event) async {
                                            safeSetState(() => _model
                                                .mouseRegionHovered2 = true);
                                            logFirebaseEvent(
                                                'MENU_HORIZONTAL_MouseRegion_1y5pu3mr_ON_');
                                            _model.hover = 'Notificações';
                                            safeSetState(() {});
                                          }),
                                          onExit: ((event) async {
                                            safeSetState(() => _model
                                                .mouseRegionHovered2 = false);
                                            logFirebaseEvent(
                                                'MENU_HORIZONTAL_MouseRegion_1y5pu3mr_ON_');
                                            _model.hover = 'Null';
                                            safeSetState(() {});
                                          }),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              AlignedTooltip(
                                content: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text(
                                    'Perfil',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
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
                                  opaque: false,
                                  cursor: SystemMouseCursors.click ??
                                      MouseCursor.defer,
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'MENU_HORIZONTAL_Image_itnavsgi_ON_TAP');
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
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onEnter: ((event) async {
                                    safeSetState(() =>
                                        _model.mouseRegionHovered3 = true);
                                  }),
                                  onExit: ((event) async {
                                    safeSetState(() =>
                                        _model.mouseRegionHovered3 = false);
                                  }),
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        SizedBox(
                          height: 48.0,
                          child: VerticalDivider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).accent1,
                          ),
                        ),
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'MENU_HORIZONTAL_COMP_Row_b7cs3844_ON_TAP');

                              context.pushNamed('Categorias');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Buscar',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                AlignedTooltip(
                                  content: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      'Buscar',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
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
                                    buttonSize: 48.0,
                                    icon: Icon(
                                      FFIcons.klupa,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'MENU_HORIZONTAL_COMP_lupa_ICN_ON_TAP');
                                      if (valueOrDefault(
                                              currentUserDocument?.perfil,
                                              '') ==
                                          'Usuario') {
                                        context.pushNamed(
                                          'NovoAnunciante',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 400),
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
                                                currentUserDocument?.iDUser,
                                                ''),
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);

                                        context.pushNamed(
                                          'AnunciantePage',
                                          queryParameters: {
                                            'documentoRefAnunciante':
                                                serializeParam(
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

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionBuscarHovered = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionBuscarHovered = false);
                          }),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ].divide(SizedBox(height: 24.0)),
      ),
    );
  }
}
