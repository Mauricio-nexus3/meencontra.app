import '/anunciante/anunciante_page/componentes/avaliacoes/avaliacoes_widget.dart';
import '/anunciante/anunciante_page/componentes/contato/contato_widget.dart';
import '/anunciante/anunciante_page/componentes/map_google/map_google_widget.dart';
import '/anunciante/anunciante_page/componentes/mostrar_cards_lista/mostrar_cards_lista_widget.dart';
import '/anunciante/anunciante_page/componentes/sobre_anunciante/sobre_anunciante_widget.dart';
import '/anunciante/anunciante_page/produtos/card_produto/card_produto_widget.dart';
import '/anunciante/anunciante_page/produtos/grid_produto/grid_produto_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'templete_anunciante_model.dart';
export 'templete_anunciante_model.dart';

class TempleteAnuncianteWidget extends StatefulWidget {
  const TempleteAnuncianteWidget({
    super.key,
    required this.documentoAnunciante,
    this.produtosDoc,
    this.anuncios,
  });

  final AnuncianteRecord? documentoAnunciante;
  final List<ProdutoRecord>? produtosDoc;
  final List<AnunciosRecord>? anuncios;

  @override
  State<TempleteAnuncianteWidget> createState() =>
      _TempleteAnuncianteWidgetState();
}

