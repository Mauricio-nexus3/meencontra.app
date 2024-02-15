import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'categorias_model.dart';
export 'categorias_model.dart';

class CategoriasWidget extends StatefulWidget {
  const CategoriasWidget({super.key});

  @override
  State<CategoriasWidget> createState() => _CategoriasWidgetState();
}

class _CategoriasWidgetState extends State<CategoriasWidget> {
  late CategoriasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriasModel());

    _model.allAppController ??= TextEditingController();

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 1020.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (loggedIn == true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Autocomplete<String>(
                                  initialValue: TextEditingValue(),
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    return ['Option 1'].where((option) {
                                      final lowercaseOption =
                                          option.toLowerCase();
                                      return lowercaseOption.contains(
                                          textEditingValue.text.toLowerCase());
                                    });
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return AutocompleteOptionsList(
                                      textFieldKey: _model.allAppKey,
                                      textController: _model.allAppController!,
                                      options: options.toList(),
                                      onSelected: onSelected,
                                      textStyle: TextStyle(),
                                      textHighlightStyle: TextStyle(),
                                      elevation: 4.0,
                                      optionBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      optionHighlightColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      maxHeight: 200.0,
                                    );
                                  },
                                  onSelected: (String selection) {
                                    setState(() => _model.allAppSelectedOption =
                                        selection);
                                    FocusScope.of(context).unfocus();
                                  },
                                  fieldViewBuilder: (
                                    context,
                                    textEditingController,
                                    focusNode,
                                    onEditingComplete,
                                  ) {
                                    _model.allAppFocusNode = focusNode;

                                    _model.allAppController =
                                        textEditingController;
                                    return TextFormField(
                                      key: _model.allAppKey,
                                      controller: textEditingController,
                                      focusNode: focusNode,
                                      onEditingComplete: onEditingComplete,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.allAppController',
                                        Duration(milliseconds: 300),
                                        () async {
                                          safeSetState(() => _model
                                              .algoliaSearchResults = null);
                                          await AnuncianteRecord.search(
                                            term: _model.allAppController.text,
                                            maxResults: 10,
                                          )
                                              .then((r) => _model
                                                  .algoliaSearchResults = r)
                                              .onError((_, __) => _model
                                                  .algoliaSearchResults = [])
                                              .whenComplete(
                                                  () => setState(() {}));
                                        },
                                      ),
                                      textInputAction: TextInputAction.search,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Pesquise no meencontra',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                24.0, 24.0, 20.0, 24.0),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: (_model.allAppFocusNode
                                                          ?.hasFocus ??
                                                      false) ==
                                                  true
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .accent2,
                                          size: 20.0,
                                        ),
                                        suffixIcon: _model.allAppController!
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.allAppController
                                                      ?.clear();
                                                  safeSetState(() => _model
                                                          .algoliaSearchResults =
                                                      null);
                                                  await AnuncianteRecord.search(
                                                    term: _model
                                                        .allAppController.text,
                                                    maxResults: 10,
                                                  )
                                                      .then((r) => _model
                                                              .algoliaSearchResults =
                                                          r)
                                                      .onError((_, __) => _model
                                                              .algoliaSearchResults =
                                                          [])
                                                      .whenComplete(() =>
                                                          setState(() {}));

                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: (_model.allAppFocusNode
                                                                  ?.hasFocus ??
                                                              false) ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                                  size: 22.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model
                                          .allAppControllerValidator
                                          .asValidator(context),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (loggedIn == false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
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
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
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
                                              child:
                                                  UsarDeslogadoUsoExclusivoCompWidget(
                                                usoExclusivo: true,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 4.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderRadius: 20.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.search,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent2,
                                                  size: 22.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                              Text(
                                                'Pesquise no meencontra',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.close_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                              size: 22.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Builder(
                        builder: (context) {
                          if (_model.allAppController.text != null &&
                              _model.allAppController.text != '') {
                            return Container(
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (_model.algoliaSearchResults == null) {
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
                                  final resultadoAlgolia =
                                      (_model.algoliaSearchResults?.toList() ??
                                              [])
                                          .take(8)
                                          .toList();
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: resultadoAlgolia.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 8.0),
                                    itemBuilder:
                                        (context, resultadoAlgoliaIndex) {
                                      final resultadoAlgoliaItem =
                                          resultadoAlgolia[
                                              resultadoAlgoliaIndex];
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'Anunciante',
                                                queryParameters: {
                                                  'refAnunciante':
                                                      serializeParam(
                                                    resultadoAlgoliaItem
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 34.0,
                                                    height: 34.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        resultadoAlgoliaItem
                                                            .logo,
                                                        'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Text(
                                                                resultadoAlgoliaItem
                                                                    .nomeFantasia
                                                                    .maybeHandleOverflow(
                                                                        maxChars:
                                                                            22),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge,
                                                              ),
                                                            ),
                                                            if (resultadoAlgoliaItem
                                                                    .planoAssinatura !=
                                                                'gratis')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          16.0,
                                                                      height:
                                                                          16.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFF25D366),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .whatsapp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            12.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .verified_rounded,
                                                                    color: Color(
                                                                        0xFF0095F6),
                                                                    size: 16.0,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        0.0)),
                                                              ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              FFIcons.kpikerMap,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1,
                                                              size: 16.0,
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                resultadoAlgoliaItem
                                                                    .enderecoCompleto,
                                                                'Rua:',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 24,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              '${resultadoAlgoliaItem.categoria}, ${resultadoAlgoliaItem.nomeSubCategoria01}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 2.0)),
                                                    ),
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    FFIcons.karrowRIght,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      'Anunciante',
                                                      queryParameters: {
                                                        'refAnunciante':
                                                            serializeParam(
                                                          resultadoAlgoliaItem
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                ),
                                              ].divide(SizedBox(width: 12.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 24.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Categorias',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 600.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: FutureBuilder<List<CategoriasRecord>>(
                                    future: _model.categorias(
                                      requestFn: () =>
                                          queryCategoriasRecordOnce(
                                        queryBuilder: (categoriasRecord) =>
                                            categoriasRecord
                                                .orderBy('NomeDaCategoria'),
                                      ),
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
                                      List<CategoriasRecord>
                                          gridViewCategoriasRecordList =
                                          snapshot.data!;
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <=
                                                479.0) {
                                              return 2;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <=
                                                720.0) {
                                              return 3;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <=
                                                1024.0) {
                                              return 4;
                                            } else {
                                              return 6;
                                            }
                                          }(),
                                          crossAxisSpacing: 8.0,
                                          mainAxisSpacing: 8.0,
                                          childAspectRatio: 1.6,
                                        ),
                                        primary: false,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            gridViewCategoriasRecordList.length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewCategoriasRecord =
                                              gridViewCategoriasRecordList[
                                                  gridViewIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'SubCtegoria',
                                                queryParameters: {
                                                  'subCategoria':
                                                      serializeParam(
                                                    gridViewCategoriasRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 155.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 230.0;
                                                } else {
                                                  return 160.0;
                                                }
                                              }(),
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    gridViewCategoriasRecord
                                                        .imgBackgroundCategoria,
                                                  ),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x3600000F),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0x4C1C1C1E),
                                                          Color(0x191C1C1E)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                gridViewCategoriasRecord
                                                                    .nomeDaCategoria,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
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
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
