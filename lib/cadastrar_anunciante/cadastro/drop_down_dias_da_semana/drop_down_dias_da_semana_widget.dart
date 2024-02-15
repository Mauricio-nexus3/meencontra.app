import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drop_down_dias_da_semana_model.dart';
export 'drop_down_dias_da_semana_model.dart';

class DropDownDiasDaSemanaWidget extends StatefulWidget {
  const DropDownDiasDaSemanaWidget({super.key});

  @override
  State<DropDownDiasDaSemanaWidget> createState() =>
      _DropDownDiasDaSemanaWidgetState();
}

class _DropDownDiasDaSemanaWidgetState
    extends State<DropDownDiasDaSemanaWidget> {
  late DropDownDiasDaSemanaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropDownDiasDaSemanaModel());

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

    return FlutterFlowDropDown<String>(
      controller: _model.dropDownDiaSemanaValueController ??=
          FormFieldController<String>(null),
      options: [
        'Segunda-feira',
        'Terça-feira',
        'Quarta-feira',
        'Quinta-feira',
        'Sexta-feira',
        'Sábado',
        'Domingo'
      ],
      onChanged: (val) => setState(() => _model.dropDownDiaSemanaValue = val),
      width: 300.0,
      height: 50.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium,
      hintText: 'Dia da Semana',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: FlutterFlowTheme.of(context).primary,
      borderWidth: 2.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
      hidesUnderline: true,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
