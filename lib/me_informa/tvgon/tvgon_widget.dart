import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_informa/card_perfil_t_v_g_ooficial/card_perfil_t_v_g_ooficial_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tvgon_model.dart';
export 'tvgon_model.dart';

class TvgonWidget extends StatefulWidget {
  const TvgonWidget({
    super.key,
    required this.imprensaRef,
  });

  final DocumentReference? imprensaRef;

  @override
  State<TvgonWidget> createState() => _TvgonWidgetState();
}

class _TvgonWidgetState extends State<TvgonWidget>
    with TickerProviderStateMixin {
  late TvgonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TvgonModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 14,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        parent: widget.imprensaRef,
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
        List<MateriasRecord> tvgonMateriasRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).alternate,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  FFIcons.karrowBack,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed('Feed');
                },
              ),
              title: Text(
                'TVGO Oficial',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://scontent.fpoa47-1.fna.fbcdn.net/v/t39.30808-6/391739264_719251970220390_4505414585992518868_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=Ihso1iRiGlEAX_-yT9x&_nc_ht=scontent.fpoa47-1.fna&oh=00_AfD70fJIQ7v2LzyDyL6jttINPp_zy8cAojv_lsCjH0nmdQ&oe=656D3382',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            'TVGO',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total de materias publicadas',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      fontSize: 14.0,
                                    ),
                              ),
                              Text(
                                tvgonMateriasRecordList.length.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      fontSize: 14.0,
                                    ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'CriarNovaMateria',
                                queryParameters: {
                                  'goRef': serializeParam(
                                    widget.imprensaRef,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Nova materia',
                            options: FFButtonOptions(
                              width: 335.0,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 170),
                            curve: Curves.easeIn,
                            height: 500.0,
                            decoration: BoxDecoration(),
                            child: StreamBuilder<List<MateriasRecord>>(
                              stream: queryMateriasRecord(
                                parent: widget.imprensaRef,
                                queryBuilder: (materiasRecord) => materiasRecord
                                    .orderBy('DataPublicacaoMateria',
                                        descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30.0,
                                      height: 30.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFF622AE2),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<MateriasRecord> tabBarMateriasRecordList =
                                    snapshot.data!;
                                return Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(0.0, 0),
                                      child: TabBar(
                                        isScrollable: true,
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .accent2,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                        unselectedLabelStyle: TextStyle(),
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 4.0, 12.0),
                                        tabs: [
                                          Tab(
                                            text: 'Politica',
                                          ),
                                          Tab(
                                            text: 'Saúde',
                                          ),
                                          Tab(
                                            text: 'Segurança',
                                          ),
                                          Tab(
                                            text: 'Esporte',
                                          ),
                                          Tab(
                                            text: 'Cidades',
                                          ),
                                          Tab(
                                            text: 'Eventos',
                                          ),
                                          Tab(
                                            text: 'Comunidade',
                                          ),
                                          Tab(
                                            text: 'Economia',
                                          ),
                                          Tab(
                                            text: 'Educação',
                                          ),
                                          Tab(
                                            text: 'Transporte',
                                          ),
                                          Tab(
                                            text: 'Arte/Cultura',
                                          ),
                                          Tab(
                                            text: 'Internacional',
                                          ),
                                          Tab(
                                            text: 'Meio Ambiente',
                                          ),
                                          Tab(
                                            text: 'Tempo',
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {}
                                          ][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel1,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Politica')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Politica')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel2,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Saúde')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Saúde')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel3,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Segurança')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Segurança')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel4,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Esporte')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Esporte')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel5,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Cidades')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Cidades')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel6,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Eventos')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Cidades')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel7,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Cominudade')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Cominudade')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel8,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Economia')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Economia')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel9,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Educação')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Educação')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel10,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Transporte')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Transporte')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel11,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Arte/Cultura')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Arte/Cultura')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel12,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Internacional')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Internacional')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel13,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Meio Ambiente')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Meio Ambiente')
                                                      .toList(),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .cardPerfilTVGOoficialModel14,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardPerfilTVGOoficialWidget(
                                              numeroMaterias:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Tempo')
                                                      .toList()
                                                      .length,
                                              materiaRef:
                                                  tabBarMateriasRecordList
                                                      .where((e) =>
                                                          e.categoria ==
                                                          'Tempo')
                                                      .toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 24.0))
                            .addToEnd(SizedBox(height: 24.0)),
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
