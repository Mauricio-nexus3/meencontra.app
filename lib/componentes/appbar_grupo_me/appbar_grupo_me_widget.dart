import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'appbar_grupo_me_model.dart';
export 'appbar_grupo_me_model.dart';

class AppbarGrupoMeWidget extends StatefulWidget {
  const AppbarGrupoMeWidget({
    super.key,
    required this.iconLeft,
    required this.iconRight,
    String? viewLeft,
    String? viewRight,
    required this.title,
    String? tabbar,
    Color? corText,
    required this.perfil,
    this.searchImg,
    this.searchTitle,
    this.searchDescription,
    this.searchURL,
    this.searchTitlePage,
  })  : this.viewLeft = viewLeft ?? 'ocultar',
        this.viewRight = viewRight ?? 'ocultar',
        this.tabbar = tabbar ?? 'meinforma',
        this.corText = corText ?? const Color(0xFFF1F4F8);

  final Future Function()? iconLeft;
  final Future Function()? iconRight;
  final String viewLeft;
  final String viewRight;
  final String? title;
  final String tabbar;
  final Color corText;
  final String? perfil;
  final String? searchImg;
  final String? searchTitle;
  final String? searchDescription;
  final String? searchURL;
  final String? searchTitlePage;

  @override
  State<AppbarGrupoMeWidget> createState() => _AppbarGrupoMeWidgetState();
}

class _AppbarGrupoMeWidgetState extends State<AppbarGrupoMeWidget> {
  late AppbarGrupoMeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbarGrupoMeModel());

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

    return Container(
      decoration: BoxDecoration(),
      child:
          // IconLeft = default - fechar - voltar
          // IconRight = default - criar - visualizar
          // title = default - visualizar - criar
          // tem cores - acc 3 - sec text
          //
          // o componente recebe o parametro que passará para o component state que repassará as funções do componente principal.
          Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              if (widget.tabbar == 'meinforma')
                Material(
                  color: Colors.transparent,
                  elevation: 1.0,
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).alternate,
                          FlutterFlowTheme.of(context).grdInforma190deg
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(1.0, 0.0),
                        end: AlignmentDirectional(-1.0, 0),
                      ),
                    ),
                  ),
                ),
              if (widget.tabbar == 'medivirta')
                Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x15000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).grdDiverte290deg,
                        FlutterFlowTheme.of(context).grdDiverte190deg
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(1.0, 0.0),
                      end: AlignmentDirectional(-1.0, 0),
                    ),
                  ),
                ),
              if (widget.tabbar == 'mecontrata')
                Material(
                  color: Colors.transparent,
                  elevation: 1.0,
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).grdContrata290deg,
                          FlutterFlowTheme.of(context).grdContrata190deg
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(1.0, 0.0),
                        end: AlignmentDirectional(-1.0, 0),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              if (widget.viewLeft == 'default')
                                Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(),
                                ),
                              if (widget.viewLeft == 'fechar')
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 0.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    await widget.iconLeft?.call();
                                  },
                                ),
                              if (widget.viewLeft == 'voltar')
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 0.0,
                                  buttonSize: 48.0,
                                  icon: Icon(
                                    FFIcons.karrowBack,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    await widget.iconLeft?.call();
                                  },
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                if (widget.tabbar == 'meinforma')
                                  Icon(
                                    FFIcons.kmeInformaOFF,
                                    color: widget.viewRight == 'visualizar'
                                        ? FlutterFlowTheme.of(context).accent1
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    size: 24.0,
                                  ),
                                if (widget.tabbar == 'medivirta')
                                  Icon(
                                    FFIcons.kmeDivirtaOFF,
                                    color: widget.viewRight == 'visualizar'
                                        ? FlutterFlowTheme.of(context).accent1
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    size: 24.0,
                                  ),
                                if (widget.tabbar == 'mecontrata')
                                  Icon(
                                    FFIcons.kmeContrataOFF,
                                    color: widget.viewRight == 'visualizar'
                                        ? FlutterFlowTheme.of(context).accent1
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    size: 24.0,
                                  ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'me',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'markPro',
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                        fontWeight: FontWeight.w800,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Text(
                                  widget.title!,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'markPro',
                                        color: widget.corText,
                                        fontWeight: FontWeight.w800,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                if (widget.tabbar == 'meinforma')
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'por',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        FFIcons.kvectorTvgoCorreto,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget.viewRight == 'editar')
                            Stack(
                              children: [
                                Builder(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.ios_share,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      _model.currentPageLink =
                                          await generateCurrentPageLink(
                                        context,
                                        title:
                                            '${widget.searchTitlePage}:  ${widget.searchTitle}',
                                        imageUrl: widget.searchImg,
                                        description: widget.searchDescription,
                                        forceRedirect: true,
                                      );

                                      await Share.share(
                                        _model.currentPageLink,
                                        sharePositionOrigin:
                                            getWidgetBoundingBox(context),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          Stack(
                            children: [
                              if (widget.viewRight == 'default')
                                Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(),
                                ),
                              if (widget.viewRight == 'criar')
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  buttonSize: 40.0,
                                  icon: FaIcon(
                                    FontAwesomeIcons.eyeSlash,
                                    color: FlutterFlowTheme.of(context).accent3,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    await widget.iconRight?.call();
                                  },
                                ),
                              if (widget.viewRight == 'visualizar')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 2.0, 4.0, 2.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 4.0,
                                    buttonSize: 40.0,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidEye,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 26.0,
                                    ),
                                    onPressed: () async {
                                      await widget.iconRight?.call();
                                    },
                                  ),
                                ),

                              // contem duas lógicas, sendo uma temporaria.
                              //
                              // 'visualizar' and 'meencontra OU imprensa' true.
                              // depois passar essa segunda condição para ID unico
                              if ((widget.viewRight == 'editar') &&
                                  (widget.perfil == 'Imprensa'))
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    FFIcons.kpencil,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    await widget.iconRight?.call();
                                  },
                                ),
                              if (widget.viewRight == 'visualizar')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 2.0, 4.0, 2.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 4.0,
                                    buttonSize: 40.0,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidEye,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 26.0,
                                    ),
                                    onPressed: () async {
                                      await widget.iconRight?.call();
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