class _TempleteAnuncianteWidgetState extends State<TempleteAnuncianteWidget>
    with TickerProviderStateMixin {
  late TempleteAnuncianteModel _model;

  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TempleteAnuncianteModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TEMPLETE_ANUNCIANTE_TempleteAnunciante_O');
      setState(() {
        _model.mostrarEmLista = false;
      });
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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

    return StreamBuilder<List<CatalogoRecord>>(
      stream: queryCatalogoRecord(
        parent: widget.documentoAnunciante?.reference,
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
        List<CatalogoRecord> containerFilhoCatalogoRecordList = snapshot.data!;
        return Container(
          decoration: BoxDecoration(),
          child: Builder(
            builder: (context) {
              if (widget.documentoAnunciante?.planoAssinatura != 'gratis') {
                return StreamBuilder<List<EnderecoRecord>>(
                  stream: queryEnderecoRecord(
                    parent: widget.documentoAnunciante?.reference,
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
                    List<EnderecoRecord> containerEnderecoRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerEnderecoRecord =
                        containerEnderecoRecordList.isNotEmpty
                            ? containerEnderecoRecordList.first
                            : null;
                    return Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Builder(
                        builder: (context) {
                          if ((widget.documentoAnunciante?.planoAssinatura !=
                                  'gratis') &&
                              (widget.documentoAnunciante?.templeteLayout ==
                                  'Profisional')) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      widget.documentoAnunciante!.logo,
                                      width: double.infinity,
                                      height: 330.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              widget.documentoAnunciante
                                                  ?.categoria,
                                              'categoria',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.documentoAnunciante
                                                    ?.nomeFantasia,
                                                'Nome',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            widget.documentoAnunciante
                                                            ?.nomeSubCategoria02 !=
                                                        null &&
                                                    widget.documentoAnunciante
                                                            ?.nomeSubCategoria02 !=
                                                        ''
                                                ? '${valueOrDefault<String>(
                                                    widget.documentoAnunciante
                                                        ?.nomeSubCategoria01,
                                                    'sub1',
                                                  )}, ${valueOrDefault<String>(
                                                    widget.documentoAnunciante
                                                        ?.nomeSubCategoria02,
                                                    'sub1',
                                                  )}'
                                                : valueOrDefault<String>(
                                                    widget.documentoAnunciante
                                                        ?.nomeSubCategoria01,
                                                    'sub1',
                                                  ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: RatingBar.builder(
                                              onRatingUpdate: (newValue) =>
                                                  setState(() =>
                                                      _model.ratingBarValue =
                                                          newValue),
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                              ),
                                              direction: Axis.horizontal,
                                              initialRating:
                                                  _model.ratingBarValue ??= 4.0,
                                              unratedColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              itemCount: 5,
                                              itemSize: 24.0,
                                              glowColor:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 12.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 70.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    widget.documentoAnunciante
                                                        ?.cor,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'TEMPLETE_ANUNCIANTE_Row_wdd71cqq_ON_TAP');

                                                        await widget
                                                            .documentoAnunciante!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'ConversasWhatsapp':
                                                                  FieldValue
                                                                      .increment(
                                                                          1.0),
                                                            },
                                                          ),
                                                        });
                                                        await launchURL(
                                                            'https://wa.me/55${valueOrDefault<String>(
                                                          widget
                                                              .documentoAnunciante
                                                              ?.whatsComercial,
                                                          'whatsapp',
                                                        )}?text=Ol%C3%A1%2C+vim+atrav%C3%A9s+do+Me.encontra+app.+Meu+nome+${functions.formatarParaWhatsApp(currentUserDisplayName)}+tudo+bem%3F');
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .whatsapp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Conversar',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 100.0,
                                                    child: VerticalDivider(
                                                      thickness: 1.0,
                                                      indent: 12.0,
                                                      endIndent: 12.0,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        widget
                                                            .documentoAnunciante
                                                            ?.cor,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'TEMPLETE_ANUNCIANTE_Row_1hvs4r4l_ON_TAP');
                                                        if (isWeb == true) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Não é suportado na versão web',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                            ),
                                                          );
                                                          return;
                                                        }

                                                        await widget
                                                            .documentoAnunciante!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'Ligacaoes':
                                                                  FieldValue
                                                                      .increment(
                                                                          1.0),
                                                            },
                                                          ),
                                                        });
                                                        await launchUrl(Uri(
                                                          scheme: 'tel',
                                                          path: valueOrDefault<
                                                              String>(
                                                            widget
                                                                .documentoAnunciante
                                                                ?.telefoneFixo,
                                                            'Telefone fixo',
                                                          ),
                                                        ));
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: Icon(
                                                              Icons
                                                                  .call_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Ligar',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              'Bio',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 8.0, 0.0, 12.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  widget.documentoAnunciante
                                                      ?.descricao,
                                                  'descricao',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 12.0),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: 'Portifólio',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 48.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: valueOrDefault<Color>(
                                                  widget
                                                      .documentoAnunciante?.cor,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                hoverColor:
                                                    valueOrDefault<Color>(
                                                  widget
                                                      .documentoAnunciante?.cor,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                hoverTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                hoverElevation: 2.0,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 12.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'TEMPLETE_ANUNCIANTE_COMENTAR_BTN_ON_TAP');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: AvaliacoesWidget(
                                                          anunciante: widget
                                                              .documentoAnunciante!,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              text: 'Comentar',
                                              icon: Icon(
                                                FFIcons.kcomentarios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 48.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                hoverColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                hoverBorderSide: BorderSide(
                                                  color: valueOrDefault<Color>(
                                                    widget.documentoAnunciante
                                                        ?.cor,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  width: 1.0,
                                                ),
                                                hoverTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                hoverElevation: 0.8,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 250.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(70.0),
                                                      bottomRight:
                                                          Radius.circular(70.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 200.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FFAppState()
                                                                .corSelecionadaAnunciante,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              widget.documentoAnunciante
                                                                          ?.capa !=
                                                                      ''
                                                                  ? widget
                                                                      .documentoAnunciante!
                                                                      .capa
                                                                  : widget
                                                                      .documentoAnunciante!
                                                                      .logo,
                                                              width: 20.0,
                                                              height: 140.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Container(
                                                            width: 120.0,
                                                            height: 120.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                widget
                                                                    .documentoAnunciante
                                                                    ?.logo,
                                                                'logo',
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          widget
                                                              .documentoAnunciante
                                                              ?.nomeFantasia,
                                                          'Nome Fantasia',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .star_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                                size: 16.0,
                                                              ),
                                                              SelectionArea(
                                                                  child: Text(
                                                                formatNumber(
                                                                  widget
                                                                      .documentoAnunciante!
                                                                      .notaMedia,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .commaDecimal,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              )),
                                                            ].divide(SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .mapMarkerAlt,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${formatNumber(
                                                              functions.distanceBetweenTwoPoints(
                                                                  containerEnderecoRecord
                                                                      ?.googleMaps,
                                                                  currentUserLocationValue),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '0.0',
                                                              locale: 'br',
                                                            )}Km',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 24.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'TEMPLETE_ANUNCIANTE_COMP_Whats_ON_TAP');

                                                          await widget
                                                              .documentoAnunciante!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'ConversasWhatsapp':
                                                                    FieldValue
                                                                        .increment(
                                                                            1.0),
                                                              },
                                                            ),
                                                          });
                                                          await launchURL(
                                                              'https://wa.me/55${valueOrDefault<String>(
                                                            widget
                                                                .documentoAnunciante
                                                                ?.whatsComercial,
                                                            'whatsapp',
                                                          )}?text=Ol%C3%A1%2C+vim+atrav%C3%A9s+do+Me.encontra+app.+Meu+nome+${functions.formatarParaWhatsApp(currentUserDisplayName)}+tudo+bem%3F');
                                                        },
                                                        child: Container(
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF25D366),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Whatsapp',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .whatsapp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 8.0,
                                                      buttonSize: 45.0,
                                                      fillColor:
                                                          Color(0xFFC3FFDD),
                                                      icon: Icon(
                                                        Icons.call,
                                                        color:
                                                            Color(0xFF25D366),
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'TEMPLETE_ANUNCIANTE_COMP_call_ICN_ON_TAP');
                                                        if (isWeb == true) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Não é suportado na versão web',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                            ),
                                                          );
                                                          return;
                                                        }

                                                        await widget
                                                            .documentoAnunciante!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'Ligacaoes':
                                                                  FieldValue
                                                                      .increment(
                                                                          1.0),
                                                            },
                                                          ),
                                                        });
                                                        await launchUrl(Uri(
                                                          scheme: 'tel',
                                                          path: valueOrDefault<
                                                              String>(
                                                            widget
                                                                .documentoAnunciante
                                                                ?.telefoneFixo,
                                                            'Telefone fixo',
                                                          ),
                                                        ));
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 24.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 200.0,
                                                            buttonSize: 48.0,
                                                            fillColor:
                                                                valueOrDefault<
                                                                    Color>(
                                                              FFAppState()
                                                                  .corSelecionadaAnunciante,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                            icon: Icon(
                                                              FFIcons
                                                                  .kinformacao,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'TEMPLETE_ANUNCIANTE_informacao_ICN_ON_TA');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                useSafeArea:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          SobreAnuncianteWidget(
                                                                        anunciante:
                                                                            widget.documentoAnunciante!,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'iconButtonOnPageLoadAnimation1']!),
                                                          Text(
                                                            'Sobre',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 200.0,
                                                            buttonSize: 48.0,
                                                            fillColor:
                                                                valueOrDefault<
                                                                    Color>(
                                                              FFAppState()
                                                                  .corSelecionadaAnunciante,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                            icon: Icon(
                                                              FFIcons
                                                                  .kmapMarker,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'TEMPLETE_ANUNCIANTE_mapMarker_ICN_ON_TAP');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                useSafeArea:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          MapGoogleWidget(
                                                                        google:
                                                                            containerEnderecoRecord!.googleMaps!,
                                                                        endereco:
                                                                            valueOrDefault<String>(
                                                                          widget
                                                                              .documentoAnunciante
                                                                              ?.enderecoCompleto,
                                                                          'Endereço',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'iconButtonOnPageLoadAnimation2']!),
                                                          Text(
                                                            'Localização',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 200.0,
                                                            buttonSize: 48.0,
                                                            fillColor:
                                                                valueOrDefault<
                                                                    Color>(
                                                              FFAppState()
                                                                  .corSelecionadaAnunciante,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .instagram,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'TEMPLETE_ANUNCIANTE_instagram_ICN_ON_TAP');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                useSafeArea:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          ContatoWidget(
                                                                        anuncianteDoc:
                                                                            widget.documentoAnunciante!,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'iconButtonOnPageLoadAnimation3']!),
                                                          Text(
                                                            'Contato',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 200.0,
                                                            buttonSize: 48.0,
                                                            fillColor:
                                                                valueOrDefault<
                                                                    Color>(
                                                              FFAppState()
                                                                  .corSelecionadaAnunciante,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                            icon: Icon(
                                                              FFIcons
                                                                  .kcomentarios,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'TEMPLETE_ANUNCIANTE_comentarios_ICN_ON_T');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                useSafeArea:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          AvaliacoesWidget(
                                                                        anunciante:
                                                                            widget.documentoAnunciante!,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'iconButtonOnPageLoadAnimation4']!),
                                                          Text(
                                                            'Comentários',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (FFAppState()
                                              .templeteLayoutSelecionado ==
                                          'E-comerce') {
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 1080.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Popular',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final listDestaqueEmDestaque = (widget.produtosDoc?.where((e) => e.ativo == true).toList()?.toList() ??
                                                                              [])
                                                                          .take(
                                                                              5)
                                                                          .toList();
                                                                      return SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              listDestaqueEmDestaque.length,
                                                                              (listDestaqueEmDestaqueIndex) {
                                                                            final listDestaqueEmDestaqueItem =
                                                                                listDestaqueEmDestaque[listDestaqueEmDestaqueIndex];
                                                                            return CardProdutoWidget(
                                                                              key: Key('Keytym_${listDestaqueEmDestaqueIndex}_of_${listDestaqueEmDestaque.length}'),
                                                                              produto: listDestaqueEmDestaqueItem,
                                                                            );
                                                                          }).divide(
                                                                              SizedBox(width: 8.0)),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          12.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          12.0)),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            wrapWithModel(
                                                                          model:
                                                                              _model.mostrarCardsListaModel1,
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          child:
                                                                              MostrarCardsListaWidget(
                                                                            parameter1:
                                                                                _model.mostrarEmLista,
                                                                            parameter2:
                                                                                valueOrDefault<Color>(
                                                                              widget.documentoAnunciante?.cor,
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                            qntProdutos:
                                                                                widget.produtosDoc!.length,
                                                                            imgGrid:
                                                                                () async {
                                                                              logFirebaseEvent('TEMPLETE_ANUNCIANTE_Container_7py8k0bk_C');
                                                                              setState(() {
                                                                                _model.mostrarEmLista = false;
                                                                              });
                                                                            },
                                                                            imgList:
                                                                                () async {
                                                                              logFirebaseEvent('TEMPLETE_ANUNCIANTE_Container_7py8k0bk_C');
                                                                              setState(() {
                                                                                _model.mostrarEmLista = true;
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                if (_model
                                                                        .mostrarEmLista ==
                                                                    false)
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                          tabletLandscape:
                                                                              false,
                                                                          desktop:
                                                                              false,
                                                                        ))
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: valueOrDefault<Color>(
                                                                                        widget.documentoAnunciante?.cor,
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(8.0),
                                                                                      child: Text(
                                                                                        'Todos',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      final categoriaCatalogo = containerFilhoCatalogoRecordList.toList();
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: List.generate(categoriaCatalogo.length, (categoriaCatalogoIndex) {
                                                                                          final categoriaCatalogoItem = categoriaCatalogo[categoriaCatalogoIndex];
                                                                                          return Container(
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(8.0),
                                                                                              child: Text(
                                                                                                'Masculino',
                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: valueOrDefault<Color>(
                                                                                                        widget.documentoAnunciante?.cor,
                                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }).divide(SizedBox(width: 4.0)),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ].divide(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        Container(
                                                                          height:
                                                                              600.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final catalogoVar = widget.produtosDoc?.toList() ?? [];
                                                                              return GridView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                  crossAxisCount: 2,
                                                                                  crossAxisSpacing: 8.0,
                                                                                  mainAxisSpacing: 8.0,
                                                                                  childAspectRatio: 1.0,
                                                                                ),
                                                                                primary: false,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: catalogoVar.length,
                                                                                itemBuilder: (context, catalogoVarIndex) {
                                                                                  final catalogoVarItem = catalogoVar[catalogoVarIndex];
                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('TEMPLETE_ANUNCIANTE_Container_7gdz3tr3_O');

                                                                                      context.pushNamed(
                                                                                        'DetalhesProduto',
                                                                                        queryParameters: {
                                                                                          'detalhesProduto': serializeParam(
                                                                                            catalogoVarItem,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                          'anunciante': serializeParam(
                                                                                            widget.documentoAnunciante,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                          'moreProdutos': serializeParam(
                                                                                            widget.produtosDoc,
                                                                                            ParamType.Document,
                                                                                            true,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'detalhesProduto': catalogoVarItem,
                                                                                          'anunciante': widget.documentoAnunciante,
                                                                                          'moreProdutos': widget.produtosDoc,
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    child: GridProdutoWidget(
                                                                                      key: Key('Key7gd_${catalogoVarIndex}_of_${catalogoVar.length}'),
                                                                                      titulo: catalogoVarItem.nomeProduto,
                                                                                      valor: catalogoVarItem.valorVenda,
                                                                                      img: catalogoVarItem.imagensProduto.first,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 12.0)),
                                                                    ),
                                                                  ),
                                                                if (_model
                                                                        .mostrarEmLista ==
                                                                    true)
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                        ))
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: valueOrDefault<Color>(
                                                                                        widget.documentoAnunciante?.cor,
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(8.0),
                                                                                      child: Text(
                                                                                        'Todos',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      final categoriaCatalogo = containerFilhoCatalogoRecordList.toList();
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: List.generate(categoriaCatalogo.length, (categoriaCatalogoIndex) {
                                                                                          final categoriaCatalogoItem = categoriaCatalogo[categoriaCatalogoIndex];
                                                                                          return Container(
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(8.0),
                                                                                              child: Text(
                                                                                                'Masculino',
                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: valueOrDefault<Color>(
                                                                                                        widget.documentoAnunciante?.cor,
                                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }).divide(SizedBox(width: 4.0)),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ].divide(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        Container(
                                                                          height:
                                                                              600.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final listaProdutos = widget.produtosDoc?.toList() ?? [];
                                                                              return ListView.separated(
                                                                                padding: EdgeInsets.zero,
                                                                                primary: false,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: listaProdutos.length,
                                                                                separatorBuilder: (_, __) => SizedBox(height: 12.0),
                                                                                itemBuilder: (context, listaProdutosIndex) {
                                                                                  final listaProdutosItem = listaProdutos[listaProdutosIndex];
                                                                                  return Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('TEMPLETE_ANUNCIANTE_Row_j325euhm_ON_TAP');

                                                                                          context.pushNamed(
                                                                                            'DetalhesProduto',
                                                                                            queryParameters: {
                                                                                              'detalhesProduto': serializeParam(
                                                                                                listaProdutosItem,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'anunciante': serializeParam(
                                                                                                widget.documentoAnunciante,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'moreProdutos': serializeParam(
                                                                                                widget.produtosDoc,
                                                                                                ParamType.Document,
                                                                                                true,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'detalhesProduto': listaProdutosItem,
                                                                                              'anunciante': widget.documentoAnunciante,
                                                                                              'moreProdutos': widget.produtosDoc,
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 70.0,
                                                                                              height: 70.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x4C4B39EF),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(2.0),
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                  child: Image.network(
                                                                                                    listaProdutosItem.imagensProduto.first,
                                                                                                    width: double.infinity,
                                                                                                    height: double.infinity,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        child: Text(
                                                                                                          listaProdutosItem.nomeProduto,
                                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            formatNumber(
                                                                                                              listaProdutosItem.valorVenda,
                                                                                                              formatType: FormatType.decimal,
                                                                                                              decimalType: DecimalType.commaDecimal,
                                                                                                              currency: 'R\$',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                                  color: Color(0xFF57636C),
                                                                                                                  fontSize: 14.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 8.0)),
                                                                                              ),
                                                                                            ),
                                                                                            FlutterFlowIconButton(
                                                                                              borderRadius: 20.0,
                                                                                              buttonSize: 40.0,
                                                                                              icon: Icon(
                                                                                                Icons.navigate_next,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              onPressed: () {
                                                                                                print('IconButton pressed ...');
                                                                                              },
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 12.0)),
                                                                    ),
                                                                  ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          12.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          12.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 24.0))
                                                          .around(SizedBox(
                                                              height: 24.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 24.0)),
                                          ),
                                        );
                                      } else if (FFAppState()
                                              .templeteLayoutSelecionado ==
                                          'Delivery') {
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Os mais pedidos',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 24.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 200.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 4.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final listaProdutoEmDestaque = (widget
                                                                    .produtosDoc
                                                                    ?.where((e) =>
                                                                        e.ativo ==
                                                                        true)
                                                                    .toList()
                                                                    ?.toList() ??
                                                                [])
                                                            .take(5)
                                                            .toList();
                                                        return ListView
                                                            .separated(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      12.0),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              listaProdutoEmDestaque
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  width: 12.0),
                                                          itemBuilder: (context,
                                                              listaProdutoEmDestaqueIndex) {
                                                            final listaProdutoEmDestaqueItem =
                                                                listaProdutoEmDestaque[
                                                                    listaProdutoEmDestaqueIndex];
                                                            return Container(
                                                              width: 140.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'TEMPLETE_ANUNCIANTE_Column_vagfg1xo_ON_T');

                                                                  context
                                                                      .pushNamed(
                                                                    'DetalhesProduto',
                                                                    queryParameters:
                                                                        {
                                                                      'detalhesProduto':
                                                                          serializeParam(
                                                                        listaProdutoEmDestaqueItem,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'anunciante':
                                                                          serializeParam(
                                                                        widget
                                                                            .documentoAnunciante,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'moreProdutos':
                                                                          serializeParam(
                                                                        widget
                                                                            .produtosDoc,
                                                                        ParamType
                                                                            .Document,
                                                                        true,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'detalhesProduto':
                                                                          listaProdutoEmDestaqueItem,
                                                                      'anunciante':
                                                                          widget
                                                                              .documentoAnunciante,
                                                                      'moreProdutos':
                                                                          widget
                                                                              .produtosDoc,
                                                                    },
                                                                  );
                                                                },
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        listaProdutoEmDestaqueItem
                                                                            .imagensProduto
                                                                            .first,
                                                                        width:
                                                                            140.0,
                                                                        height:
                                                                            120.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        listaProdutoEmDestaqueItem
                                                                            .valorVenda,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.commaDecimal,
                                                                        currency:
                                                                            'R\$',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).success,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        listaProdutoEmDestaqueItem
                                                                            .nomeProduto,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          7.0)),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .mostrarCardsListaModel2,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              MostrarCardsListaWidget(
                                                            parameter1: _model
                                                                .mostrarEmLista,
                                                            parameter2:
                                                                valueOrDefault<
                                                                    Color>(
                                                              widget
                                                                  .documentoAnunciante
                                                                  ?.cor,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                            qntProdutos: widget
                                                                .produtosDoc!
                                                                .length,
                                                            imgGrid: () async {
                                                              logFirebaseEvent(
                                                                  'TEMPLETE_ANUNCIANTE_Container_or3mlq84_C');
                                                              setState(() {
                                                                _model.mostrarEmLista =
                                                                    false;
                                                              });
                                                            },
                                                            imgList: () async {
                                                              logFirebaseEvent(
                                                                  'TEMPLETE_ANUNCIANTE_Container_or3mlq84_C');
                                                              setState(() {
                                                                _model.mostrarEmLista =
                                                                    true;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (_model.mostrarEmLista ==
                                                  false)
                                                Container(
                                                  width: double.infinity,
                                                  height: 380.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final gridProduto =
                                                            widget.produtosDoc
                                                                    ?.toList() ??
                                                                [];
                                                        return GridView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                10.0,
                                                            mainAxisSpacing:
                                                                10.0,
                                                            childAspectRatio:
                                                                1.7,
                                                          ),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: gridProduto
                                                              .length,
                                                          itemBuilder: (context,
                                                              gridProdutoIndex) {
                                                            final gridProdutoItem =
                                                                gridProduto[
                                                                    gridProdutoIndex];
                                                            return Container(
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'TEMPLETE_ANUNCIANTE_Column_fvwaxvhp_ON_T');

                                                                  context
                                                                      .pushNamed(
                                                                    'DetalhesProduto',
                                                                    queryParameters:
                                                                        {
                                                                      'detalhesProduto':
                                                                          serializeParam(
                                                                        gridProdutoItem,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'anunciante':
                                                                          serializeParam(
                                                                        widget
                                                                            .documentoAnunciante,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'moreProdutos':
                                                                          serializeParam(
                                                                        widget
                                                                            .produtosDoc,
                                                                        ParamType
                                                                            .Document,
                                                                        true,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'detalhesProduto':
                                                                          gridProdutoItem,
                                                                      'anunciante':
                                                                          widget
                                                                              .documentoAnunciante,
                                                                      'moreProdutos':
                                                                          widget
                                                                              .produtosDoc,
                                                                    },
                                                                  );
                                                                },
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        gridProdutoItem
                                                                            .imagensProduto
                                                                            .first,
                                                                        width:
                                                                            140.0,
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        gridProdutoItem
                                                                            .valorVenda,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.commaDecimal,
                                                                        currency:
                                                                            'R\$',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        gridProdutoItem
                                                                            .nomeProduto,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              if (_model.mostrarEmLista == true)
                                                Container(
                                                  width: double.infinity,
                                                  height: 600.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final lista2Produto =
                                                            widget.produtosDoc
                                                                    ?.toList() ??
                                                                [];
                                                        return ListView
                                                            .separated(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      12.0),
                                                          primary: false,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              lista2Produto
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 12.0),
                                                          itemBuilder: (context,
                                                              lista2ProdutoIndex) {
                                                            final lista2ProdutoItem =
                                                                lista2Produto[
                                                                    lista2ProdutoIndex];
                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'TEMPLETE_ANUNCIANTE_Row_pet6owfd_ON_TAP');

                                                                      context
                                                                          .pushNamed(
                                                                        'DetalhesProduto',
                                                                        queryParameters:
                                                                            {
                                                                          'detalhesProduto':
                                                                              serializeParam(
                                                                            lista2ProdutoItem,
                                                                            ParamType.Document,
                                                                          ),
                                                                          'anunciante':
                                                                              serializeParam(
                                                                            widget.documentoAnunciante,
                                                                            ParamType.Document,
                                                                          ),
                                                                          'moreProdutos':
                                                                              serializeParam(
                                                                            widget.produtosDoc,
                                                                            ParamType.Document,
                                                                            true,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'detalhesProduto':
                                                                              lista2ProdutoItem,
                                                                          'anunciante':
                                                                              widget.documentoAnunciante,
                                                                          'moreProdutos':
                                                                              widget.produtosDoc,
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children:
                                                                          [
                                                                        Flexible(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    lista2ProdutoItem.nomeProduto,
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                          fontFamily: 'Inter',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    lista2ProdutoItem.descricaoProduto,
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 4.0)),
                                                                              ),
                                                                              Text(
                                                                                formatNumber(
                                                                                  lista2ProdutoItem.valorVenda,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.commaDecimal,
                                                                                  currency: 'R\$',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 8.0)),
                                                                          ),
                                                                        ),
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          child:
                                                                              Image.network(
                                                                            lista2ProdutoItem.imagensProduto.first,
                                                                            width:
                                                                                120.0,
                                                                            height:
                                                                                100.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 4.0)),
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                            ]
                                                .divide(SizedBox(height: 12.0))
                                                .around(SizedBox(height: 12.0)),
                                          ),
                                        );
                                      } else if (FFAppState()
                                              .templeteLayoutSelecionado ==
                                          'Agencia') {
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Em destaque',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                height: 200.0,
                                                decoration: BoxDecoration(),
                                                child: Builder(
                                                  builder: (context) {
                                                    final listaproduto = (widget
                                                                .produtosDoc
                                                                ?.where((e) =>
                                                                    e.ativo ==
                                                                    true)
                                                                .toList()
                                                                ?.toList() ??
                                                            [])
                                                        .take(5)
                                                        .toList();
                                                    return ListView.separated(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16.0),
                                                      primary: false,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          listaproduto.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(width: 16.0),
                                                      itemBuilder: (context,
                                                          listaprodutoIndex) {
                                                        final listaprodutoItem =
                                                            listaproduto[
                                                                listaprodutoIndex];
                                                        return Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 0.5,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                          ),
                                                          child: Container(
                                                            width: 260.0,
                                                            height: 200.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
                                                                      child: Image
                                                                          .network(
                                                                        listaprodutoItem
                                                                            .imagensProduto
                                                                            .first,
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .shadow10,
                                                                        borderRadius:
                                                                            BorderRadius.circular(24.0),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'TEMPLETE_ANUNCIANTE_Column_pnfvmgk2_ON_T');

                                                                    context
                                                                        .pushNamed(
                                                                      'DetalhesProduto',
                                                                      queryParameters:
                                                                          {
                                                                        'detalhesProduto':
                                                                            serializeParam(
                                                                          listaprodutoItem,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                        'anunciante':
                                                                            serializeParam(
                                                                          widget
                                                                              .documentoAnunciante,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                        'moreProdutos':
                                                                            serializeParam(
                                                                          widget
                                                                              .produtosDoc,
                                                                          ParamType
                                                                              .Document,
                                                                          true,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'detalhesProduto':
                                                                            listaprodutoItem,
                                                                        'anunciante':
                                                                            widget.documentoAnunciante,
                                                                        'moreProdutos':
                                                                            widget.produtosDoc,
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Text(
                                                                                  listaprodutoItem.nomeProduto,
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              80.0,
                                                                          height:
                                                                              48.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().corSelecionadaAnunciante,
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(0.0),
                                                                              topRight: Radius.circular(24.0),
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.arrow_right_alt,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                32.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .mostrarCardsListaModel3,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            MostrarCardsListaWidget(
                                                          parameter1: _model
                                                              .mostrarEmLista,
                                                          parameter2:
                                                              valueOrDefault<
                                                                  Color>(
                                                            FFAppState()
                                                                .corSelecionadaAnunciante,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                          qntProdutos: widget
                                                              .produtosDoc!
                                                              .length,
                                                          imgGrid: () async {
                                                            logFirebaseEvent(
                                                                'TEMPLETE_ANUNCIANTE_Container_qp1cmx3t_C');
                                                            setState(() {
                                                              _model.mostrarEmLista =
                                                                  false;
                                                            });
                                                          },
                                                          imgList: () async {
                                                            logFirebaseEvent(
                                                                'TEMPLETE_ANUNCIANTE_Container_qp1cmx3t_C');
                                                            setState(() {
                                                              _model.mostrarEmLista =
                                                                  true;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (_model.mostrarEmLista ==
                                                  false)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 0.8,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Container(
                                                      height: 600.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final gridLista = widget
                                                                  .produtosDoc
                                                                  ?.toList() ??
                                                              [];
                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount: gridLista
                                                                .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                SizedBox(
                                                                    height:
                                                                        16.0),
                                                            itemBuilder: (context,
                                                                gridListaIndex) {
                                                              final gridListaItem =
                                                                  gridLista[
                                                                      gridListaIndex];
                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'TEMPLETE_ANUNCIANTE_Column_bsqyamao_ON_T');

                                                                    context
                                                                        .pushNamed(
                                                                      'DetalhesProduto',
                                                                      queryParameters:
                                                                          {
                                                                        'detalhesProduto':
                                                                            serializeParam(
                                                                          gridListaItem,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                        'anunciante':
                                                                            serializeParam(
                                                                          widget
                                                                              .documentoAnunciante,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                        'moreProdutos':
                                                                            serializeParam(
                                                                          widget
                                                                              .produtosDoc,
                                                                          ParamType
                                                                              .Document,
                                                                          true,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'detalhesProduto':
                                                                            gridListaItem,
                                                                        'anunciante':
                                                                            widget.documentoAnunciante,
                                                                        'moreProdutos':
                                                                            widget.produtosDoc,
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(12.0),
                                                                          topRight:
                                                                              Radius.circular(12.0),
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          gridListaItem
                                                                              .imagensProduto
                                                                              .first,
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              200.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            4.0,
                                                                            8.0,
                                                                            4.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Flexible(
                                                                              child: Text(
                                                                                gridListaItem.nomeProduto,
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              formatNumber(
                                                                                gridListaItem.valorVenda,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.commaDecimal,
                                                                                currency: 'R\$',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model.mostrarEmLista == true)
                                                Container(
                                                  width: double.infinity,
                                                  height: 600.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final listview = widget
                                                                .produtosDoc
                                                                ?.toList() ??
                                                            [];
                                                        return ListView
                                                            .separated(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      12.0),
                                                          primary: false,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listview.length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 12.0),
                                                          itemBuilder: (context,
                                                              listviewIndex) {
                                                            final listviewItem =
                                                                listview[
                                                                    listviewIndex];
                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'TEMPLETE_ANUNCIANTE_Row_oell490h_ON_TAP');

                                                                      context
                                                                          .pushNamed(
                                                                        'DetalhesProduto',
                                                                        queryParameters:
                                                                            {
                                                                          'detalhesProduto':
                                                                              serializeParam(
                                                                            listviewItem,
                                                                            ParamType.Document,
                                                                          ),
                                                                          'anunciante':
                                                                              serializeParam(
                                                                            widget.documentoAnunciante,
                                                                            ParamType.Document,
                                                                          ),
                                                                          'moreProdutos':
                                                                              serializeParam(
                                                                            widget.produtosDoc,
                                                                            ParamType.Document,
                                                                            true,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'detalhesProduto':
                                                                              listviewItem,
                                                                          'anunciante':
                                                                              widget.documentoAnunciante,
                                                                          'moreProdutos':
                                                                              widget.produtosDoc,
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children:
                                                                          [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(12.0),
                                                                            bottomRight:
                                                                                Radius.circular(4.0),
                                                                            topLeft:
                                                                                Radius.circular(12.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            listviewItem.imagensProduto.first,
                                                                            width:
                                                                                160.0,
                                                                            height:
                                                                                120.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      listviewItem.nomeProduto,
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: 'Inter',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      listviewItem.nomeProduto,
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 4.0)),
                                                                                ),
                                                                                Text(
                                                                                  formatNumber(
                                                                                    listviewItem.valorVenda,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.commaDecimal,
                                                                                    currency: 'R\$',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                            ]
                                                .divide(SizedBox(height: 16.0))
                                                .around(SizedBox(height: 16.0)),
                                          ),
                                        );
                                      } else {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 700.0,
                                              constraints: BoxConstraints(
                                                minHeight: 500.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Flexible(
                                                      child: Column(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                Alignment(
                                                                    0.0, 0),
                                                            child: TabBar(
                                                              isScrollable:
                                                                  true,
                                                              labelColor:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                FFAppState()
                                                                    .corSelecionadaAnunciante,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              unselectedLabelStyle:
                                                                  TextStyle(),
                                                              indicatorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              tabs: [
                                                                Tab(
                                                                  text:
                                                                      'Produtos',
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .ksacola,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                                Tab(
                                                                  text:
                                                                      'Anúncio',
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .kanuncios,
                                                                  ),
                                                                ),
                                                              ],
                                                              controller: _model
                                                                  .tabBarController,
                                                              onTap: (i) async {
                                                                [
                                                                  () async {},
                                                                  () async {}
                                                                ][i]();
                                                              },
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: TabBarView(
                                                              controller: _model
                                                                  .tabBarController,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final produtos =
                                                                              widget.produtosDoc?.toList() ?? [];
                                                                          return GridView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            gridDelegate:
                                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                                              crossAxisCount: 2,
                                                                              crossAxisSpacing: 8.0,
                                                                              mainAxisSpacing: 8.0,
                                                                              childAspectRatio: 1.0,
                                                                            ),
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                produtos.length,
                                                                            itemBuilder:
                                                                                (context, produtosIndex) {
                                                                              final produtosItem = produtos[produtosIndex];
                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Material(
                                                                                        color: Colors.transparent,
                                                                                        elevation: 2.0,
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          height: double.infinity,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('TEMPLETE_ANUNCIANTE_Image_wsflzqib_ON_TA');
                                                                                              await Navigator.push(
                                                                                                context,
                                                                                                PageTransition(
                                                                                                  type: PageTransitionType.fade,
                                                                                                  child: FlutterFlowExpandedImageView(
                                                                                                    image: CachedNetworkImage(
                                                                                                      fadeInDuration: Duration(milliseconds: 500),
                                                                                                      fadeOutDuration: Duration(milliseconds: 500),
                                                                                                      imageUrl: produtosItem.imagensProduto.first,
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                    allowRotation: false,
                                                                                                    tag: produtosItem.imagensProduto.first,
                                                                                                    useHeroAnimation: true,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            child: Hero(
                                                                                              tag: produtosItem.imagensProduto.first,
                                                                                              transitionOnUserGestures: true,
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                child: CachedNetworkImage(
                                                                                                  fadeInDuration: Duration(milliseconds: 500),
                                                                                                  fadeOutDuration: Duration(milliseconds: 500),
                                                                                                  imageUrl: produtosItem.imagensProduto.first,
                                                                                                  width: double.infinity,
                                                                                                  height: double.infinity,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final anuncios = widget.anuncios?.toList() ?? [];
                                                                              return GridView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                  crossAxisCount: 3,
                                                                                  crossAxisSpacing: 10.0,
                                                                                  mainAxisSpacing: 10.0,
                                                                                  childAspectRatio: 1.0,
                                                                                ),
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: anuncios.length,
                                                                                itemBuilder: (context, anunciosIndex) {
                                                                                  final anunciosItem = anuncios[anunciosIndex];
                                                                                  return ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      anunciosItem.fotoAnuncio,
                                                                                      width: 300.0,
                                                                                      height: 200.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 24.0)),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                );
              } else {
                return Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 48.0, 0.0, 0.0),
                                              child: Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      widget
                                                          .documentoAnunciante!
                                                          .logo,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.documentoAnunciante
                                              ?.nomeFantasia,
                                          'nome',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                size: 16.0,
                                              ),
                                              SelectionArea(
                                                  child: Text(
                                                valueOrDefault<String>(
                                                  formatNumber(
                                                    widget.documentoAnunciante
                                                        ?.notaMedia,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType: DecimalType
                                                        .commaDecimal,
                                                  ),
                                                  'nome',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              )),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              widget.documentoAnunciante
                                                  ?.categoria,
                                              'Categoria',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 24.0)),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'TEMPLETE_ANUNCIANTE_COMP_BTN_ON_TAP');
                                    if (widget.documentoAnunciante?.resgatado ==
                                        true) {
                                      await launchURL(
                                          'https://wa.me/55${valueOrDefault<String>(
                                        widget.documentoAnunciante
                                            ?.whatsComercial,
                                        'whatsapp',
                                      )}?text=Ol%C3%A1%2C+vim+atrav%C3%A9s+do+Me.encontra+app.+Meu+nome+${functions.formatarParaWhatsApp(currentUserDisplayName)}+tudo+bem%3F');
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                            color: widget.documentoAnunciante
                                                        ?.resgatado ==
                                                    true
                                                ? FlutterFlowTheme.of(context)
                                                    .btnWhats
                                                : FlutterFlowTheme.of(context)
                                                    .accent1,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    widget.documentoAnunciante
                                                        ?.whatsComercial,
                                                    'Whatsapp',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.mapPin,
                                        color: Color(0xFFA3A2A2),
                                        size: 16.0,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          widget.documentoAnunciante
                                              ?.enderecoCompleto,
                                          'Endereco',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        StreamBuilder<List<AnunciosRecord>>(
                          stream: queryAnunciosRecord(),
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
                            List<AnunciosRecord> containerAnunciosRecordList =
                                snapshot.data!;
                            return Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Anuncio',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final anuncianteResgatado =
                                                    containerAnunciosRecordList
                                                        .where((e) =>
                                                            e.parentReference ==
                                                            widget
                                                                .documentoAnunciante
                                                                ?.reference)
                                                        .toList()
                                                        .take(2)
                                                        .toList();
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        anuncianteResgatado
                                                            .length,
                                                        (anuncianteResgatadoIndex) {
                                                      final anuncianteResgatadoItem =
                                                          anuncianteResgatado[
                                                              anuncianteResgatadoIndex];
                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 0.5,
                                                        child: Container(
                                                          width: 164.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 0.5,
                                                                  ),
                                                                ),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'TEMPLETE_ANUNCIANTE_Image_acb5zhnb_ON_TA');
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              Image.network(
                                                                            anuncianteResgatadoItem.fotoAnuncio,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag: anuncianteResgatadoItem
                                                                              .fotoAnuncio,
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag: anuncianteResgatadoItem
                                                                        .fotoAnuncio,
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        anuncianteResgatadoItem
                                                                            .fotoAnuncio,
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }).divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  StreamBuilder<List<AnuncianteRecord>>(
                                    stream: queryAnuncianteRecord(),
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
                                      List<AnuncianteRecord>
                                          paiAnuncianteRecordList =
                                          snapshot.data!;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 40.0, 0.0, 50.0),
                                          child: Builder(
                                            builder: (context) {
                                              if (containerAnunciosRecordList
                                                      .where((e) =>
                                                          (e.categoria ==
                                                              widget
                                                                  .documentoAnunciante
                                                                  ?.categoria) &&
                                                          (e.anuncianteRef !=
                                                              widget
                                                                  .documentoAnunciante
                                                                  ?.reference))
                                                      .toList()
                                                      .length >=
                                                  1) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Descubra Alternativas na Categoria',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Builder(
                                                          builder: (context) {
                                                            final concorrentes = containerAnunciosRecordList
                                                                .where((e) =>
                                                                    (e.categoria ==
                                                                        widget
                                                                            .documentoAnunciante
                                                                            ?.categoria) &&
                                                                    (e.anuncianteRef !=
                                                                        widget
                                                                            .documentoAnunciante
                                                                            ?.reference))
                                                                .toList()
                                                                .take(6)
                                                                .toList();
                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    concorrentes
                                                                        .length,
                                                                    (concorrentesIndex) {
                                                                  final concorrentesItem =
                                                                      concorrentes[
                                                                          concorrentesIndex];
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'TEMPLETE_ANUNCIANTE_Container_6awgyt1w_O');

                                                                      context
                                                                          .pushNamed(
                                                                        'AnunciantePage',
                                                                        queryParameters:
                                                                            {
                                                                          'documentoRefAnunciante':
                                                                              serializeParam(
                                                                            paiAnuncianteRecordList.where((e) => e.reference == concorrentesItem.parentReference).toList().first,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'documentoRefAnunciante': paiAnuncianteRecordList
                                                                              .where((e) => e.reference == concorrentesItem.parentReference)
                                                                              .toList()
                                                                              .first,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      elevation:
                                                                          1.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            164.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(4.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Container(
                                                                                        width: 30.0,
                                                                                        height: 30.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          paiAnuncianteRecordList.where((e) => e.reference == concorrentesItem.parentReference).toList().first.logo,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        paiAnuncianteRecordList.where((e) => e.reference == concorrentesItem.parentReference).toList().first.nomeFantasia,
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: 'Inter',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.arrow_outward,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 4.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 164.0,
                                                                              height: 192.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  concorrentesItem.fotoAnuncio,
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
                                                                  );
                                                                }).divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Explore os Melhores Anunciantes',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Builder(
                                                          builder: (context) {
                                                            final concorrentes =
                                                                containerAnunciosRecordList
                                                                    .where((e) =>
                                                                        e.anuncianteRef !=
                                                                        widget
                                                                            .documentoAnunciante
                                                                            ?.reference)
                                                                    .toList()
                                                                    .take(6)
                                                                    .toList();
                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    concorrentes
                                                                        .length,
                                                                    (concorrentesIndex) {
                                                                  final concorrentesItem =
                                                                      concorrentes[
                                                                          concorrentesIndex];
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'TEMPLETE_ANUNCIANTE_Container_y1dkls46_O');

                                                                      context
                                                                          .pushNamed(
                                                                        'AnunciantePage',
                                                                        queryParameters:
                                                                            {
                                                                          'documentoRefAnunciante':
                                                                              serializeParam(
                                                                            paiAnuncianteRecordList.where((e) => e.reference == concorrentesItem.parentReference).toList().first,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'documentoRefAnunciante': paiAnuncianteRecordList
                                                                              .where((e) => e.reference == concorrentesItem.parentReference)
                                                                              .toList()
                                                                              .first,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      elevation:
                                                                          0.5,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            164.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(4.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 30.0,
                                                                                      height: 30.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        paiAnuncianteRecordList.where((e) => e.reference == concorrentesItem.parentReference).toList().first.logo,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        paiAnuncianteRecordList.where((e) => e.reference == concorrentesItem.parentReference).toList().first.nomeFantasia,
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: 'Inter',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.arrow_outward,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 4.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 164.0,
                                                                              height: 192.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  concorrentesItem.fotoAnuncio,
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
                                                                  );
                                                                }).divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(height: 24.0)),
                              ),
                            );
                          },
                        ),
                      ].divide(SizedBox(height: 24.0)),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
