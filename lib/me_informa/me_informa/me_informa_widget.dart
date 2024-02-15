import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/login/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/me_informa/meinforma_card_lista/meinforma_card_lista_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'me_informa_model.dart';
export 'me_informa_model.dart';

class MeInformaWidget extends StatefulWidget {
  const MeInformaWidget({super.key});

  @override
  State<MeInformaWidget> createState() => _MeInformaWidgetState();
}

class _MeInformaWidgetState extends State<MeInformaWidget> {
  late MeInformaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeInformaModel());

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

    return StreamBuilder<List<MateriasRecord>>(
      stream: queryMateriasRecord(
        queryBuilder: (materiasRecord) =>
            materiasRecord.orderBy('DataPublicacaoMateria', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<MateriasRecord> meInformaMateriasRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await _model.appBar?.animateTo(
                  0,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.ease,
                );
              },
              backgroundColor: FlutterFlowTheme.of(context).alternate,
              elevation: 6.0,
              child: Icon(
                Icons.arrow_upward_rounded,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 34.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                controller: _model.appBar,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: AuthUserStreamWidget(
                          builder: (context) => wrapWithModel(
                            model: _model.appbarGrupoMeModel,
                            updateCallback: () => setState(() {}),
                            child: AppbarGrupoMeWidget(
                              viewLeft: 'default',
                              viewRight: 'default',
                              title: 'informa',
                              tabbar: 'meinforma',
                              corText:
                                  FlutterFlowTheme.of(context).secondaryText,
                              perfil: valueOrDefault(
                                  currentUserDocument?.perfil, ''),
                              iconLeft: () async {},
                              iconRight: () async {},
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 300.0,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Stack(
                            children: [
                              Builder(
                                builder: (context) {
                                  final list = meInformaMateriasRecordList
                                      .where((e) => e.materiaDestaque == true)
                                      .toList()
                                      .take(5)
                                      .toList();
                                  return Container(
                                    width: double.infinity,
                                    height: 307.0,
                                    child: CarouselSlider.builder(
                                      itemCount: list.length,
                                      itemBuilder: (context, listIndex, _) {
                                        final listItem = list[listIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (loggedIn == true) {
                                              context.pushNamed(
                                                'meinformaDetalhesNoticia',
                                                queryParameters: {
                                                  'materiaRef': serializeParam(
                                                    listItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
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
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            UsarDeslogadoUsoExclusivoCompWidget(
                                                          usoExclusivo: false,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            }
                                          },
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  listItem.imagemCapa,
                                                  width: double.infinity,
                                                  height: 300.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0x1A000000),
                                                      Color(0x66000000)
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 32.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listItem.categoria,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3,
                                                              ),
                                                    ),
                                                    Text(
                                                      listItem.tituloMateria,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                        'relative',
                                                        listItem
                                                            .dataPublicacaoMateria!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      carouselController:
                                          _model.carouselController ??=
                                              CarouselController(),
                                      options: CarouselOptions(
                                        initialPage: min(1, list.length - 1),
                                        viewportFraction: 1.0,
                                        disableCenter: true,
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.25,
                                        enableInfiniteScroll: true,
                                        scrollDirection: Axis.horizontal,
                                        autoPlay: valueOrDefault<bool>(
                                          meInformaMateriasRecordList.length >
                                              1,
                                          false,
                                        ),
                                        autoPlayAnimationDuration:
                                            Duration(milliseconds: 800),
                                        autoPlayInterval: Duration(
                                            milliseconds: (800 + 6000)),
                                        autoPlayCurve: Curves.linear,
                                        pauseAutoPlayInFiniteScroll: true,
                                        onPageChanged: (index, _) =>
                                            _model.carouselCurrentIndex = index,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          if (FFAppState().EsconderDaTela == true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 32.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ECONOMIA',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                  Text(
                                    'Menos eleitores de Lula esperam alta na economia, diz Datafolha...',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                  Text(
                                    'Há 2 horas',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 1020.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 8.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dateTimeFormat(
                                    'EEEE',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: _model.rowController,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: FlutterFlowChoiceChips(
                                      options: [
                                        ChipData('Últimas'),
                                        ChipData('Saúde'),
                                        ChipData('Politica'),
                                        ChipData('Tempo'),
                                        ChipData('Esporte'),
                                        ChipData('Segurança'),
                                        ChipData('Transporte'),
                                        ChipData('Meio ambiente'),
                                        ChipData('Internacional'),
                                        ChipData('Arte/Cultura'),
                                        ChipData('Educação'),
                                        ChipData('Comunidade'),
                                        ChipData('Eventos'),
                                        ChipData('Cidades')
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .choiceChipsValue = val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        iconColor:
                                            FlutterFlowTheme.of(context).info,
                                        iconSize: 18.0,
                                        elevation: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        elevation: 1.0,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 8.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      initialized:
                                          _model.choiceChipsValue != null,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                        ['Últimas'],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ]
                                    .addToStart(SizedBox(width: 16.0))
                                    .addToEnd(SizedBox(width: 16.0)),
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (_model.choiceChipsValue == 'Últimas') {
                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final materias =
                                          meInformaMateriasRecordList.toList();
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(materias.length,
                                                (materiasIndex) {
                                          final materiasItem =
                                              materias[materiasIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (loggedIn == true) {
                                                context.pushNamed(
                                                  'meinformaDetalhesNoticia',
                                                  queryParameters: {
                                                    'materiaRef':
                                                        serializeParam(
                                                      materiasItem.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
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
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              UsarDeslogadoUsoExclusivoCompWidget(
                                                            usoExclusivo: true,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              }
                                            },
                                            child: MeinformaCardListaWidget(
                                              key: Key(
                                                  'Keykjo_${materiasIndex}_of_${materias.length}'),
                                              parameter1:
                                                  materiasItem.imagemCapa,
                                              parameter2:
                                                  materiasItem.categoria,
                                              parameter3:
                                                  materiasItem.tituloMateria,
                                              publicado: materiasItem
                                                  .dataPublicacaoMateria!,
                                            ),
                                          );
                                        })
                                            .divide(SizedBox(height: 12.0))
                                            .around(SizedBox(height: 12.0)),
                                      );
                                    },
                                  ),
                                );
                              } else if (meInformaMateriasRecordList
                                      .where((e) =>
                                          e.categoria ==
                                          valueOrDefault<String>(
                                            _model.choiceChipsValue,
                                            'todos',
                                          ))
                                      .toList()
                                      .length <
                                  1) {
                                return Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: Text(
                                      'Nenhuma matéria foi publicada com esse tema',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                );
                              } else {
                                return Builder(
                                  builder: (context) {
                                    final materias = meInformaMateriasRecordList
                                        .where((e) =>
                                            e.categoria ==
                                            valueOrDefault<String>(
                                              _model.choiceChipsValue,
                                              'todos',
                                            ))
                                        .toList();
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(materias.length,
                                              (materiasIndex) {
                                        final materiasItem =
                                            materias[materiasIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'meinformaDetalhesNoticia',
                                              queryParameters: {
                                                'materiaRef': serializeParam(
                                                  materiasItem.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: MeinformaCardListaWidget(
                                            key: Key(
                                                'Keyel6_${materiasIndex}_of_${materias.length}'),
                                            parameter1: materiasItem.imagemCapa,
                                            parameter2: materiasItem.categoria,
                                            parameter3:
                                                materiasItem.tituloMateria,
                                            publicado: materiasItem
                                                .dataPublicacaoMateria!,
                                          ),
                                        );
                                      })
                                          .divide(SizedBox(height: 12.0))
                                          .around(SizedBox(height: 12.0)),
                                    );
                                  },
                                );
                              }
                            },
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
      },
    );
  }
}
