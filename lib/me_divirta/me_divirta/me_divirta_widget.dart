import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_divirta/medivirta_card/medivirta_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'me_divirta_model.dart';
export 'me_divirta_model.dart';

class MeDivirtaWidget extends StatefulWidget {
  const MeDivirtaWidget({super.key});

  @override
  State<MeDivirtaWidget> createState() => _MeDivirtaWidgetState();
}

class _MeDivirtaWidgetState extends State<MeDivirtaWidget> {
  late MeDivirtaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeDivirtaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.filtroData = false;
      });
    });

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

    return StreamBuilder<List<MeDiverteRecord>>(
      stream: queryMeDiverteRecord(
        queryBuilder: (meDiverteRecord) => meDiverteRecord.orderBy('Data_Hora'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF622AE2),
                  ),
                ),
              ),
            ),
          );
        }
        List<MeDiverteRecord> meDivirtaMeDiverteRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await _model.columnOK?.animateTo(
                  0,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.ease,
                );
              },
              backgroundColor: FlutterFlowTheme.of(context).tertiary,
              elevation: 6.0,
              child: Icon(
                Icons.arrow_upward_outlined,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 34.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                controller: _model.columnOK,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AuthUserStreamWidget(
                      builder: (context) => wrapWithModel(
                        model: _model.appbarGrupoMeModel,
                        updateCallback: () => setState(() {}),
                        child: AppbarGrupoMeWidget(
                          viewLeft: 'default',
                          viewRight: 'default',
                          title: 'divirta',
                          tabbar: 'medivirta',
                          corText:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          perfil:
                              valueOrDefault(currentUserDocument?.perfil, ''),
                          iconLeft: () async {},
                          iconRight: () async {},
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final carousel =
                              meDivirtaMeDiverteRecordList.toList();
                          return Container(
                            width: double.infinity,
                            height: 250.0,
                            child: CarouselSlider.builder(
                              itemCount: carousel.length,
                              itemBuilder: (context, carouselIndex, _) {
                                final carouselItem = carousel[carouselIndex];
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    carouselItem.imagemCapa,
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                              carouselController: _model.carouselController ??=
                                  CarouselController(),
                              options: CarouselOptions(
                                initialPage: min(1, carousel.length - 1),
                                viewportFraction: 0.8,
                                disableCenter: true,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.25,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayInterval:
                                    Duration(milliseconds: (800 + 4000)),
                                autoPlayCurve: Curves.linear,
                                pauseAutoPlayInFiniteScroll: true,
                                onPageChanged: (index, _) =>
                                    _model.carouselCurrentIndex = index,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 1020.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                            ))
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.filtroData = false;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.filtroData == false
                                                ? FlutterFlowTheme.of(context)
                                                    .tertiary
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 6.0, 12.0, 6.0),
                                            child: Text(
                                              'Todos eventos',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: _model.filtroData ==
                                                            false
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.filtroData = true;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.filtroData == true
                                                ? FlutterFlowTheme.of(context)
                                                    .tertiary
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 6.0, 12.0, 6.0),
                                            child: Text(
                                              'Mostrar por datas',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: _model.filtroData ==
                                                            true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Container(
                              height: 500.0,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final listaEventos =
                                      meDivirtaMeDiverteRecordList.toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listaEventos.length,
                                    itemBuilder: (context, listaEventosIndex) {
                                      final listaEventosItem =
                                          listaEventos[listaEventosIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'meDivirtiDetalhesEvento',
                                            queryParameters: {
                                              'eventoRef': serializeParam(
                                                listaEventosItem.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: MedivirtaCardWidget(
                                          key: Key(
                                              'Keyh61_${listaEventosIndex}_of_${listaEventos.length}'),
                                          fotoCapa: listaEventosItem.imagemCapa,
                                          tituloEvento:
                                              listaEventosItem.nomeEvento,
                                          tipoEvento:
                                              listaEventosItem.tipoEvento,
                                          local: listaEventosItem.local,
                                          ingressoURL:
                                              listaEventosItem.ingressoURL,
                                          horario: listaEventosItem.dataHora!,
                                          km: listaEventosItem
                                              .localizacaoGoogleMaps!,
                                        ),
                                      );
                                    },
                                    controller: _model.listViewController,
                                  );
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
