import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/acao_tabale_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'card_tabela_usuario_model.dart';
export 'card_tabela_usuario_model.dart';

class CardTabelaUsuarioWidget extends StatefulWidget {
  const CardTabelaUsuarioWidget({
    super.key,
    required this.userRef,
  });

  final UsersRecord? userRef;

  @override
  State<CardTabelaUsuarioWidget> createState() =>
      _CardTabelaUsuarioWidgetState();
}

class _CardTabelaUsuarioWidgetState extends State<CardTabelaUsuarioWidget> {
  late CardTabelaUsuarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardTabelaUsuarioModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: Color(0xFFF1F4F8),
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                widget.userRef?.photoUrl,
                                'foto',
                              ),
                              width: 32.0,
                              height: 32.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.userRef?.displayName,
                                  'nome',
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.userRef?.email,
                                    'email',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Expanded(
                  flex: 1,
                  child: Text(
                    valueOrDefault<String>(
                      widget.userRef?.whatsapp,
                      'whatsapp',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF14181B),
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Expanded(
                  flex: 2,
                  child: Text(
                    valueOrDefault<String>(
                      dateTimeFormat(
                        'd/M/y',
                        widget.userRef?.createdTime,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      'cadastrado',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF14181B),
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Container(
                        height: 32.0,
                        decoration: BoxDecoration(
                          color: widget.userRef?.isAnunciante == true
                              ? FlutterFlowTheme.of(context).secondary
                              : Color(0xFFF1F4F8),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Text(
                            widget.userRef?.isAnunciante == true
                                ? 'Sim'
                                : 'Não',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: widget.userRef?.isAnunciante == true
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryText
                                      : FlutterFlowTheme.of(context).accent2,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Builder(
                      builder: (context) => FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 44.0,
                        icon: Icon(
                          Icons.more_vert,
                          color: Color(0xFF57636C),
                          size: 20.0,
                        ),
                        onPressed: () async {
                          if (MediaQuery.sizeOf(context).width > 991.0) {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: AcaoTabaleWidget(
                                      compartiharURL: () async {},
                                      visualizar: () async {
                                        context.pushNamed(
                                          'EditarPerfilUsuario',
                                          queryParameters: {
                                            'usuarioREF': serializeParam(
                                              widget.userRef,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'usuarioREF': widget.userRef,
                                          },
                                        );
                                      },
                                      editar: () async {
                                        context.pushNamed(
                                          'EditarPerfilUsuario',
                                          queryParameters: {
                                            'usuarioREF': serializeParam(
                                              widget.userRef,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'usuarioREF': widget.userRef,
                                          },
                                        );
                                      },
                                      excluir: () async {
                                        Function() _navigate = () {};
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text(
                                                            'Excluir Usuario?'),
                                                        content: Text(
                                                            'Você tem certeza que você quer excluir esse usuario? Com isso todas as informações seram totalmente perdidas'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text(
                                                                'Cancelar'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text(
                                                                'Sim, excluir'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          await FirebaseStorage.instance
                                              .refFromURL(
                                                  widget.userRef!.reference.id)
                                              .delete();
                                          await widget.userRef!.reference
                                              .delete();
                                        } else {
                                          return;
                                        }
                                      },
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: AcaoTabaleWidget(
                                      compartiharURL: () async {},
                                      visualizar: () async {
                                        context.pushNamed(
                                          'EditarPerfilUsuario',
                                          queryParameters: {
                                            'usuarioREF': serializeParam(
                                              widget.userRef,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'usuarioREF': widget.userRef,
                                          },
                                        );
                                      },
                                      editar: () async {
                                        context.pushNamed(
                                          'EditarPerfilUsuario',
                                          queryParameters: {
                                            'usuarioREF': serializeParam(
                                              widget.userRef,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'usuarioREF': widget.userRef,
                                          },
                                        );
                                      },
                                      excluir: () async {
                                        Function() _navigate = () {};
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text(
                                                            'Excluir Usuario?'),
                                                        content: Text(
                                                            'Você tem certeza que você quer excluir esse usuario? Com isso todas as informações seram totalmente perdidas'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text(
                                                                'Cancelar'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text(
                                                                'Sim, excluir'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          await FirebaseStorage.instance
                                              .refFromURL(
                                                  widget.userRef!.reference.id)
                                              .delete();
                                          await widget.userRef!.reference
                                              .delete();
                                        } else {
                                          return;
                                        }
                                      },
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
