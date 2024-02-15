import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_criar_conta_componente_widget.dart'
    show LoginCriarContaComponenteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LoginCriarContaComponenteModel
    extends FlutterFlowModel<LoginCriarContaComponenteWidget> {
  ///  Local state fields for this component.

  int? passo = 0;

  String tela = 'true';

  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for Email_CriarConta widget.
  FocusNode? emailCriarContaFocusNode;
  TextEditingController? emailCriarContaController;
  String? Function(BuildContext, String?)? emailCriarContaControllerValidator;
  String? _emailCriarContaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'formato de e-mail invalido';
    }
    return null;
  }

  // State field(s) for passwordCriarConta widget.
  FocusNode? passwordCriarContaFocusNode;
  TextEditingController? passwordCriarContaController;
  late bool passwordCriarContaVisibility;
  String? Function(BuildContext, String?)?
      passwordCriarContaControllerValidator;
  String? _passwordCriarContaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return ' ';
    }

    if (val.length < 6) {
      return 'Mínimo 6 caracteres';
    }

    return null;
  }

  // State field(s) for passwordConfirmCriarConta widget.
  FocusNode? passwordConfirmCriarContaFocusNode;
  TextEditingController? passwordConfirmCriarContaController;
  late bool passwordConfirmCriarContaVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmCriarContaControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Formato de endereço invalido';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Avancar widget.
  UsersRecord? autenticaoUser;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailCriarContaControllerValidator = _emailCriarContaControllerValidator;
    passwordCriarContaVisibility = false;
    passwordCriarContaControllerValidator =
        _passwordCriarContaControllerValidator;
    passwordConfirmCriarContaVisibility = false;
    emailAddressControllerValidator = _emailAddressControllerValidator;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailCriarContaFocusNode?.dispose();
    emailCriarContaController?.dispose();

    passwordCriarContaFocusNode?.dispose();
    passwordCriarContaController?.dispose();

    passwordConfirmCriarContaFocusNode?.dispose();
    passwordConfirmCriarContaController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
