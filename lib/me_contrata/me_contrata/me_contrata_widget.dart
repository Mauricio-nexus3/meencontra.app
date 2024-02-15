import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/me_contrata/mecontrata_card/mecontrata_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'me_contrata_model.dart';
export 'me_contrata_model.dart';

class MeContrataWidget extends StatefulWidget {
  const MeContrataWidget({super.key});

  @override
  State<MeContrataWidget> createState() => _MeContrataWidgetState();
}

class _MeContrataWidgetState extends State<MeContrataWidget> {
  late MeContrataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeContrataModel());

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

    return StreamBuilder<List<MeContrataVAGASRecord>>(
      stream: queryMeContrataVAGASRecord(
        queryBuilder: (meContrataVAGASRecord) => meContrataVAGASRecord
            .where(
              'Status',
              isEqualTo: 'Ativo',
            )
            .orderBy('Publicado', descending: true),
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
        List<MeContrataVAGASRecord> meContrataMeContrataVAGASRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await _model.columnController?.animateTo(
                  0,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.ease,
                );
              },
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              elevation: 8.0,
              child: Icon(
                Icons.arrow_upward_rounded,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 34.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                controller: _model.columnController,
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
                          title: 'contrata',
                          tabbar: 'mecontrata',
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
                      constraints: BoxConstraints(
                        maxWidth: 1020.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF4DE866),
                                    Color(0xFF0A8E1F)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(1.0, 0.17),
                                  end: AlignmentDirectional(-1.0, -0.17),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'SUA PROXIMA VAGA',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                              ),
                                              Text(
                                                'na palma da mão',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  'As principais vagas disponíveis esperando por você',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/me_contrata.svg',
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final vagasDisponiveis =
                                      meContrataMeContrataVAGASRecordList
                                          .toList();
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(vagasDisponiveis.length,
                                                (vagasDisponiveisIndex) {
                                      final vagasDisponiveisItem =
                                          vagasDisponiveis[
                                              vagasDisponiveisIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (loggedIn == true) {
                                            context.pushNamed(
                                              'meContrataDetalhesVaga',
                                              queryParameters: {
                                                'vagaRef': serializeParam(
                                                  vagasDisponiveisItem
                                                      .reference,
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
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
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
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        },
                                        child: MecontrataCardWidget(
                                          key: Key(
                                              'Key7rx_${vagasDisponiveisIndex}_of_${vagasDisponiveis.length}'),
                                          logoEmpresa:
                                              vagasDisponiveisItem.logoEmpresa,
                                          nomeVaga:
                                              vagasDisponiveisItem.nomeVaga,
                                          nomeEmpresa:
                                              vagasDisponiveisItem.nomeEmpresa,
                                          contrato: vagasDisponiveisItem
                                              .contratoTrabalho,
                                          cidade:
                                              vagasDisponiveisItem.localidade,
                                          publicado:
                                              vagasDisponiveisItem.publicado!,
                                        ),
                                      );
                                    })
                                            .divide(SizedBox(height: 12.0))
                                            .around(SizedBox(height: 12.0)),
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
