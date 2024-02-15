import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pagamento_interno_model.dart';
export 'pagamento_interno_model.dart';

class PagamentoInternoWidget extends StatefulWidget {
  const PagamentoInternoWidget({
    super.key,
    required this.anuncianteREF,
  });

  final DocumentReference? anuncianteREF;

  @override
  State<PagamentoInternoWidget> createState() => _PagamentoInternoWidgetState();
}

class _PagamentoInternoWidgetState extends State<PagamentoInternoWidget> {
  late PagamentoInternoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagamentoInternoModel());

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

    return StreamBuilder<AnuncianteRecord>(
      stream: AnuncianteRecord.getDocument(widget.anuncianteREF!),
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
        final pagamentoInternoAnuncianteRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Resgate o seu plano',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 20.0,
                                    ),
                              ),
                              Text(
                                'Do tamanho do seu negócio',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: FlutterFlowChoiceChips(
                            options: [
                              ChipData('Seguir grátis'),
                              ChipData('me destaque')
                            ],
                            onChanged: (val) => setState(() =>
                                _model.choiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              iconColor: Color(0x00000000),
                              iconSize: 18.0,
                              labelPadding: EdgeInsets.all(8.0),
                              elevation: 4.0,
                              borderColor: FlutterFlowTheme.of(context).accent4,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).primary,
                              iconSize: 0.0,
                              labelPadding: EdgeInsets.all(8.0),
                              elevation: 0.0,
                              borderColor: FlutterFlowTheme.of(context).accent4,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            chipSpacing: 16.0,
                            rowSpacing: 12.0,
                            multiselect: false,
                            initialized: _model.choiceChipsValue != null,
                            alignment: WrapAlignment.center,
                            controller: _model.choiceChipsValueController ??=
                                FormFieldController<List<String>>(
                              ['me destaque'],
                            ),
                            wrapped: true,
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).accent4,
                        ),
                        if (_model.choiceChipsValue == 'me destaque')
                          Text(
                            'R\$ 1,49 ao dia',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .grdContrata290deg,
                                  fontSize: 20.0,
                                ),
                          ),
                        Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 1020.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).accent4,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          _model.choiceChipsValue ==
                                                  'me destaque'
                                              ? 'me destaque'
                                              : 'gratis',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Text(
                                    _model.choiceChipsValue == 'me destaque'
                                        ? 'Ideal para negócios consolidados e serão a referências na plataforma, destaque na página inicial e suporte prioritário. Além de acesso antecipado a recursos exclusivos e ilimitados'
                                        : 'Ideal para quem está começando ou pequenos negócios que desejam uma presença digital mais ativa.',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 14.0,
                                            ),
                                            Text(
                                              'Logo ${_model.choiceChipsValue == 'me destaque' ? 'destacado' : 'simples'}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 14.0,
                                            ),
                                            Text(
                                              'Nome do negócio',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 14.0,
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                _model.choiceChipsValue ==
                                                        'me destaque'
                                                    ? '2 categorias de serviços'
                                                    : '1 categoria de serviço',
                                                'Categoria',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 14.0,
                                            ),
                                            Text(
                                              'Número de telefone',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 14.0,
                                            ),
                                            Text(
                                              'Endereço',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 14.0,
                                            ),
                                            Text(
                                              'Comentarios e avaliações',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (_model.choiceChipsValue ==
                                                    'seguir gratis')
                                                  Icon(
                                                    Icons.cancel_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 14.0,
                                                  ),
                                                if (_model.choiceChipsValue ==
                                                    'me destaque')
                                                  Icon(
                                                    Icons.check_circle_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 14.0,
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Botão whatsapp instantâneo',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'seguir gratis')
                                                      Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 14.0,
                                                      ),
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'me destaque')
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 14.0,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Botão de ligação instantâneo',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'seguir gratis')
                                                      Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 14.0,
                                                      ),
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'me destaque')
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 14.0,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Localização via google maps',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'seguir gratis')
                                                      Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 14.0,
                                                      ),
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'me destaque')
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 14.0,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Distância em tempo real do usuário',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'seguir gratis')
                                                      Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 14.0,
                                                      ),
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'me destaque')
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 14.0,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Descrição do negócio',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'seguir gratis')
                                                      Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 14.0,
                                                      ),
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'me destaque')
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 14.0,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Link para site em destaque',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'seguir gratis')
                                                      Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 14.0,
                                                      ),
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'me destaque')
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 14.0,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Rede sociais em destaque',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'seguir gratis')
                                                      Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 14.0,
                                                      ),
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'me destaque')
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 14.0,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Selo de verificado',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'seguir gratis')
                                                      Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 14.0,
                                                      ),
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'me destaque')
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 14.0,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Catálogo com até 30 itens.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'seguir gratis')
                                                      Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 14.0,
                                                      ),
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'me destaque')
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 14.0,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '1 anúncio em destaque na categoria',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'seguir gratis')
                                                      Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 14.0,
                                                      ),
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'me destaque')
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 14.0,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Sem anúncio concorrente na página',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'seguir gratis')
                                                      Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 14.0,
                                                      ),
                                                    if (_model
                                                            .choiceChipsValue ==
                                                        'me destaque')
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 14.0,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Compartilhar perfil',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      // essa ação é temporaria
                                      if (_model.choiceChipsValue ==
                                          'me destaqueTemporario') {
                                        _model.codigopix =
                                            await MercadoPagoGroup.pixCall.call(
                                          amount: 537.0,
                                          productTitle: 'medestaca',
                                          email: currentUserEmail,
                                          firstName: currentUserDisplayName,
                                          lastName:
                                              pagamentoInternoAnuncianteRecord
                                                  .nomeFantasia,
                                        );
                                        if ((_model.codigopix?.succeeded ??
                                            true)) {
                                          if (pagamentoInternoAnuncianteRecord
                                                  .statusCadastro ==
                                              'Bloqueio') {
                                            _model.refAnunciantePlanoModeloPremium =
                                                await queryPlanosModelo01RecordOnce(
                                              queryBuilder:
                                                  (planosModelo01Record) =>
                                                      planosModelo01Record
                                                          .where(
                                                'refAnunciante',
                                                isEqualTo: widget.anuncianteREF,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);

                                            await _model
                                                .refAnunciantePlanoModeloPremium!
                                                .reference
                                                .update(
                                                    createPlanosModelo01RecordData(
                                              essencial: false,
                                              premium: true,
                                            ));
                                            setState(() {
                                              FFAppState().VarDataPagamento =
                                                  getCurrentTimestamp;
                                            });

                                            await widget.anuncianteREF!.update({
                                              ...createAnuncianteRecordData(
                                                planoModelo01: 'Premium',
                                                statusCadastro: 'Ativo',
                                                planoExpira:
                                                    dateTimeFromSecondsSinceEpoch(
                                                        FFAppState()
                                                                .VarDataPagamento!
                                                                .secondsSinceEpoch +
                                                            31536000),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'DataPagamento': FieldValue
                                                      .serverTimestamp(),
                                                },
                                              ),
                                            });

                                            context.pushNamed(
                                              'sucesso',
                                              queryParameters: {
                                                'anuncianteREF': serializeParam(
                                                  widget.anuncianteREF,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            // Remover esse plano modelo

                                            await PlanosModelo01Record
                                                .collection
                                                .doc()
                                                .set(
                                                    createPlanosModelo01RecordData(
                                                  nomeAnunciante:
                                                      pagamentoInternoAnuncianteRecord
                                                          .nomeFantasia,
                                                  refAnunciante:
                                                      widget.anuncianteREF,
                                                  premium: true,
                                                ));

                                            await widget.anuncianteREF!.update({
                                              ...createAnuncianteRecordData(
                                                planoModelo01: 'Premium',
                                                statusCadastro: 'Ativo',
                                                notaMedia: 3.5,
                                                planoExpira:
                                                    dateTimeFromSecondsSinceEpoch(
                                                        FFAppState()
                                                                .VarDataPagamento!
                                                                .secondsSinceEpoch +
                                                            31536000),
                                                aid: valueOrDefault(
                                                    currentUserDocument?.iDUser,
                                                    ''),
                                                resgatado: true,
                                                planoAssinatura: 'medestaca',
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'DataPagamento': FieldValue
                                                      .serverTimestamp(),
                                                },
                                              ),
                                            });

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              perfil: 'Anunciante',
                                              isAnunciante: true,
                                            ));

                                            context.pushNamed(
                                              'sucesso',
                                              queryParameters: {
                                                'anuncianteREF': serializeParam(
                                                  widget.anuncianteREF,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Falha'),
                                                  content: Text(
                                                      MercadoPagoGroup.pixCall
                                                          .msgErro(
                                                            (_model.codigopix
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString()),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      } else if (_model.choiceChipsValue ==
                                          'me destaque') {
                                        await launchURL(
                                            'https://api.whatsapp.com/send?phone=5551999900379?text=Ol%C3%A1%2C+vim+atrav%C3%A9s+do+Me.encontra+app.+Meu+nome+${currentUserDisplayName}');
                                      } else {
                                        await PlanosModelo01Record.collection
                                            .doc()
                                            .set(createPlanosModelo01RecordData(
                                              nomeAnunciante:
                                                  pagamentoInternoAnuncianteRecord
                                                      .nomeFantasia,
                                              essencial: true,
                                              refAnunciante:
                                                  widget.anuncianteREF,
                                            ));

                                        await widget.anuncianteREF!.update({
                                          ...createAnuncianteRecordData(
                                            planoModelo01: 'gratis',
                                            statusCadastro: 'Ativo',
                                            notaMedia: 3.5,
                                            planoExpira:
                                                dateTimeFromSecondsSinceEpoch(
                                                    FFAppState()
                                                            .VarDataPagamento!
                                                            .secondsSinceEpoch +
                                                        31536000),
                                            aid: valueOrDefault(
                                                currentUserDocument?.iDUser,
                                                ''),
                                            resgatado: true,
                                            nomeUsuarioAdm:
                                                currentUserDisplayName,
                                            emailUsuarioAdm: currentUserEmail,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'DataPagamento':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          perfil: 'Anunciante',
                                          isAnunciante: true,
                                        ));

                                        context.pushNamed(
                                          'sucesso',
                                          queryParameters: {
                                            'anuncianteREF': serializeParam(
                                              widget.anuncianteREF,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }

                                      setState(() {});
                                    },
                                    text:
                                        'Resgatar plano ${_model.choiceChipsValue == 'me destaque' ? 'me destaque' : 'gratis'}',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 45.0,
                                      padding: EdgeInsets.all(0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
