import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appbar_meensina_model.dart';
export 'appbar_meensina_model.dart';

class AppbarMeensinaWidget extends StatefulWidget {
  const AppbarMeensinaWidget({super.key});

  @override
  State<AppbarMeensinaWidget> createState() => _AppbarMeensinaWidgetState();
}

class _AppbarMeensinaWidgetState extends State<AppbarMeensinaWidget> {
  late AppbarMeensinaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbarMeensinaModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 1.0,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).gradient2
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(1.0, 0.0),
            end: AlignmentDirectional(-1.0, 0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 0.0,
                buttonSize: 40.0,
                icon: Icon(
                  FFIcons.karrowBack,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
              Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FFIcons.kmalaWork,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    Text(
                      'me contrata',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context)
                          .headlineLarge
                          .override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
              Container(
                width: 20.0,
                height: 50.0,
                decoration: BoxDecoration(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
