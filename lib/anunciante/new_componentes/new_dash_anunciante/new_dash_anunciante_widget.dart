import '/anunciante/new_anunciante/build/upgrade/upgrade_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/estrela_bloqueio_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'new_dash_anunciante_model.dart';
export 'new_dash_anunciante_model.dart';

class NewDashAnuncianteWidget extends StatefulWidget {
  const NewDashAnuncianteWidget({
    super.key,
    required this.anuncianteDoc,
    required this.paginaAtual,
  });

  final AnuncianteRecord? anuncianteDoc;
  final String? paginaAtual;

  @override
  State<NewDashAnuncianteWidget> createState() =>
      _NewDashAnuncianteWidgetState();
}

class _NewDashAnuncianteWidgetState extends State<NewDashAnuncianteWidget> {
  late NewDashAnuncianteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewDashAnuncianteModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Container(
        width: 270.0,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(0.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).accent4,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          valueOrDefault<String>(
                            widget.anuncianteDoc?.nomeFantasia,
                            'nome',
                          ),
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(8.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 500),
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
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    currentUserDisplayName,
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    'Admin',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 0.0, 0.0),
                      child: Text(
                        currentUserEmail,
                        style: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 12.0,
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: widget.paginaAtual == 'paginaAnunciante'
                            ? valueOrDefault<Color>(
                                widget.anuncianteDoc?.cor,
                                FlutterFlowTheme.of(context).primary,
                              )
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: MouseRegion(
                        opaque: true,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'AnuncianteCopy',
                                queryParameters: {
                                  'documentoRefAnunciante': serializeParam(
                                    widget.anuncianteDoc,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'documentoRefAnunciante':
                                      widget.anuncianteDoc,
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FFIcons.kshop,
                                  color:
                                      widget.paginaAtual == 'paginaAnunciante'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Inicio',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: widget.paginaAtual ==
                                                    'paginaAnunciante'
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => _model.mouseRegionHovered1 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegionHovered1 = false);
                        }),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: widget.paginaAtual == 'painelAdministrativo'
                            ? valueOrDefault<Color>(
                                FFAppState().corSelecionadaAnunciante,
                                FlutterFlowTheme.of(context).primary,
                              )
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.anuncianteDoc?.planoAssinatura !=
                                'gratis') {
                              context.pushNamed(
                                'DashboardNwAnunciante',
                                queryParameters: {
                                  'anuncianteDoc': serializeParam(
                                    widget.anuncianteDoc,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'anuncianteDoc': widget.anuncianteDoc,
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
                                      child: UpgradeWidget(
                                        mensagemMenu: 'painelAdministrativo',
                                        anunciantedoc: widget.anuncianteDoc!,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.dashboard_outlined,
                                      color: widget.paginaAtual ==
                                              'painelAdministrativo'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.estrelaBloqueioModel1,
                                    updateCallback: () => setState(() {}),
                                    child: EstrelaBloqueioWidget(
                                      planoGratis:
                                          widget.anuncianteDoc!.planoAssinatura,
                                      tamanho: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Painel administrativo',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: widget.paginaAtual ==
                                                  'painelAdministrativo'
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                  ),
                                ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.lock,
                                color: FlutterFlowTheme.of(context).accent2,
                                size: 16.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: widget.paginaAtual == 'meuNegocio'
                            ? valueOrDefault<Color>(
                                widget.anuncianteDoc?.cor,
                                FlutterFlowTheme.of(context).primary,
                              )
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: MouseRegion(
                        opaque: true,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'AnuncianteDashboard',
                                queryParameters: {
                                  'documentoRefAnunciante': serializeParam(
                                    widget.anuncianteDoc,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'documentoRefAnunciante':
                                      widget.anuncianteDoc,
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FFIcons.kresgatar,
                                  color: widget.paginaAtual == 'meuNegocio'
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .primaryText,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Meu negócio',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: widget.paginaAtual ==
                                                    'meuNegocio'
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => _model.mouseRegionHovered2 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegionHovered2 = false);
                        }),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: widget.paginaAtual == 'anuncios'
                            ? valueOrDefault<Color>(
                                widget.anuncianteDoc?.cor,
                                FlutterFlowTheme.of(context).primary,
                              )
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'DashboardNWAnuncios',
                              queryParameters: {
                                'anuncianteDoc': serializeParam(
                                  widget.anuncianteDoc,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'anuncianteDoc': widget.anuncianteDoc,
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FFIcons.kanuncios,
                                color: widget.paginaAtual == 'anuncios'
                                    ? FlutterFlowTheme.of(context)
                                        .primaryBackground
                                    : FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Anuncios',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color:
                                              widget.paginaAtual == 'anuncios'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: widget.paginaAtual == 'produtos'
                            ? valueOrDefault<Color>(
                                widget.anuncianteDoc?.cor,
                                FlutterFlowTheme.of(context).primary,
                              )
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.anuncianteDoc?.planoAssinatura !=
                                'gratis') {
                              context.pushNamed(
                                'Produtos',
                                queryParameters: {
                                  'anuncianteDoc': serializeParam(
                                    widget.anuncianteDoc,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'anuncianteDoc': widget.anuncianteDoc,
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
                                      child: UpgradeWidget(
                                        mensagemMenu: 'produtos',
                                        anunciantedoc: widget.anuncianteDoc!,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.shopping_bag_outlined,
                                      color: widget.paginaAtual == 'produtos'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.estrelaBloqueioModel2,
                                    updateCallback: () => setState(() {}),
                                    child: EstrelaBloqueioWidget(
                                      planoGratis:
                                          widget.anuncianteDoc!.planoAssinatura,
                                      tamanho: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Produtos',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color:
                                              widget.paginaAtual == 'produtos'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                        ),
                                  ),
                                ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.lock,
                                color: FlutterFlowTheme.of(context).accent2,
                                size: 16.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: widget.paginaAtual == 'catalogo'
                            ? valueOrDefault<Color>(
                                widget.anuncianteDoc?.cor,
                                FlutterFlowTheme.of(context).primary,
                              )
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.anuncianteDoc?.planoAssinatura !=
                                'gratis') {
                              context.pushNamed(
                                'catalogoCategoria',
                                queryParameters: {
                                  'anuncianteDoc': serializeParam(
                                    widget.anuncianteDoc,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'anuncianteDoc': widget.anuncianteDoc,
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
                                      child: UpgradeWidget(
                                        mensagemMenu: 'catalogo',
                                        anunciantedoc: widget.anuncianteDoc!,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.list_alt_outlined,
                                      color: widget.paginaAtual == 'catalogo'
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.estrelaBloqueioModel3,
                                    updateCallback: () => setState(() {}),
                                    child: EstrelaBloqueioWidget(
                                      planoGratis:
                                          widget.anuncianteDoc!.planoAssinatura,
                                      tamanho: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Catalogo',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color:
                                              widget.paginaAtual == 'catalogo'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                        ),
                                  ),
                                ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.lock,
                                color: FlutterFlowTheme.of(context).accent2,
                                size: 16.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 12.0,
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: widget.paginaAtual == 'vagas'
                            ? valueOrDefault<Color>(
                                widget.anuncianteDoc?.cor,
                                FlutterFlowTheme.of(context).primary,
                              )
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'DashboardNWvagas',
                              queryParameters: {
                                'anuncianteDoc': serializeParam(
                                  widget.anuncianteDoc,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'anuncianteDoc': widget.anuncianteDoc,
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FFIcons.kmalaWork,
                                color: widget.paginaAtual == 'vagas'
                                    ? FlutterFlowTheme.of(context)
                                        .primaryBackground
                                    : FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Vagas',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: widget.paginaAtual == 'vagas'
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: widget.paginaAtual == 'suporte'
                            ? valueOrDefault<Color>(
                                widget.anuncianteDoc?.cor,
                                FlutterFlowTheme.of(context).primary,
                              )
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'DashboardNWSuporte',
                              queryParameters: {
                                'anuncianteDoc': serializeParam(
                                  widget.anuncianteDoc,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'anuncianteDoc': widget.anuncianteDoc,
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FFIcons.ksuporte,
                                color: widget.paginaAtual == 'suporte'
                                    ? FlutterFlowTheme.of(context)
                                        .primaryBackground
                                    : FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Suporte',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: widget.paginaAtual == 'suporte'
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: widget.paginaAtual == 'assinatura'
                            ? valueOrDefault<Color>(
                                widget.anuncianteDoc?.cor,
                                FlutterFlowTheme.of(context).primary,
                              )
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'DashboardNWAssinatura',
                              queryParameters: {
                                'anuncianteDoc': serializeParam(
                                  widget.anuncianteDoc,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'anuncianteDoc': widget.anuncianteDoc,
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.attach_money_rounded,
                                color: widget.paginaAtual == 'assinatura'
                                    ? FlutterFlowTheme.of(context)
                                        .primaryBackground
                                    : FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Assinatura',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color:
                                              widget.paginaAtual == 'assinatura'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
