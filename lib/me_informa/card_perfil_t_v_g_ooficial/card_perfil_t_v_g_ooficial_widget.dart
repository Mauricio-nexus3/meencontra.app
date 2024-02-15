import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_perfil_t_v_g_ooficial_model.dart';
export 'card_perfil_t_v_g_ooficial_model.dart';

class CardPerfilTVGOoficialWidget extends StatefulWidget {
  const CardPerfilTVGOoficialWidget({
    super.key,
    this.numeroMaterias,
    this.materiaRef,
  });

  final int? numeroMaterias;
  final List<MateriasRecord>? materiaRef;

  @override
  State<CardPerfilTVGOoficialWidget> createState() =>
      _CardPerfilTVGOoficialWidgetState();
}

class _CardPerfilTVGOoficialWidgetState
    extends State<CardPerfilTVGOoficialWidget> {
  late CardPerfilTVGOoficialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardPerfilTVGOoficialModel());

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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Matérias',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).accent2,
                      fontSize: 12.0,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.numeroMaterias?.toString(),
                  '0',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).accent2,
                      fontSize: 12.0,
                    ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
          Container(
            height: 500.0,
            decoration: BoxDecoration(),
            child: Builder(
              builder: (context) {
                final materia = widget.materiaRef?.toList() ?? [];
                return ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  primary: false,
                  scrollDirection: Axis.vertical,
                  itemCount: materia.length,
                  separatorBuilder: (_, __) => SizedBox(height: 8.0),
                  itemBuilder: (context, materiaIndex) {
                    final materiaItem = materia[materiaIndex];
                    return Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  materiaItem.imagemCapa,
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    materiaItem.tituloMateria
                                        .maybeHandleOverflow(
                                      maxChars: 70,
                                      replacement: '…',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                  Text(
                                    dateTimeFormat(
                                      'd/M/y',
                                      materiaItem.dataPublicacaoMateria!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              FFIcons.karrowRIght,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 16.0,
                            ),
                            onPressed: () async {
                              context.pushNamed(
                                'meinformaDetalhesNoticia',
                                queryParameters: {
                                  'materiaRef': serializeParam(
                                    materiaItem.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}
