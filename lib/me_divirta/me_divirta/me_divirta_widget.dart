import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/feed_home/componentes/feed_menu_horizont/feed_menu_horizont_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_divirta/componentes/medivirta_card/medivirta_card_widget.dart';
import '/meencontra_dashboard/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'meDivirta'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ME_DIVIRTA_PAGE_meDivirta_ON_INIT_STATE');
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
                logFirebaseEvent('ME_DIVIRTA_FloatingActionButton_y0g20g9d');
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
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  backgroundColor: MediaQuery.sizeOf(context).width >= 493.0
                      ? FlutterFlowTheme.of(context).primaryBackground
                      : FlutterFlowTheme.of(context).tertiary,
                  automaticallyImplyLeading: false,
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        desktop: false,
                      ))
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: AuthUserStreamWidget(
                            builder: (context) => wrapWithModel(
                              model: _model.appbarGrupoMeModel,
                              updateCallback: () => setState(() {}),
                              child: AppbarGrupoMeWidget(
                                viewLeft: 'default',
                                viewRight: 'default',
                                title: 'divirta',
                                tabbar: 'medivirta',
                                corText: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                perfil: valueOrDefault(
                                    currentUserDocument?.perfil, ''),
                                iconLeft: () async {},
                                iconRight: () async {},
                              ),
                            ),
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tabletLandscape: false,
                      ))
                        Container(
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.feedMenuHorizontModel,
                            updateCallback: () => setState(() {}),
                            child: FeedMenuHorizontWidget(
                              paginaAtual: 'medivirta',
                              drawerAcao: () async {},
                            ),
                          ),
                        ),
                    ],
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 1.0,
                )
              ],
              body: Builder(
                builder: (context) {
                  return SafeArea(
                    top: false,
                    child: SingleChildScrollView(
                      controller: _model.columnOK ??=
                          PrimaryScrollController.maybeOf(context) ??
                              ScrollController(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
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
                                        final carouselItem =
                                            carousel[carouselIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ME_DIVIRTA_PAGE_Image_t9dewozb_ON_TAP');

                                            context.pushNamed(
                                              'meDivirtiDetalhesEvento',
                                              queryParameters: {
                                                'eventoRef': serializeParam(
                                                  carouselItem,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'eventoRef': carouselItem,
                                              },
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              carouselItem.imagemCapa,
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                      carouselController:
                                          _model.carouselController ??=
                                              CarouselController(),
                                      options: CarouselOptions(
                                        initialPage:
                                            min(1, carousel.length - 1),
                                        viewportFraction: 0.8,
                                        disableCenter: true,
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.25,
                                        enableInfiniteScroll: true,
                                        scrollDirection: Axis.horizontal,
                                        autoPlay: true,
                                        autoPlayAnimationDuration:
                                            Duration(milliseconds: 800),
                                        autoPlayInterval: Duration(
                                            milliseconds: (800 + 4000)),
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
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tabletLandscape: false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      80.0, 0.0, 80.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x71EEEEEE),
                                            icon: Icon(
                                              Icons.chevron_left_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ME_DIVIRTA_chevron_left_rounded_ICN_ON_T');
                                              await _model
                                                  .carouselWebMedivirtaController
                                                  ?.previousPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 480.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final carrouselmedivirta =
                                                        meDivirtaMeDiverteRecordList
                                                            .toList();
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 575.0,
                                                      child: CarouselSlider
                                                          .builder(
                                                        itemCount:
                                                            carrouselmedivirta
                                                                .length,
                                                        itemBuilder: (context,
                                                            carrouselmedivirtaIndex,
                                                            _) {
                                                          final carrouselmedivirtaItem =
                                                              carrouselmedivirta[
                                                                  carrouselmedivirtaIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ME_DIVIRTA_PAGE_Image_gitt25up_ON_TAP');

                                                              context.pushNamed(
                                                                'meDivirtiDetalhesEvento',
                                                                queryParameters:
                                                                    {
                                                                  'eventoRef':
                                                                      serializeParam(
                                                                    carrouselmedivirtaItem,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'eventoRef':
                                                                      carrouselmedivirtaItem,
                                                                },
                                                              );
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                carrouselmedivirtaItem
                                                                    .imagemCapa,
                                                                width: 300.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        carouselController: _model
                                                                .carouselWebMedivirtaController ??=
                                                            CarouselController(),
                                                        options:
                                                            CarouselOptions(
                                                          initialPage: min(
                                                              valueOrDefault<
                                                                  int>(
                                                                random_data.randomInteger(
                                                                    0,
                                                                    carrouselmedivirta
                                                                        .length),
                                                                0,
                                                              ),
                                                              carrouselmedivirta
                                                                      .length -
                                                                  1),
                                                          viewportFraction: 1.0,
                                                          disableCenter: true,
                                                          enlargeCenterPage:
                                                              true,
                                                          enlargeFactor: 0.16,
                                                          enableInfiniteScroll:
                                                              true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          autoPlay: true,
                                                          autoPlayAnimationDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      2200),
                                                          autoPlayInterval:
                                                              Duration(
                                                                  milliseconds:
                                                                      (2200 +
                                                                          2600)),
                                                          autoPlayCurve:
                                                              Curves.linear,
                                                          pauseAutoPlayInFiniteScroll:
                                                              true,
                                                          onPageChanged: (index,
                                                                  _) =>
                                                              _model.carouselWebMedivirtaCurrentIndex =
                                                                  index,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x71EEEEEE),
                                            icon: Icon(
                                              Icons.chevron_right_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ME_DIVIRTA_chevron_right_rounded_ICN_ON_');
                                              await _model
                                                  .carouselWebMedivirtaController
                                                  ?.nextPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .around(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
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
                                              logFirebaseEvent(
                                                  'ME_DIVIRTA_Container_f09z0xd3_ON_TAP');
                                              setState(() {
                                                _model.filtroData = false;
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    _model.filtroData == false
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary
                                                        : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 6.0, 12.0, 6.0),
                                                child: Text(
                                                  'Todos eventos',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: _model
                                                                        .filtroData ==
                                                                    false
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            letterSpacing: 0.0,
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
                                              logFirebaseEvent(
                                                  'ME_DIVIRTA_Container_olmen4zf_ON_TAP');
                                              setState(() {
                                                _model.filtroData = true;
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: _model.filtroData == true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 6.0, 12.0, 6.0),
                                                child: Text(
                                                  'Mostrar por datas',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: _model
                                                                        .filtroData ==
                                                                    true
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tabletLandscape: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        124.0, 24.0, 124.0, 24.0),
                                    child: Container(
                                      height: 700.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: Builder(
                                          builder: (context) {
                                            final gridDesktop =
                                                meDivirtaMeDiverteRecordList
                                                    .toList();
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                crossAxisSpacing: 12.0,
                                                mainAxisSpacing: 12.0,
                                                childAspectRatio: 0.8,
                                              ),
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              itemCount: gridDesktop.length,
                                              itemBuilder:
                                                  (context, gridDesktopIndex) {
                                                final gridDesktopItem =
                                                    gridDesktop[
                                                        gridDesktopIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 4.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 16.0,
                                                            color: Color(
                                                                0x14000000),
                                                            offset: Offset(
                                                              0.0,
                                                              0.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 170.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12.0),
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  gridDesktopItem
                                                                      .imagemCapa,
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Container(
                                                                height: 120.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                gridDesktopItem.nomeEvento,
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      fontSize: MediaQuery.sizeOf(context).width > 480.0 ? 16.0 : 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Icon(
                                                                                    FFIcons.kmeDivirtaOFF,
                                                                                    color: FlutterFlowTheme.of(context).accent2,
                                                                                    size: 12.0,
                                                                                  ),
                                                                                  Text(
                                                                                    gridDesktopItem.tipoEvento,
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          fontSize: MediaQuery.sizeOf(context).width > 480.0 ? 14.0 : 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 4.0)),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Icon(
                                                                                    FFIcons.kcalendario,
                                                                                    color: FlutterFlowTheme.of(context).accent2,
                                                                                    size: 12.0,
                                                                                  ),
                                                                                  Text(
                                                                                    '${dateTimeFormat(
                                                                                      'E',
                                                                                      gridDesktopItem.dataHora,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    )}${dateTimeFormat(
                                                                                      'd',
                                                                                      gridDesktopItem.dataHora,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    )} - ${dateTimeFormat(
                                                                                      'Hm',
                                                                                      gridDesktopItem.dataHora,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    )}',
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          fontSize: MediaQuery.sizeOf(context).width > 480.0 ? 14.0 : 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 4.0)),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Icon(
                                                                                    FFIcons.kpikerMap,
                                                                                    color: FlutterFlowTheme.of(context).accent2,
                                                                                    size: 12.0,
                                                                                  ),
                                                                                  Flexible(
                                                                                    child: Text(
                                                                                      gridDesktopItem.local.maybeHandleOverflow(
                                                                                        maxChars: 16,
                                                                                        replacement: '…',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            fontSize: MediaQuery.sizeOf(context).width > 480.0 ? 14.0 : 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 4.0)),
                                                                              ),
                                                                            ].divide(SizedBox(height: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ME_DIVIRTA_MOSTRAR_EVENTO_BTN_ON_TAP');

                                                                  context
                                                                      .pushNamed(
                                                                    'meDivirtiDetalhesEvento',
                                                                    queryParameters:
                                                                        {
                                                                      'eventoRef':
                                                                          serializeParam(
                                                                        gridDesktopItem,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'eventoRef':
                                                                          gridDesktopItem,
                                                                    },
                                                                  );
                                                                },
                                                                text:
                                                                    'Mostrar evento',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 0.8,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
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
                                              controller:
                                                  _model.gridViewController,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  tablet: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final listaEventos =
                                              meDivirtaMeDiverteRecordList
                                                  .toList();
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                listaEventos.length,
                                                (listaEventosIndex) {
                                              final listaEventosItem =
                                                  listaEventos[
                                                      listaEventosIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'ME_DIVIRTA_Container_h6150dvr_ON_TAP');

                                                  context.pushNamed(
                                                    'meDivirtiDetalhesEvento',
                                                    queryParameters: {
                                                      'eventoRef':
                                                          serializeParam(
                                                        listaEventosItem,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'eventoRef':
                                                          listaEventosItem,
                                                    },
                                                  );
                                                },
                                                child: MedivirtaCardWidget(
                                                  key: Key(
                                                      'Keyh61_${listaEventosIndex}_of_${listaEventos.length}'),
                                                  fotoCapa: listaEventosItem
                                                      .imagemCapa,
                                                  tituloEvento: listaEventosItem
                                                      .nomeEvento,
                                                  tipoEvento: listaEventosItem
                                                      .tipoEvento,
                                                  local: listaEventosItem.local,
                                                  ingressoURL: listaEventosItem
                                                      .ingressoURL,
                                                  horario: listaEventosItem
                                                      .dataHora!,
                                                  km: listaEventosItem
                                                      .localizacaoGoogleMaps!,
                                                ),
                                              );
                                            }).divide(SizedBox(height: 12.0)),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
