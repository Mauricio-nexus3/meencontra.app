import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import '/components/acao_tabale_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'meinforma_detalhes_noticia_model.dart';
export 'meinforma_detalhes_noticia_model.dart';

class MeinformaDetalhesNoticiaWidget extends StatefulWidget {
  const MeinformaDetalhesNoticiaWidget({
    super.key,
    required this.materiaRef,
  });

  final DocumentReference? materiaRef;

  @override
  State<MeinformaDetalhesNoticiaWidget> createState() =>
      _MeinformaDetalhesNoticiaWidgetState();
}

class _MeinformaDetalhesNoticiaWidgetState
    extends State<MeinformaDetalhesNoticiaWidget> {
  late MeinformaDetalhesNoticiaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeinformaDetalhesNoticiaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(currentUserDocument?.isImprensa, false) ==
          true) {
        return;
      }

      await widget.materiaRef!.update({
        ...mapToFirestore(
          {
            'numTotalLeitoresMateria': FieldValue.increment(1.0),
          },
        ),
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

    return StreamBuilder<MateriasRecord>(
      stream: MateriasRecord.getDocument(widget.materiaRef!),
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
        final meinformaDetalhesNoticiaMateriasRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) => AuthUserStreamWidget(
                            builder: (context) => wrapWithModel(
                              model: _model.appbarGrupoMeModel,
                              updateCallback: () => setState(() {}),
                              child: AppbarGrupoMeWidget(
                                viewLeft: 'voltar',
                                viewRight: 'editar',
                                title: 'informa',
                                tabbar: 'meinforma',
                                corText: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                perfil: valueOrDefault(
                                    currentUserDocument?.perfil, ''),
                                searchImg:
                                    meinformaDetalhesNoticiaMateriasRecord
                                        .imagemCapa,
                                searchTitle:
                                    meinformaDetalhesNoticiaMateriasRecord
                                        .tituloMateria,
                                searchDescription:
                                    meinformaDetalhesNoticiaMateriasRecord
                                        .conteudoMateria,
                                searchURL: _model.currentPageLink,
                                searchTitlePage: 'meinforma',
                                iconLeft: () async {
                                  context.safePop();
                                },
                                iconRight: () async {
                                  if (MediaQuery.sizeOf(context).width >
                                      991.0) {
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
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: AcaoTabaleWidget(
                                                compartiharURL: () async {},
                                                visualizar: () async {
                                                  context.pushNamed(
                                                    'meinformaDetalhesNoticia',
                                                    queryParameters: {
                                                      'materiaRef':
                                                          serializeParam(
                                                        meinformaDetalhesNoticiaMateriasRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                editar: () async {
                                                  context.pushNamed(
                                                    'EditarMateria',
                                                    queryParameters: {
                                                      'materiaRef':
                                                          serializeParam(
                                                        meinformaDetalhesNoticiaMateriasRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                excluir: () async {
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(
                                                                      'Excluir matéria?'),
                                                                  content: Text(
                                                                      'Você tem certeza que você quer excluir essa matéria?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Cancelar'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Sim, excluir'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    await meinformaDetalhesNoticiaMateriasRecord
                                                        .reference
                                                        .delete();
                                                  } else {
                                                    return;
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  } else {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: AcaoTabaleWidget(
                                                compartiharURL: () async {},
                                                visualizar: () async {
                                                  context.pushNamed(
                                                    'meinformaDetalhesNoticia',
                                                    queryParameters: {
                                                      'materiaRef':
                                                          serializeParam(
                                                        meinformaDetalhesNoticiaMateriasRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                editar: () async {
                                                  context.pushNamed(
                                                    'EditarMateria',
                                                    queryParameters: {
                                                      'materiaRef':
                                                          serializeParam(
                                                        meinformaDetalhesNoticiaMateriasRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                excluir: () async {
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(
                                                                      'Excluir matéria?'),
                                                                  content: Text(
                                                                      'Você tem certeza que você quer excluir essa matéria?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Cancelar'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Sim, excluir'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    await meinformaDetalhesNoticiaMateriasRecord
                                                        .reference
                                                        .delete();
                                                  } else {
                                                    return;
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                height: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 300.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 400.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 500.0;
                                  } else {
                                    return 600.0;
                                  }
                                }(),
                                decoration: BoxDecoration(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    meinformaDetalhesNoticiaMateriasRecord
                                        .imagemCapa,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                meinformaDetalhesNoticiaMateriasRecord
                                    .creditosImagem,
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if ((valueOrDefault<bool>(
                                              currentUserDocument?.isImprensa,
                                              false) ==
                                          true) ||
                                      (valueOrDefault(
                                              currentUserDocument?.perfil,
                                              '') ==
                                          'Admin'))
                                    AuthUserStreamWidget(
                                      builder: (context) => Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FFButtonWidget(
                                              onPressed:
                                                  (meinformaDetalhesNoticiaMateriasRecord
                                                              .notificacaoEnviada ==
                                                          true)
                                                      ? null
                                                      : () async {
                                                          var _shouldSetState =
                                                              false;
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          title:
                                                                              Text('Enviar notificação?'),
                                                                          content:
                                                                              Text('Tem certeza quer enviar uma notificação para os usuarios dessa matéria'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('Não enviar'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Sim, enviar notificação'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            _model.usuariosRef =
                                                                await queryUsersRecordOnce();
                                                            _shouldSetState =
                                                                true;
                                                            triggerPushNotification(
                                                              notificationTitle:
                                                                  'meinforma: ${meinformaDetalhesNoticiaMateriasRecord.tituloMateria}',
                                                              notificationText:
                                                                  meinformaDetalhesNoticiaMateriasRecord
                                                                      .conteudoMateria,
                                                              notificationImageUrl:
                                                                  meinformaDetalhesNoticiaMateriasRecord
                                                                      .imagemCapa,
                                                              notificationSound:
                                                                  'default',
                                                              userRefs: _model
                                                                  .usuariosRef!
                                                                  .map((e) => e
                                                                      .reference)
                                                                  .toList(),
                                                              initialPageName:
                                                                  'meinformaDetalhesNoticia',
                                                              parameterData: {
                                                                'materiaRef':
                                                                    meinformaDetalhesNoticiaMateriasRecord
                                                                        .reference,
                                                              },
                                                            );

                                                            await widget
                                                                .materiaRef!
                                                                .update(
                                                                    createMateriasRecordData(
                                                              notificacaoEnviada:
                                                                  true,
                                                            ));
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: Text(
                                                                        'Notificação enviada'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          } else {
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                              text: meinformaDetalhesNoticiaMateriasRecord
                                                          .notificacaoEnviada ==
                                                      false
                                                  ? 'Enviar notificação'
                                                  : 'Notificação enviada',
                                              icon: FaIcon(
                                                FontAwesomeIcons.solidBell,
                                                size: 16.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: meinformaDetalhesNoticiaMateriasRecord
                                                            .notificacaoEnviada ==
                                                        false
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .alternate
                                                    : Color(0xFF700718),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                        ),
                                                elevation: 1.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            Text(
                                              'Total de leitores: ${meinformaDetalhesNoticiaMateriasRecord.numTotalLeitoresMateria.toString()}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '● ${meinformaDetalhesNoticiaMateriasRecord.categoria}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xFFB60924),
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          meinformaDetalhesNoticiaMateriasRecord
                                              .tituloMateria,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge,
                                        ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Por ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text:
                                                    meinformaDetalhesNoticiaMateriasRecord
                                                        .escritoPor,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '${dateTimeFormat(
                                                'd/M/y',
                                                meinformaDetalhesNoticiaMateriasRecord
                                                    .dataPublicacaoMateria,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} ${dateTimeFormat(
                                                'Hm',
                                                meinformaDetalhesNoticiaMateriasRecord
                                                    .dataPublicacaoMateria,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                            Text(
                                              ' - ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                            Text(
                                              'Atualizado ${dateTimeFormat(
                                                'relative',
                                                meinformaDetalhesNoticiaMateriasRecord
                                                    .dataPublicacaoMateria,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Text(
                                    meinformaDetalhesNoticiaMateriasRecord
                                        .conteudoMateria,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 80.0,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Redação ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                            ),
                                            Icon(
                                              FFIcons.kvectorTvgoCorreto,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 28.0,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'LinkExterno',
                                                    queryParameters: {
                                                      'linkExterno':
                                                          serializeParam(
                                                        'https://www.facebook.com/tvgors',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.facebookF,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'LinkExterno',
                                                    queryParameters: {
                                                      'linkExterno':
                                                          serializeParam(
                                                        'https://www.instagram.com/tvgo.rs/',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.instagram,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'LinkExterno',
                                                    queryParameters: {
                                                      'linkExterno':
                                                          serializeParam(
                                                        'https://www.guaiba.online/',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.language_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) => InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.currentPageLink =
                                                        await generateCurrentPageLink(
                                                      context,
                                                      title:
                                                          'meinforma:   ${meinformaDetalhesNoticiaMateriasRecord.tituloMateria}',
                                                      imageUrl:
                                                          meinformaDetalhesNoticiaMateriasRecord
                                                              .imagemCapa,
                                                      description:
                                                          meinformaDetalhesNoticiaMateriasRecord
                                                              .conteudoMateria,
                                                    );

                                                    await Share.share(
                                                      _model.currentPageLink,
                                                      sharePositionOrigin:
                                                          getWidgetBoundingBox(
                                                              context),
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      Icons.ios_share,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 24.0))
                                    .around(SizedBox(height: 24.0)),
                              ),
                            ),
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
