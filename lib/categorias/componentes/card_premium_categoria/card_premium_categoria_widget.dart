import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_premium_categoria_model.dart';
export 'card_premium_categoria_model.dart';

class CardPremiumCategoriaWidget extends StatefulWidget {
  const CardPremiumCategoriaWidget({
    super.key,
    required this.fotoDestaquePremium,
    required this.discricao,
    required this.tituloPaginaCategoria,
    required this.auncianteREF,
    required this.nomeFantasia,
    required this.nextPage,
  });

  final String? fotoDestaquePremium;
  final String? discricao;
  final String? tituloPaginaCategoria;
  final DocumentReference? auncianteREF;
  final String? nomeFantasia;
  final Future Function()? nextPage;

  @override
  State<CardPremiumCategoriaWidget> createState() =>
      _CardPremiumCategoriaWidgetState();
}

class _CardPremiumCategoriaWidgetState
    extends State<CardPremiumCategoriaWidget> {
  late CardPremiumCategoriaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardPremiumCategoriaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('CARD_PREMIUM_CATEGORIA_Container_su4qmbm');
        _model.anunciante = await queryAnuncianteRecordOnce(
          queryBuilder: (anuncianteRecord) => anuncianteRecord.where(
            'aid',
            isEqualTo: widget!.auncianteREF?.id,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);

        context.pushNamed(
          'AnunciantePage',
          queryParameters: {
            'documentoRefAnunciante': serializeParam(
              _model.anunciante,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'documentoRefAnunciante': _model.anunciante,
          },
        );

        safeSetState(() {});
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 500),
                fadeOutDuration: Duration(milliseconds: 500),
                imageUrl: valueOrDefault<String>(
                  widget!.fotoDestaquePremium,
                  'https://picsum.photos/seed/619/600',
                ),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x00622AE2), Color(0x1E000000)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 24.0),
                            child: Container(
                              width: 300.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.nomeFantasia,
                                      'nome',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
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
            ),
          ],
        ),
      ),
    );
  }
}
