import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nenhum_negocio_encontrado_model.dart';
export 'nenhum_negocio_encontrado_model.dart';

class NenhumNegocioEncontradoWidget extends StatefulWidget {
  const NenhumNegocioEncontradoWidget({super.key});

  @override
  State<NenhumNegocioEncontradoWidget> createState() =>
      _NenhumNegocioEncontradoWidgetState();
}

class _NenhumNegocioEncontradoWidgetState
    extends State<NenhumNegocioEncontradoWidget> {
  late NenhumNegocioEncontradoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NenhumNegocioEncontradoModel());

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
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 800.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/images/Frame_207.svg',
                  width: 250.0,
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Text(
              'Desculpe, ainda não temos nenhum anunciante nesta categoria. ',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Text(
              'Estamos trabalhando para trazer novas empresas e serviços para oferecer mais opções para você.\nEnquanto isso, explore outras categorias.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              context.pushNamed('Categorias');
            },
            text: 'Explorar',
            options: FFButtonOptions(
              width: 300.0,
              height: 40.0,
              padding: EdgeInsets.all(0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Inter',
                    color: Colors.white,
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ].divide(SizedBox(height: 24.0)).around(SizedBox(height: 24.0)),
      ),
    );
  }
}
