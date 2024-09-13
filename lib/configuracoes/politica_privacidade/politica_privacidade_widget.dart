import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'politica_privacidade_model.dart';
export 'politica_privacidade_model.dart';

class PoliticaPrivacidadeWidget extends StatefulWidget {
  const PoliticaPrivacidadeWidget({super.key});

  @override
  State<PoliticaPrivacidadeWidget> createState() =>
      _PoliticaPrivacidadeWidgetState();
}

class _PoliticaPrivacidadeWidgetState extends State<PoliticaPrivacidadeWidget> {
  late PoliticaPrivacidadeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PoliticaPrivacidadeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PoliticaPrivacidade'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'PoliticaPrivacidade',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  FFIcons.karrowBack,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('POLITICA_PRIVACIDADE_arrowBack_ICN_ON_TA');
                  context.pop();
                },
              ),
              title: Text(
                'Politica de privacidade',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 1020.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Política de Privacidade e dados do usuário ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                'A sua privacidade é de extrema importância para nós. É política do meencontra App respeitar a sua privacidade em relação a qualquer informação sua que possamos coletar no site meencontra.app e outros sites que possuímos e operamos. Solicitamos informações pessoais apenas quando realmente precisamos delas para lhe fornecer um serviço. As informações que coletamos são o seu nome, telefone e endereço de e-mail. Reforçamos que as senhas fornecidas são criptografadas em nosso banco de dados e não temos acesso a elas. Caso você esqueça sua senha, é possível redefini-la para recuperar o acesso à sua conta.\n\nAo utilizar nosso aplicativo, você consente com a coleta e uso das informações fornecidas, de acordo com esta política de privacidade. Ressaltamos que você tem o direito de retirar o seu consentimento a qualquer momento, mediante solicitação por e-mail para sac@meencontra.app. No entanto, observe que isso pode implicar na impossibilidade de continuar a fornecer alguns dos serviços desejados.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Login no Aplicativo',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Text(
                                'O login no aplicativo é necessário para garantir a segurança e autenticidade das interações dos usuários, bem como para permitir que eles se tornem responsáveis por estabelecimentos cadastrados. Através do login, os usuários podem gerenciar seus perfis e a responsabilidade pelos estabelecimentos listados.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Controle de Dados de Estabelecimentos',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Text(
                                'Entendemos a importância de manter a integridade das informações sobre os estabelecimentos listados em nossa plataforma. Os usuários têm controle total sobre os estabelecimentos cadastrados, podendo editá-los, remover informações ou encerrar sua responsabilidade por eles a qualquer momento.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                'Dados Tratados por terceiros e Finalidade do Tratamento',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                'O aplicativo usa serviços de terceiros que podem coletar informações usadas para identificá-lo, como:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                '• WhatsApp Troca de mensagens\nStripe Plataforma de pagamento de anuidade do anuncio comercial.\nFacebook Finalizar o cadastro no aplicativo através do login social com Facebook\nFirebase\nOnde seus dados serão armazenados , Monitorar o desempenho e a\nestabilidade e enviar notificações para os usuários.\nGoogle Cloud\nPlataform\nFinalizar o cadastro no aplicativo através do login social com Google\nGoogle Maps\nAtivar geolocalização no app, para organizar o conteúdo do app ou definir o\nlocal de eventual entrega contratada através do serviço do app\nGoogle Play\nServices\nCriação e funcionamento do app',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '• WhatsApp - ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      mouseCursor: SystemMouseCursors.click,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          logFirebaseEvent(
                                              'POLITICA_PRIVACIDADE_RichTextSpan_w4he68');
                                          await launchURL(
                                              'https://www.whatsapp.com/legal/terms-of-service?lang=pt_BR');
                                        },
                                    ),
                                    TextSpan(
                                      text: 'Troca de mensagens',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '• Mercado Pago - ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      mouseCursor: SystemMouseCursors.click,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          logFirebaseEvent(
                                              'POLITICA_PRIVACIDADE_RichTextSpan_5zlyne');
                                          await launchURL(
                                              'https://www.mercadopago.com.br/');
                                        },
                                    ),
                                    TextSpan(
                                      text:
                                          'Plataforma de pagamento de anuidade do anuncio comercial.',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '• Facebook - ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      mouseCursor: SystemMouseCursors.click,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          logFirebaseEvent(
                                              'POLITICA_PRIVACIDADE_RichTextSpan_mqanz2');
                                          await launchURL(
                                              'https://www.facebook.com/privacy/explanation&sa=D&source=editors&ust=1668114069942591&usg=AOvVaw2vYPHymRopyUQn895fmtSj');
                                        },
                                    ),
                                    TextSpan(
                                      text:
                                          'Onde seus dados serão armazenados , Monitorar o desempenho e a estabilidade e enviar notificações para os usuários.',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '• Firebase - ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      mouseCursor: SystemMouseCursors.click,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          logFirebaseEvent(
                                              'POLITICA_PRIVACIDADE_RichTextSpan_ai920q');
                                          await launchURL(
                                              'https://firebase.google.com/support/privacy/&sa=D&source=editors&ust=1668114069943858&usg=AOvVaw2nSFsO2yKdbcPwFh_vj3RT');
                                        },
                                    ),
                                    TextSpan(
                                      text:
                                          'Onde seus dados serão armazenados , Monitorar o desempenho e a estabilidade e enviar notificações para os usuários.',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '• Google cloud plataform - ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      mouseCursor: SystemMouseCursors.click,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          logFirebaseEvent(
                                              'POLITICA_PRIVACIDADE_RichTextSpan_iunmmj');
                                          await launchURL(
                                              'https://policies.google.com/privacy?hl%3Dpt-BR&sa=D&source=editors&ust=1668114069945066&usg=AOvVaw2ELTDCsK_oAG97wIf_ANDG');
                                        },
                                    ),
                                    TextSpan(
                                      text:
                                          'Finalizar o cadastro no aplicativo através do login social com Google',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '• Google maps - ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      mouseCursor: SystemMouseCursors.click,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          logFirebaseEvent(
                                              'POLITICA_PRIVACIDADE_RichTextSpan_4anwba');
                                          await launchURL(
                                              'https://www.google.com/intl/pt_US/help/terms_maps/&sa=D&source=editors&ust=1668114069945906&usg=AOvVaw2SdQYx2jrpLPKOxrXslQHY');
                                        },
                                    ),
                                    TextSpan(
                                      text:
                                          'Ativar geolocalização no app, para organizar o conteúdo do app ou definir o local de eventual entrega contratada através do serviço do app',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '• Google Play Services - ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      mouseCursor: SystemMouseCursors.click,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          logFirebaseEvent(
                                              'POLITICA_PRIVACIDADE_RichTextSpan_u1nobe');
                                          await launchURL(
                                              'https://policies.google.com/privacy?hl%3Dpt-BR&sa=D&source=editors&ust=1668114069946722&usg=AOvVaw22tVZzn8Z0is4JiXg9Eb9x');
                                        },
                                    ),
                                    TextSpan(
                                      text: 'Criação e funcionamento do app',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Text(
                                'Importante ressaltar que, sempre que você usar os nossos Serviços, coletamos dados de registro. Esses dados de registro podem incluir informações como identificadores online, identificadores de cookies, endereços de protocolo de internet, identificadores de dispositivos, identificadores de cliente, endereço de ip, nome do dispositivo, versão do sistema operacional, configuração do aplicativo ao utilizar os nossos serviços, a hora e a data do seu uso do serviço e outras estatísticas.\n\nUma vez que os serviços de hospedagem e servidores podem não estar localizados no território brasileiro. Ressaltamos que sempre que transferirmos informações pessoais para outras jurisdições, garantimos que tais informações sejam transferidas de acordo com esta política de privacidade e conforme permitido pela legislação de proteção de dados aplicável.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                'Compartilhamento dos Dados',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                'Como visto, empregamos empresas terceiras devido às seguintes razões:\n\n- Facilitar nosso serviço;\n- Fornecer o serviço em nosso nome;\n- Executar serviços relacionados a serviços do aplicativo; ou\n- Ajudar a analisar como nosso serviço é usado.\n\nEsses terceiros têm acesso a certos dados pessoais para executar as tarefas atribuídas a eles em nosso nome.\n\nNo entanto, eles são obrigados a não divulgar ou usar as informações para qualquer outra finalidade.\n\nLembramos que também podemos compartilhar informações pessoais de usuários com empresas, organizações ou indivíduos externos ao serviço prestado, se acreditarmos, de boa-fé, que o acesso, o uso, a preservação ou a divulgação das informações sejam necessários para:\n\n1. Cumprir qualquer legislação, regulamentação, ordem judicial ou solicitação governamental aplicável;\n2. Cumprir os Termos de Serviço aplicáveis, inclusive a investigação de possíveis violações;\n3. Detectar, impedir ou lidar de alguma forma com fraudes, problemas técnicos ou de segurança;\n4. Proteger contra prejuízo aos direitos, à propriedade ou à segurança dos nossos usuários ou do público, conforme solicitado ou permitido por lei.\n\nEstamos comprometidos em proteger suas informações e adotamos medidas de segurança dentro dos padrões comercialmente aceitáveis, incluindo o uso de certificados de segurança SSL e TLS, para evitar perdas, roubos, acesso não autorizado, divulgação, cópia, uso ou modificação indevidos das informações coletadas.\n\nAlém disso, gerenciamos o consentimento dos visitantes do site em um único lugar, atendendo às exigências da Lei Geral de Proteção de Dados nº 13.709/2018 (LGPD) e outras leis de privacidade aplicáveis, garantindo que seus direitos em relação à privacidade e proteção de dados sejam respeitados.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.2,
                                    ),
                              ),
                              Text(
                                'Direito dos Titulares',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                'É muito importante que você tenha total controle dos dados pessoais que compartilha conosco. Observe que, para ajudar a proteger sua privacidade e manter a segurança, tomamos medidas para verificar sua identidade antes de conceder acesso a suas informações pessoais ou cumprir exclusão, portabilidade ou outras solicitações relacionadas.\n\nCaso você tenha alguma dúvida sobre como lidamos com seus dados pessoais, ou deseje realizar qualquer alteração nos seus dados cadastrados, basta acessar a aba \"Perfil\" em nosso aplicativo e selecionar \"Editar Perfil\" para atualizar suas informações. Além disso, você pode optar por excluir sua conta no aplicativo, juntamente com todos os dados coletados, acessando a aba \"Perfil\", selecionando \"Configurações de Conta\" e, em seguida, a aba \"Excluir Conta\".\n\nEsperamos que estas informações estejam esclarecedoras. Caso tenha alguma dúvida ou precise de esclarecimentos adicionais, sinta-se à vontade para entrar em contato conosco pelo e-mail sac@meencontra.app.\n\nEsta política é efetiva a partir de 01 de Outubro de 2023.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(height: 16.0))
                                .around(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
