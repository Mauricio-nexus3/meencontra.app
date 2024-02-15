import '/anunciante/new_anunciante/build/aviso_upgrade/aviso_upgrade_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'upgrade_model.dart';
export 'upgrade_model.dart';

class UpgradeWidget extends StatefulWidget {
  const UpgradeWidget({
    super.key,
    required this.mensagemMenu,
    required this.anunciantedoc,
  });

  final String? mensagemMenu;
  final AnuncianteRecord? anunciantedoc;

  @override
  State<UpgradeWidget> createState() => _UpgradeWidgetState();
}

class _UpgradeWidgetState extends State<UpgradeWidget> {
  late UpgradeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpgradeModel());

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

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 8.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).shadow10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 500.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 5.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 44.0,
                              icon: Icon(
                                Icons.close_rounded,
                                color: FlutterFlowTheme.of(context).accent2,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/Frame_207.svg',
                            width: double.infinity,
                            height: 280.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: () {
                                    if (widget.mensagemMenu ==
                                        'painelAdministrativo') {
                                      return 'Acesse o Painel Administrativo para ';
                                    } else if (widget.mensagemMenu ==
                                        'produtos') {
                                      return 'Destaque seus ';
                                    } else if (widget.mensagemMenu ==
                                        'catalogo') {
                                      return 'Organize Seus ';
                                    } else if (widget.mensagemMenu ==
                                        'meuNegocio') {
                                      return 'Personalize Sua Página ';
                                    } else if (widget.mensagemMenu ==
                                        'informacoes') {
                                      return 'Compartilhe Detalhes ';
                                    } else if (widget.mensagemMenu ==
                                        'localizacao') {
                                      return 'Mostre Sua ';
                                    } else if (widget.mensagemMenu ==
                                        'administradores') {
                                      return 'Delegu as responsabilidades e desfrute do melhor';
                                    } else {
                                      return 'Aproveite ao máximo';
                                    }
                                  }(),
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: () {
                                    if (widget.mensagemMenu ==
                                        'painelAdministrativo') {
                                      return 'Gerenciar sua Conta';
                                    } else if (widget.mensagemMenu ==
                                        'produtos') {
                                      return 'Produtos';
                                    } else if (widget.mensagemMenu ==
                                        'catalogo') {
                                      return 'Produtos';
                                    } else if (widget.mensagemMenu ==
                                        'meuNegocio') {
                                      return 'com cara do seu negócio';
                                    } else if (widget.mensagemMenu ==
                                        'informacoes') {
                                      return 'importantes';
                                    } else if (widget.mensagemMenu ==
                                        'localizacao') {
                                      return 'Localização';
                                    } else if (widget.mensagemMenu ==
                                        'administradores') {
                                      return 'desfrute do melhor';
                                    } else {
                                      return 'Aproveite ao máximo';
                                    }
                                  }(),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                )
                              ],
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          () {
                            if (widget.mensagemMenu == 'painelAdministrativo') {
                              return 'Acesse todas as configurações e métricas da sua página em um único lugar. Monitore o desempenho, gerencie conteúdos e interaja com seus clientes de forma eficiente.';
                            } else if (widget.mensagemMenu == 'produtos') {
                              return 'Adicione fotos, descrições e preços dos seus produtos para que seus clientes possam explorar e comprar diretamente no seu perfil.';
                            } else if (widget.mensagemMenu == 'catalogo') {
                              return 'Crie categorias para organizar seus produtos de forma fácil e intuitiva. Permita que seus clientes naveguem facilmente por diferentes tipos de itens.';
                            } else if (widget.mensagemMenu == 'meuNegocio') {
                              return ' Escolha entre uma variedade de cores e layouts para personalizar a aparência da sua página. Destaque-se e transmita a identidade da sua marca de maneira única.';
                            } else if (widget.mensagemMenu == 'informacoes') {
                              return 'Adicione informações adicionais sobre sua loja, como links para redes sociais, horário de funcionamento e formas de contato. Mantenha seus clientes informados e engajados';
                            } else if (widget.mensagemMenu == 'localizacao') {
                              return 'Marque sua localização no mapa para que seus clientes saibam exatamente onde encontrar seu estabelecimento. Facilite a chegada dos clientes e aumente sua visibilidade.';
                            } else if (widget.mensagemMenu ==
                                'administradores') {
                              return 'Escolha os membros da sua equipe que terão acesso para gerenciar sua página. Divida tarefas e mantenha o controle sobre quem pode fazer o quê na sua plataforma.';
                            } else {
                              return 'Recurso exclusivo para assinantes dos planos: medestaca, medestaca Capa, meimpulsiona e meimpulsiona Plus';
                            }
                          }(),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: WebViewAware(
                                          child: AvisoUpgradeWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));

                                  unawaited(
                                    () async {
                                      await launchURL(
                                          'https://api.whatsapp.com/send?phone=5551999900379?text=Ol%C3%A1%2C+vim+atrav%C3%A9s+do+meencontra.+Meu+nome+${currentUserDisplayName}.+e+quero+alterar+o+plano+do+meu+negocio+${widget.anunciantedoc?.nomeFantasia}');
                                    }(),
                                  );
                                  await Future.delayed(
                                      const Duration(milliseconds: 1000));

                                  context.pushNamed(
                                    'AnuncianteCopy',
                                    queryParameters: {
                                      'documentoRefAnunciante': serializeParam(
                                        widget.anunciantedoc,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'documentoRefAnunciante':
                                          widget.anunciantedoc,
                                    },
                                  );
                                },
                                text: 'Upgrade',
                                icon: Icon(
                                  Icons.rocket_launch,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  padding: EdgeInsets.all(24.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                      ),
                                  elevation: 1.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Disponível para os planos: ',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'me',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                    TextSpan(
                                      text: 'destaca, ',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'me',
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: 'impulsiona',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    TextSpan(
                                      text: ' e ',
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: 'me',
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: 'impulsionaPlus',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                    )
                                  ],
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 24.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
