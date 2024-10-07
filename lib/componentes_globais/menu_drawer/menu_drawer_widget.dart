import '/assinatura/estrela_bloqueio/estrela_bloqueio_widget.dart';
import '/assinatura/upgrade/upgrade_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'menu_drawer_model.dart';
export 'menu_drawer_model.dart';

class MenuDrawerWidget extends StatefulWidget {
  const MenuDrawerWidget({
    super.key,
    required this.paginaAtual,
  });

  final String? paginaAtual;

  @override
  State<MenuDrawerWidget> createState() => _MenuDrawerWidgetState();
}

class _MenuDrawerWidgetState extends State<MenuDrawerWidget> {
  late MenuDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuDrawerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 300.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Container(
                            width: 56.0,
                            height: 56.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        Duration(milliseconds: 500),
                                    imageUrl: currentUserPhoto,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    currentUserEmail,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
                Divider(
                  height: 12.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                if (valueOrDefault(currentUserDocument?.perfil, '') ==
                    PerfilUsuario.Admin.name)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MouseRegion(
                            opaque: true,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'MENU_DRAWER_COMP_Row_l7bsrmtz_ON_TAP');

                                  context.pushNamed('meDashboard');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.space_dashboard_outlined,
                                      color: valueOrDefault<Color>(
                                        widget!.paginaAtual ==
                                                TelasMenuDrawer
                                                    .dashboard_me.name
                                            ? _model.pageON
                                            : _model.pageOff,
                                        FlutterFlowTheme.of(context).gradient2,
                                      ),
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Dashboard',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: valueOrDefault<Color>(
                                                widget!.paginaAtual ==
                                                        TelasMenuDrawer
                                                            .dashboard_me.name
                                                    ? _model.pageON
                                                    : _model.pageOff,
                                                FlutterFlowTheme.of(context)
                                                    .gradient2,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionTesteHovered = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionTesteHovered = false);
                            }),
                          ),
                          MouseRegion(
                            opaque: true,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'MENU_DRAWER_COMP_Row_u1kte93r_ON_TAP');

                                  context.pushNamed('testeAtual');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.devices_other_rounded,
                                      color: valueOrDefault<Color>(
                                        widget!.paginaAtual ==
                                                TelasMenuDrawer.Teste_Atual.name
                                            ? _model.pageON
                                            : _model.pageOff,
                                        FlutterFlowTheme.of(context).gradient2,
                                      ),
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Teste atual',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: valueOrDefault<Color>(
                                                widget!.paginaAtual ==
                                                        TelasMenuDrawer
                                                            .Teste_Atual.name
                                                    ? _model.pageON
                                                    : _model.pageOff,
                                                FlutterFlowTheme.of(context)
                                                    .gradient2,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionDashHovered = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionDashHovered = false);
                            }),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MouseRegion(
                            opaque: true,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'MENU_DRAWER_COMP_Row_0byjeyy6_ON_TAP');

                                  context.pushNamed('Feed');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FFIcons.khomeOFFStroke,
                                      color: valueOrDefault<Color>(
                                        widget!.paginaAtual ==
                                                TelasMenuDrawer.Inicio.name
                                            ? _model.pageON
                                            : _model.pageOff,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Inicio',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: valueOrDefault<Color>(
                                                widget!.paginaAtual ==
                                                        TelasMenuDrawer
                                                            .Inicio.name
                                                    ? _model.pageON
                                                    : _model.pageOff,
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionInicioHovered = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(() =>
                                  _model.mouseRegionInicioHovered = false);
                            }),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                          ))
                            MouseRegion(
                              opaque: true,
                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MENU_DRAWER_COMP_Row_tw6iucss_ON_TAP');

                                    context.pushNamed('Feed');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FFIcons.kmeInformaON,
                                        color: valueOrDefault<Color>(
                                          widget!.paginaAtual ==
                                                  TelasMenuDrawer.meinforma.name
                                              ? _model.pageON
                                              : _model.pageOff,
                                          FlutterFlowTheme.of(context).accent2,
                                        ),
                                        size: 24.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'meinforma',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: valueOrDefault<Color>(
                                                  widget!.paginaAtual ==
                                                          TelasMenuDrawer
                                                              .meinforma.name
                                                      ? _model.pageON
                                                      : _model.pageOff,
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ),
                              onEnter: ((event) async {
                                safeSetState(() =>
                                    _model.mouseRegionMeinformaHovered = true);
                              }),
                              onExit: ((event) async {
                                safeSetState(() =>
                                    _model.mouseRegionMeinformaHovered = false);
                              }),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            MouseRegion(
                              opaque: true,
                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MENU_DRAWER_COMP_Row_skakirxr_ON_TAP');

                                    context.pushNamed('Feed');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FFIcons.kmeContrataOFF,
                                        color: valueOrDefault<Color>(
                                          widget!.paginaAtual ==
                                                  TelasMenuDrawer
                                                      .mecontrata.name
                                              ? _model.pageON
                                              : _model.pageOff,
                                          FlutterFlowTheme.of(context).accent2,
                                        ),
                                        size: 24.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'mecontrata',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: valueOrDefault<Color>(
                                                  widget!.paginaAtual ==
                                                          TelasMenuDrawer
                                                              .mecontrata.name
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .accent2
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ),
                              onEnter: ((event) async {
                                safeSetState(() =>
                                    _model.mouseRegionMecontrataHovered = true);
                              }),
                              onExit: ((event) async {
                                safeSetState(() => _model
                                    .mouseRegionMecontrataHovered = false);
                              }),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            MouseRegion(
                              opaque: true,
                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MENU_DRAWER_COMP_Row_9ij9gcgz_ON_TAP');

                                    context.pushNamed('Feed');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FFIcons.kmeDivirtaON,
                                        color: valueOrDefault<Color>(
                                          widget!.paginaAtual ==
                                                  TelasMenuDrawer.mediverte.name
                                              ? _model.pageON
                                              : _model.pageOff,
                                          FlutterFlowTheme.of(context).accent2,
                                        ),
                                        size: 24.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'medivirta',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: valueOrDefault<Color>(
                                                  widget!.paginaAtual ==
                                                          TelasMenuDrawer
                                                              .mediverte.name
                                                      ? _model.pageON
                                                      : _model.pageOff,
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ),
                              onEnter: ((event) async {
                                safeSetState(() =>
                                    _model.mouseRegionMedivirtaHovered = true);
                              }),
                              onExit: ((event) async {
                                safeSetState(() =>
                                    _model.mouseRegionMedivirtaHovered = false);
                              }),
                            ),
                        ],
                      ),
                      if (valueOrDefault(currentUserDocument?.perfil, '') ==
                          PerfilUsuario.Usuario.name)
                        AuthUserStreamWidget(
                          builder: (context) => MouseRegion(
                            opaque: true,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'MENU_DRAWER_COMP_Row_38rf5oeg_ON_TAP');

                                  context.pushNamed('CadastroInicial');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FFIcons.kresgatar,
                                      color: valueOrDefault<Color>(
                                        widget!.paginaAtual ==
                                                TelasMenuDrawer.Meu_negocio.name
                                            ? _model.pageON
                                            : _model.pageOff,
                                        FlutterFlowTheme.of(context).accent2,
                                      ),
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Cadastrar meu negócio',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: valueOrDefault<Color>(
                                                widget!.paginaAtual ==
                                                        TelasMenuDrawer
                                                            .Meu_negocio.name
                                                    ? _model.pageON
                                                    : _model.pageOff,
                                                FlutterFlowTheme.of(context)
                                                    .accent2,
                                              ),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(() => _model
                                  .mouseRCadastrarMeuNegocioHovered = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(() => _model
                                  .mouseRCadastrarMeuNegocioHovered = false);
                            }),
                          ),
                        ),
                      if (valueOrDefault(currentUserDocument?.perfil, '') ==
                          PerfilUsuario.Anunciante.name)
                        AuthUserStreamWidget(
                          builder: (context) =>
                              FutureBuilder<List<AnuncianteRecord>>(
                            future: queryAnuncianteRecordOnce(
                              queryBuilder: (anuncianteRecord) =>
                                  anuncianteRecord.where(
                                'aid',
                                isEqualTo: currentUserReference?.id != ''
                                    ? currentUserReference?.id
                                    : null,
                              ),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 30.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFF622AE2),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<AnuncianteRecord>
                                  containerAnuncianteRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerAnuncianteRecord =
                                  containerAnuncianteRecordList.isNotEmpty
                                      ? containerAnuncianteRecordList.first
                                      : null;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    MouseRegion(
                                      opaque: true,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MENU_DRAWER_COMP_Row_cxms8od4_ON_TAP');

                                            context.pushNamed(
                                              'AnunciantePage',
                                              queryParameters: {
                                                'documentoRefAnunciante':
                                                    serializeParam(
                                                  containerAnuncianteRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'documentoRefAnunciante':
                                                    containerAnuncianteRecord,
                                              },
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FFIcons.kshop,
                                                color: valueOrDefault<Color>(
                                                  widget!.paginaAtual ==
                                                          TelasMenuDrawer
                                                              .Meu_negocio.name
                                                      ? _model.pageON
                                                      : _model.pageOff,
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                                ),
                                                size: 24.0,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Meu negócio',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: valueOrDefault<
                                                            Color>(
                                                          widget!.paginaAtual ==
                                                                  TelasMenuDrawer
                                                                      .Meu_negocio
                                                                      .name
                                                              ? _model.pageON
                                                              : _model.pageOff,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                        ),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() => _model
                                                .mouseRegionMeuNegocioHovered =
                                            true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() => _model
                                                .mouseRegionMeuNegocioHovered =
                                            false);
                                      }),
                                    ),
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MENU_DRAWER_COMP_Row_rqfs9f5m_ON_TAP');

                                            context.pushNamed(
                                              'AnunciantePage',
                                              queryParameters: {
                                                'documentoRefAnunciante':
                                                    serializeParam(
                                                  containerAnuncianteRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'documentoRefAnunciante':
                                                    containerAnuncianteRecord,
                                              },
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.dashboard_outlined,
                                                color: valueOrDefault<Color>(
                                                  widget!.paginaAtual ==
                                                          TelasMenuDrawer
                                                              .Painel_administrativo
                                                              .name
                                                      ? _model.pageON
                                                      : _model.pageOff,
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                                ),
                                                size: 24.0,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Painel administrativo',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: valueOrDefault<
                                                            Color>(
                                                          widget!.paginaAtual ==
                                                                  TelasMenuDrawer
                                                                      .Painel_administrativo
                                                                      .name
                                                              ? _model.pageON
                                                              : _model.pageOff,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                        ),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() =>
                                            _model.mouseRegionPainelAdmHovered =
                                                true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() =>
                                            _model.mouseRegionPainelAdmHovered =
                                                false);
                                      }),
                                    ),
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 8.0, 8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MENU_DRAWER_COMP_Row_vz68egg8_ON_TAP');
                                            if (containerAnuncianteRecord
                                                    ?.planoAssinatura !=
                                                'meencontra') {
                                              context.pushNamed(
                                                'DashAnuncianteCatalogo',
                                                queryParameters: {
                                                  'anuncianteDoc':
                                                      serializeParam(
                                                    containerAnuncianteRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'anuncianteDoc':
                                                      containerAnuncianteRecord,
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
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: UpgradeWidget(
                                                        mensagemMenu:
                                                            'catalogo',
                                                        anuncianteDoc:
                                                            containerAnuncianteRecord!,
                                                        title:
                                                            'Recurso exclusivo para anunciantes parceiros',
                                                        text:
                                                            'Fale com nosso comercial  e libere ainda mais recursos',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            }
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Icon(
                                                      Icons.list_alt_outlined,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        widget!.paginaAtual ==
                                                                TelasMenuDrawer
                                                                    .Catalogo
                                                                    .name
                                                            ? _model.pageON
                                                            : _model.pageOff,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent2,
                                                      ),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .estrelaBloqueioModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        EstrelaBloqueioWidget(
                                                      planoAssinatura:
                                                          containerAnuncianteRecord!
                                                              .planoAssinatura,
                                                      tamanho: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Catalogo',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: valueOrDefault<
                                                            Color>(
                                                          widget!.paginaAtual ==
                                                                  TelasMenuDrawer
                                                                      .Catalogo
                                                                      .name
                                                              ? _model.pageON
                                                              : _model.pageOff,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                        ),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionCatalogoHovered = true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() =>
                                            _model.mouseRegionCatalogoHovered =
                                                false);
                                      }),
                                    ),
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MENU_DRAWER_COMP_Row_mzcxrpxr_ON_TAP');

                                            context.pushNamed(
                                              'DashAnuncianteSuporte',
                                              queryParameters: {
                                                'anuncianteDoc': serializeParam(
                                                  containerAnuncianteRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'anuncianteDoc':
                                                    containerAnuncianteRecord,
                                              },
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FFIcons.ksuporte,
                                                color: valueOrDefault<Color>(
                                                  widget!.paginaAtual ==
                                                          TelasMenuDrawer
                                                              .Suporte.name
                                                      ? _model.pageON
                                                      : _model.pageOff,
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                                ),
                                                size: 24.0,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Suporte',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: valueOrDefault<
                                                            Color>(
                                                          widget!.paginaAtual ==
                                                                  TelasMenuDrawer
                                                                      .Suporte
                                                                      .name
                                                              ? _model.pageON
                                                              : _model.pageOff,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                        ),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() => _model
                                                .mouseRSuporteAnuncianteHovered =
                                            true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() => _model
                                                .mouseRSuporteAnuncianteHovered =
                                            false);
                                      }),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      MouseRegion(
                        opaque: true,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FFIcons.keditarUsuario,
                                color: valueOrDefault<Color>(
                                  widget!.paginaAtual ==
                                          TelasMenuDrawer.Editar_perfil.name
                                      ? _model.pageON
                                      : _model.pageOff,
                                  FlutterFlowTheme.of(context).accent2,
                                ),
                                size: 24.0,
                              ),
                              Expanded(
                                child: Text(
                                  'Editar perfil',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: valueOrDefault<Color>(
                                          widget!.paginaAtual ==
                                                  TelasMenuDrawer
                                                      .Editar_perfil.name
                                              ? _model.pageON
                                              : _model.pageOff,
                                          FlutterFlowTheme.of(context).accent2,
                                        ),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionPerfilHovered = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionPerfilHovered = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FFIcons.kmalaWork,
                                color: valueOrDefault<Color>(
                                  widget!.paginaAtual ==
                                          TelasMenuDrawer.Anunciar_vaga.name
                                      ? _model.pageON
                                      : _model.pageOff,
                                  FlutterFlowTheme.of(context).accent2,
                                ),
                                size: 24.0,
                              ),
                              Expanded(
                                child: Text(
                                  'Anunciar uma vaga',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: valueOrDefault<Color>(
                                          widget!.paginaAtual ==
                                                  TelasMenuDrawer
                                                      .Anunciar_vaga.name
                                              ? _model.pageON
                                              : _model.pageOff,
                                          FlutterFlowTheme.of(context).accent2,
                                        ),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() =>
                              _model.mouseRegionAnuncieVagaHovered = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(() =>
                              _model.mouseRegionAnuncieVagaHovered = false);
                        }),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.attach_money_rounded,
                                  color: valueOrDefault<Color>(
                                    widget!.paginaAtual ==
                                            TelasMenuDrawer.Clube_Assinante.name
                                        ? _model.pageON
                                        : _model.pageOff,
                                    FlutterFlowTheme.of(context).accent2,
                                  ),
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Text(
                                    'Clube do assinante',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: valueOrDefault<Color>(
                                            widget!.paginaAtual ==
                                                    TelasMenuDrawer
                                                        .Clube_Assinante.name
                                                ? _model.pageON
                                                : _model.pageOff,
                                            FlutterFlowTheme.of(context)
                                                .accent2,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionClubHovered = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionClubHovered = false);
                          }),
                        ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'MENU_DRAWER_COMP_Row_w2yjez94_ON_TAP');
                              await launchURL(
                                  '${FFAppConstants.whatsapp}${FFAppConstants.WhatsSuporte}');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FFIcons.kanuncios,
                                  color: valueOrDefault<Color>(
                                    widget!.paginaAtual ==
                                            TelasMenuDrawer.Anuncie_conosco.name
                                        ? _model.pageON
                                        : _model.pageOff,
                                    FlutterFlowTheme.of(context).accent2,
                                  ),
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Text(
                                    'Anuncie seu negócio',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: valueOrDefault<Color>(
                                            widget!.paginaAtual ==
                                                    TelasMenuDrawer
                                                        .Anuncie_conosco.name
                                                ? _model.pageON
                                                : _model.pageOff,
                                            FlutterFlowTheme.of(context)
                                                .accent2,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionAnuncieMEHovered = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionAnuncieMEHovered = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FFIcons.kcomentarios,
                                color: valueOrDefault<Color>(
                                  widget!.paginaAtual ==
                                          TelasMenuDrawer.Fale_meencontre.name
                                      ? _model.pageON
                                      : _model.pageOff,
                                  FlutterFlowTheme.of(context).accent2,
                                ),
                                size: 24.0,
                              ),
                              Expanded(
                                child: Text(
                                  'Fale com o meencontra',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: valueOrDefault<Color>(
                                          widget!.paginaAtual ==
                                                  TelasMenuDrawer
                                                      .Fale_meencontre.name
                                              ? _model.pageON
                                              : _model.pageOff,
                                          FlutterFlowTheme.of(context).accent2,
                                        ),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionFaleMeHovered = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionFaleMeHovered = false);
                        }),
                      ),
                      if (valueOrDefault(currentUserDocument?.perfil, '') !=
                          PerfilUsuario.Anunciante.name)
                        AuthUserStreamWidget(
                          builder: (context) => MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'MENU_DRAWER_COMP_Row_tyb8erat_ON_TAP');

                                  context.pushNamed('DashAnuncianteSuporte');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FFIcons.ksuporte,
                                      color: valueOrDefault<Color>(
                                        widget!.paginaAtual ==
                                                TelasMenuDrawer.Suporte.name
                                            ? _model.pageON
                                            : _model.pageOff,
                                        FlutterFlowTheme.of(context).accent2,
                                      ),
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Suporte',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: valueOrDefault<Color>(
                                                widget!.paginaAtual ==
                                                        TelasMenuDrawer
                                                            .Suporte.name
                                                    ? _model.pageON
                                                    : _model.pageOff,
                                                FlutterFlowTheme.of(context)
                                                    .accent2,
                                              ),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(() =>
                                  _model.mouseRegionSuporteUserHovered = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(() =>
                                  _model.mouseRegionSuporteUserHovered = false);
                            }),
                          ),
                        ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.attach_money_rounded,
                                color: valueOrDefault<Color>(
                                  widget!.paginaAtual ==
                                          TelasMenuDrawer.Assinatura.name
                                      ? _model.pageON
                                      : _model.pageOff,
                                  FlutterFlowTheme.of(context).accent2,
                                ),
                                size: 24.0,
                              ),
                              Expanded(
                                child: Text(
                                  'Assinatura',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: valueOrDefault<Color>(
                                          widget!.paginaAtual ==
                                                  TelasMenuDrawer
                                                      .Assinatura.name
                                              ? _model.pageON
                                              : _model.pageOff,
                                          FlutterFlowTheme.of(context).accent2,
                                        ),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionAssinaturaHovered = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(() =>
                              _model.mouseRegionAssinaturaHovered = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'MENU_DRAWER_COMP_Row_lx0zt8u7_ON_TAP');

                              context.pushNamed('configuracoes');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FFIcons.kconfiguracaoSettingROUND,
                                  color: valueOrDefault<Color>(
                                    widget!.paginaAtual ==
                                            TelasMenuDrawer.Configuracoes.name
                                        ? _model.pageON
                                        : _model.pageOff,
                                    FlutterFlowTheme.of(context).accent2,
                                  ),
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Text(
                                    'Configurações',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: valueOrDefault<Color>(
                                            widget!.paginaAtual ==
                                                    TelasMenuDrawer
                                                        .Configuracoes.name
                                                ? _model.pageON
                                                : _model.pageOff,
                                            FlutterFlowTheme.of(context)
                                                .accent2,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionConfigHovered = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionConfigHovered = false);
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
