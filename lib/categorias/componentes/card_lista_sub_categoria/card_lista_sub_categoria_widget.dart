import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_lista_sub_categoria_model.dart';
export 'card_lista_sub_categoria_model.dart';

class CardListaSubCategoriaWidget extends StatefulWidget {
  const CardListaSubCategoriaWidget({
    super.key,
    this.logo,
    this.nome,
    this.parameter3,
    this.endereco,
    this.planoAnuncio,
    this.nota,
    this.km,
  });

  final String? logo;
  final String? nome;
  final DocumentReference? parameter3;
  final String? endereco;
  final String? planoAnuncio;
  final double? nota;
  final LatLng? km;

  @override
  State<CardListaSubCategoriaWidget> createState() =>
      _CardListaSubCategoriaWidgetState();
}

class _CardListaSubCategoriaWidgetState
    extends State<CardListaSubCategoriaWidget> {
  late CardListaSubCategoriaModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardListaSubCategoriaModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x411D2429),
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).accent4,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.8,
                shape: const CircleBorder(),
                child: Container(
                  width: 64.0,
                  height: 64.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.planoAnuncio != 'gratis'
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).accent4,
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 1.0, 1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200.0),
                      child: Image.network(
                        widget.logo!,
                        width: 64.0,
                        height: 64.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                widget.nome!.maybeHandleOverflow(maxChars: 25),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              if (widget.planoAnuncio != 'gratis')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: Color(0xFF0095F6),
                                      size: 16.0,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 14.0,
                                        height: 14.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .btnWhats,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.whatsapp,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 9.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 20.0,
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.nota.toString() == '0.0'
                                        ? 'Não avaliado'
                                        : widget.nota.toString(),
                                    '0',
                                  ),
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 4.0, 0.0),
                            child: Icon(
                              FFIcons.kpikerMap,
                              color: widget.planoAnuncio != 'gratis'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).accent2,
                              size: 14.0,
                            ),
                          ),
                          AutoSizeText(
                            widget.endereco!.maybeHandleOverflow(
                              maxChars: 24,
                              replacement: '…',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ],
                      ),
                      if (widget.planoAnuncio != 'gratis')
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.mapPin,
                              color: widget.planoAnuncio != 'gratis'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).accent2,
                              size: 14.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 0.0),
                              child: Text(
                                '${formatNumber(
                                  functions.distanceBetweenTwoPoints(
                                      widget.km, currentUserLocationValue),
                                  formatType: FormatType.custom,
                                  format: '0.0',
                                  locale: '',
                                )}Km',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
    );
  }
}
