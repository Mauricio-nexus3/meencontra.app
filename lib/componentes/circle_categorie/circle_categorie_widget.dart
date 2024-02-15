import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'circle_categorie_model.dart';
export 'circle_categorie_model.dart';

class CircleCategorieWidget extends StatefulWidget {
  const CircleCategorieWidget({
    super.key,
    required this.img,
    required this.name,
    required this.anuncianteRef,
  });

  final String? img;
  final String? name;
  final Future Function()? anuncianteRef;

  @override
  State<CircleCategorieWidget> createState() => _CircleCategorieWidgetState();
}

class _CircleCategorieWidgetState extends State<CircleCategorieWidget> {
  late CircleCategorieModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CircleCategorieModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.anuncianteRef?.call();
      },
      child: Container(
        width: 100.0,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 1.0,
              shape: const CircleBorder(),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: 70.0,
                  height: 70.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.img,
                      'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        widget.name!,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ].divide(SizedBox(height: 4.0)),
        ),
      ),
    );
  }
}
