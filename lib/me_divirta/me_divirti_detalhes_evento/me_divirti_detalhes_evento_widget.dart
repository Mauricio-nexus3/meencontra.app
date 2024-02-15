import '/anunciante/componentes/map_google/map_google_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'me_divirti_detalhes_evento_model.dart';
export 'me_divirti_detalhes_evento_model.dart';

class MeDivirtiDetalhesEventoWidget extends StatefulWidget {
  const MeDivirtiDetalhesEventoWidget({
    super.key,
    required this.eventoRef,
  });

  final DocumentReference? eventoRef;

  @override
  State<MeDivirtiDetalhesEventoWidget> createState() =>
      _MeDivirtiDetalhesEventoWidgetState();
}

class _MeDivirtiDetalhesEventoWidgetState
    extends State<MeDivirtiDetalhesEventoWidget> {
  late MeDivirtiDetalhesEventoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeDivirtiDetalhesEventoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.eventoRef!.update({
        ...mapToFirestore(
          {
            'numeroVisualizacoes': FieldValue.increment(1.0),
          },
        ),
      });
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return StreamBuilder<MeDiverteRecord>(
      stream: MeDiverteRecord.getDocument(widget.eventoRef!),
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
        final meDivirtiDetalhesEventoMeDiverteRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AuthUserStreamWidget(
                      builder: (context) => wrapWithModel(
                        model: _model.appbarGrupoMeModel,
                        updateCallback: () => setState(() {}),
                        child: AppbarGrupoMeWidget(
                          viewLeft: 'voltar',
                          viewRight: 'editar',
                          title: 'divirta',
                          tabbar: 'medivirta',
                          corText:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          perfil:
                              valueOrDefault(currentUserDocument?.perfil, ''),
                          searchImg:
                              meDivirtiDetalhesEventoMeDiverteRecord.imagemCapa,
                          searchTitle:
                              meDivirtiDetalhesEventoMeDiverteRecord.nomeEvento,
                          searchDescription:
                              meDivirtiDetalhesEventoMeDiverteRecord.sobre,
                          searchTitlePage: 'medivirta',
                          iconLeft: () async {
                            context.safePop();
                          },
                          iconRight: () async {
                            context.pushNamed(
                              'EditarEvento',
                              queryParameters: {
                                'eventoRef': serializeParam(
                                  widget.eventoRef,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 250.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.network(
                                meDivirtiDetalhesEventoMeDiverteRecord
                                    .imagemCapa,
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if ((valueOrDefault<bool>(
                                      currentUserDocument?.isImprensa, false) ==
                                  true) ||
                              (valueOrDefault(
                                      currentUserDocument?.perfil, '') ==
                                  'Admin'))
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: AuthUserStreamWidget(
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
                                            (meDivirtiDetalhesEventoMeDiverteRecord
                                                        .notificacaoEnviada ==
                                                    true)
                                                ? null
                                                : () async {
                                                    var _shouldSetState = false;
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: Text(
                                                                        'Enviar notificação?'),
                                                                    content: Text(
                                                                        'Tem certeza quer enviar uma notificação para os usuarios desse evento?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Não enviar'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Sim, enviar notificação'),
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
                                                      _shouldSetState = true;
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            'medivirta: ${meDivirtiDetalhesEventoMeDiverteRecord.nomeEvento}',
                                                        notificationText:
                                                            meDivirtiDetalhesEventoMeDiverteRecord
                                                                .local,
                                                        notificationImageUrl:
                                                            meDivirtiDetalhesEventoMeDiverteRecord
                                                                .imagemCapa,
                                                        notificationSound:
                                                            'default',
                                                        userRefs: _model
                                                            .usuariosRef!
                                                            .map((e) =>
                                                                e.reference)
                                                            .toList(),
                                                        initialPageName:
                                                            'meDivirtiDetalhesEvento',
                                                        parameterData: {
                                                          'eventoRef':
                                                              widget.eventoRef,
                                                        },
                                                      );

                                                      await widget.eventoRef!
                                                          .update(
                                                              createMeDiverteRecordData(
                                                        notificacaoEnviada:
                                                            true,
                                                      ));
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'Notificação enviada'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
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
                                        text:
                                            meDivirtiDetalhesEventoMeDiverteRecord
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color:
                                              meDivirtiDetalhesEventoMeDiverteRecord
                                                          .notificacaoEnviada ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFF680C63),
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
                                        'Total de visualizações: ${meDivirtiDetalhesEventoMeDiverteRecord.numeroVisualizacoes.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                meDivirtiDetalhesEventoMeDiverteRecord
                                                    .nomeEvento,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                        ),
                                              ),
                                              if (meDivirtiDetalhesEventoMeDiverteRecord
                                                          .ingressoURL !=
                                                      null &&
                                                  meDivirtiDetalhesEventoMeDiverteRecord
                                                          .ingressoURL !=
                                                      '')
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  5.0,
                                                                  10.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            meDivirtiDetalhesEventoMeDiverteRecord
                                                                .plataformaTicket,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .confirmation_num_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 16.0,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    FFIcons.kmeDivirtaOFF,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 24.0,
                                                  ),
                                                  Text(
                                                    meDivirtiDetalhesEventoMeDiverteRecord
                                                        .tipoEvento,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.calendar_month,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 24.0,
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${dateTimeFormat(
                                                          'd',
                                                          meDivirtiDetalhesEventoMeDiverteRecord
                                                              .dataHora,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )} de ${dateTimeFormat(
                                                          'MMMM',
                                                          meDivirtiDetalhesEventoMeDiverteRecord
                                                              .dataHora,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            dateTimeFormat(
                                                              'EEEE',
                                                              meDivirtiDetalhesEventoMeDiverteRecord
                                                                  .dataHora!,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium,
                                                          ),
                                                          Text(
                                                            dateTimeFormat(
                                                              'Hm',
                                                              meDivirtiDetalhesEventoMeDiverteRecord
                                                                  .dataHora!,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        FFIcons.kpikerMap,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 24.0,
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            meDivirtiDetalhesEventoMeDiverteRecord
                                                                .local,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge,
                                                          ),
                                                          Text(
                                                            '${formatNumber(
                                                              functions.distanceBetweenTwoPoints(
                                                                  meDivirtiDetalhesEventoMeDiverteRecord
                                                                      .localizacaoGoogleMaps,
                                                                  currentUserLocationValue),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '0.0',
                                                              locale: 'br',
                                                            )}Km',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                ].divide(SizedBox(width: 12.0)),
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Sobre:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                        ),
                                              ),
                                              Text(
                                                meDivirtiDetalhesEventoMeDiverteRecord
                                                    .sobre,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 24.0)),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (meDivirtiDetalhesEventoMeDiverteRecord
                                                    .ingressoURL !=
                                                null &&
                                            meDivirtiDetalhesEventoMeDiverteRecord
                                                    .ingressoURL !=
                                                '')
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await launchURL(
                                                  meDivirtiDetalhesEventoMeDiverteRecord
                                                      .ingressoURL);
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 3.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Comprar ingresso',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .confirmation_num_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 24.0,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (meDivirtiDetalhesEventoMeDiverteRecord
                                                .localizacaoGoogleMaps !=
                                            null)
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                useSafeArea: true,
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
                                                        child: MapGoogleWidget(
                                                          google: meDivirtiDetalhesEventoMeDiverteRecord
                                                              .localizacaoGoogleMaps!,
                                                          endereco:
                                                              meDivirtiDetalhesEventoMeDiverteRecord
                                                                  .local,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Abrir mapa',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                    ),
                                                    Icon(
                                                      FFIcons.kmapMarker,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 24.0)),
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
