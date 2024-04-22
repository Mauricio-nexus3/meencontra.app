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
  TextEditingController? emailCriarContaTextController;
  String? Function(BuildContext, String?)?
      emailCriarContaTextControllerValidator;
  String? _emailCriarContaTextControllerValidator(
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
  TextEditingController? passwordCriarContaTextController;
  late bool passwordCriarContaVisibility;
  String? Function(BuildContext, String?)?
      passwordCriarContaTextControllerValidator;
  String? _passwordCriarContaTextControllerValidator(
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
  TextEditingController? passwordConfirmCriarContaTextController;
  late bool passwordConfirmCriarContaVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmCriarContaTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
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
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Avancar widget.
  UsersRecord? autenticaoUser;

  @override
  void initState(BuildContext context) {
    emailCriarContaTextControllerValidator =
        _emailCriarContaTextControllerValidator;
    passwordCriarContaVisibility = false;
    passwordCriarContaTextControllerValidator =
        _passwordCriarContaTextControllerValidator;
    passwordConfirmCriarContaVisibility = false;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailCriarContaFocusNode?.dispose();
    emailCriarContaTextController?.dispose();

    passwordCriarContaFocusNode?.dispose();
    passwordCriarContaTextController?.dispose();

    passwordConfirmCriarContaFocusNode?.dispose();
    passwordConfirmCriarContaTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
