import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selos_anunciante_model.dart';
export 'selos_anunciante_model.dart';

class SelosAnuncianteWidget extends StatefulWidget {
  const SelosAnuncianteWidget({
    super.key,
    required this.planoAnunciante,
    String? tamanhoPequenoNormalGrande,
    required this.resgatado,
  }) : this.tamanhoPequenoNormalGrande = tamanhoPequenoNormalGrande ?? 'Normal';

  final String? planoAnunciante;
  final String tamanhoPequenoNormalGrande;
  final bool? resgatado;

  @override
  State<SelosAnuncianteWidget> createState() => _SelosAnuncianteWidgetState();
}

class _SelosAnuncianteWidgetState extends State<SelosAnuncianteWidget> {
  late SelosAnuncianteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelosAnuncianteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget!.planoAnunciante != 'gratis')
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: () {
                  if (widget!.tamanhoPequenoNormalGrande == 'Pequeno') {
                    return 16.0;
                  } else if (widget!.tamanhoPequenoNormalGrande == 'Grande') {
                    return 48.0;
                  } else {
                    return 24.0;
                  }
                }(),
                height: () {
                  if (widget!.tamanhoPequenoNormalGrande == 'Pequeno') {
                    return 16.0;
                  } else if (widget!.tamanhoPequenoNormalGrande == 'Grande') {
                    return 48.0;
                  } else {
                    return 24.0;
                  }
                }(),
                decoration: BoxDecoration(
                  color: Color(0xFF25D366),
                  shape: BoxShape.circle,
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: () {
                    if (widget!.tamanhoPequenoNormalGrande == 'Pequeno') {
                      return 12.0;
                    } else if (widget!.tamanhoPequenoNormalGrande == 'Grande') {
                      return 24.0;
                    } else {
                      return 16.0;
                    }
                  }(),
                ),
              ),
            ),
          if ((widget!.planoAnunciante == 'meimpulsionaPlus') ||
              (widget!.planoAnunciante == 'meimpulsiona') ||
              (widget!.planoAnunciante == 'medestacaCapa') ||
              (widget!.planoAnunciante == 'medestaca'))
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.verified_rounded,
                color: Color(0xFF0095F6),
                size: () {
                  if (widget!.tamanhoPequenoNormalGrande == 'Pequeno') {
                    return 16.0;
                  } else if (widget!.tamanhoPequenoNormalGrande == 'Grande') {
                    return 48.0;
                  } else {
                    return 24.0;
                  }
                }(),
              ),
            ),
        ].divide(SizedBox(width: 4.0)),
      ),
    );
  }
}
