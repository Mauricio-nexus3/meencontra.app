import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? isWeb
          ? Container()
          : Container(
              color: FlutterFlowTheme.of(context).primary,
              child: Center(
                child: Image.asset(
                  'assets/images/icone_me_encontra_sem_fundo.png',
                  width: 120.0,
                  fit: BoxFit.contain,
                ),
              ),
            )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Index': ParameterData.none(),
  'Categorias': ParameterData.none(),
  'Feed': ParameterData.none(),
  'Anunciante': (data) async => ParameterData(
        allParams: {
          'refAnunciante':
              getParameter<DocumentReference>(data, 'refAnunciante'),
        },
      ),
  'Resultado': (data) async => ParameterData(
        allParams: {
          'subCategoriasResultRef':
              getParameter<DocumentReference>(data, 'subCategoriasResultRef'),
        },
      ),
  'SubCtegoria': (data) async => ParameterData(
        allParams: {
          'subCategoria': getParameter<DocumentReference>(data, 'subCategoria'),
        },
      ),
  'ForgotPassword': ParameterData.none(),
  'BuscaAvancada': ParameterData.none(),
  'NovoAnunciante': ParameterData.none(),
  'Suporte': (data) async => ParameterData(
        allParams: {
          'usuarioRef': getParameter<DocumentReference>(data, 'usuarioRef'),
        },
      ),
  'EditarPerfil': (data) async => ParameterData(
        allParams: {
          'usuarioREF': getParameter<DocumentReference>(data, 'usuarioREF'),
        },
      ),
  'DashboardAnuncios': (data) async => ParameterData(
        allParams: {
          'dashboardAnuncios':
              getParameter<DocumentReference>(data, 'dashboardAnuncios'),
        },
      ),
  'DashboardCatalogo': (data) async => ParameterData(
        allParams: {
          'dashMenuCatalogo':
              getParameter<DocumentReference>(data, 'dashMenuCatalogo'),
        },
      ),
  'LinkExterno': (data) async => ParameterData(
        allParams: {
          'linkExterno': getParameter<String>(data, 'linkExterno'),
        },
      ),
  'SuporteAnunciante': (data) async => ParameterData(
        allParams: {
          'anuncianteRef':
              getParameter<DocumentReference>(data, 'anuncianteRef'),
        },
      ),
  'PoliticaPrivacidade': ParameterData.none(),
  'sucesso': (data) async => ParameterData(
        allParams: {
          'anuncianteREF':
              getParameter<DocumentReference>(data, 'anuncianteREF'),
        },
      ),
  'PagamentoInterno': (data) async => ParameterData(
        allParams: {
          'anuncianteREF':
              getParameter<DocumentReference>(data, 'anuncianteREF'),
        },
      ),
  'TermosDeUso': ParameterData.none(),
  'Bloqueio': (data) async => ParameterData(
        allParams: {
          'anuncianteREF':
              getParameter<DocumentReference>(data, 'anuncianteREF'),
        },
      ),
  'meinformaDetalhesNoticia': (data) async => ParameterData(
        allParams: {
          'materiaRef': getParameter<DocumentReference>(data, 'materiaRef'),
        },
      ),
  'TVGON': (data) async => ParameterData(
        allParams: {
          'imprensaRef': getParameter<DocumentReference>(data, 'imprensaRef'),
        },
      ),
  'CadastroInicial': ParameterData.none(),
  'ConcluirCadastro': (data) async => ParameterData(
        allParams: {
          'anuncianteRef':
              getParameter<DocumentReference>(data, 'anuncianteRef'),
        },
      ),
  'ValidarEmail': ParameterData.none(),
  'meInforma': ParameterData.none(),
  'meContrata': ParameterData.none(),
  'meContrataDetalhesVaga': (data) async => ParameterData(
        allParams: {
          'vagaRef': getParameter<DocumentReference>(data, 'vagaRef'),
        },
      ),
  'meDivirta': ParameterData.none(),
  'meDivirtiDetalhesEvento': (data) async => ParameterData(
        allParams: {
          'eventoRef': getParameter<DocumentReference>(data, 'eventoRef'),
        },
      ),
  'CriarNovaMateria': (data) async => ParameterData(
        allParams: {
          'goRef': getParameter<DocumentReference>(data, 'goRef'),
        },
      ),
  'CriarNovaVaga': ParameterData.none(),
  'CriarNovoEvento': ParameterData.none(),
  'EditarMateria': (data) async => ParameterData(
        allParams: {
          'materiaRef': getParameter<DocumentReference>(data, 'materiaRef'),
        },
      ),
  'EditarVaga': (data) async => ParameterData(
        allParams: {
          'editarVaga': getParameter<DocumentReference>(data, 'editarVaga'),
        },
      ),
  'EditarEvento': (data) async => ParameterData(
        allParams: {
          'eventoRef': getParameter<DocumentReference>(data, 'eventoRef'),
        },
      ),
  'CriarPerfil': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'testemarkdown': ParameterData.none(),
  'meDashboardAnunciantes': ParameterData.none(),
  'meDashboard': ParameterData.none(),
  'meDashboardmecontrata': ParameterData.none(),
  'meDashboardmedivirta': ParameterData.none(),
  'meDashboardNotificacao': ParameterData.none(),
  'meDashboardUsuarios': ParameterData.none(),
  'meDashboardmeinforma': ParameterData.none(),
  'DetalhesProduto': (data) async => ParameterData(
        allParams: {
          'detalhesProduto': await getDocumentParameter<ProdutoRecord>(
              data, 'detalhesProduto', ProdutoRecord.fromSnapshot),
          'anunciante': await getDocumentParameter<AnuncianteRecord>(
              data, 'anunciante', AnuncianteRecord.fromSnapshot),
          'carrinhoDeComprasUsuarioDoc':
              await getDocumentParameter<CarrinhoDeComprasUsuarioRecord>(
                  data,
                  'carrinhoDeComprasUsuarioDoc',
                  CarrinhoDeComprasUsuarioRecord.fromSnapshot),
        },
      ),
  'DashboardNwAnunciante': (data) async => ParameterData(
        allParams: {
          'anuncianteDoc': await getDocumentParameter<AnuncianteRecord>(
              data, 'anuncianteDoc', AnuncianteRecord.fromSnapshot),
        },
      ),
  'testeAtual': ParameterData.none(),
  'AnuncianteCopy': (data) async => ParameterData(
        allParams: {
          'documentoRefAnunciante':
              await getDocumentParameter<AnuncianteRecord>(data,
                  'documentoRefAnunciante', AnuncianteRecord.fromSnapshot),
        },
      ),
  'Produtos': (data) async => ParameterData(
        allParams: {
          'anuncianteDoc': await getDocumentParameter<AnuncianteRecord>(
              data, 'anuncianteDoc', AnuncianteRecord.fromSnapshot),
        },
      ),
  'catalogoCategoria': (data) async => ParameterData(
        allParams: {
          'anuncianteDoc': await getDocumentParameter<AnuncianteRecord>(
              data, 'anuncianteDoc', AnuncianteRecord.fromSnapshot),
        },
      ),
  'DashboardNWAnuncios': (data) async => ParameterData(
        allParams: {
          'anuncianteDoc': await getDocumentParameter<AnuncianteRecord>(
              data, 'anuncianteDoc', AnuncianteRecord.fromSnapshot),
        },
      ),
  'DashboardNWvagas': (data) async => ParameterData(
        allParams: {
          'anuncianteDoc': await getDocumentParameter<AnuncianteRecord>(
              data, 'anuncianteDoc', AnuncianteRecord.fromSnapshot),
        },
      ),
  'DashboardNWSuporte': (data) async => ParameterData(
        allParams: {
          'anuncianteDoc': await getDocumentParameter<AnuncianteRecord>(
              data, 'anuncianteDoc', AnuncianteRecord.fromSnapshot),
        },
      ),
  'EditarPerfilUsuario': (data) async => ParameterData(
        allParams: {
          'usuarioREF': await getDocumentParameter<UsersRecord>(
              data, 'usuarioREF', UsersRecord.fromSnapshot),
        },
      ),
  'detalhesProduto2': (data) async => ParameterData(
        allParams: {
          'detalheProduto': await getDocumentParameter<ProdutoRecord>(
              data, 'detalheProduto', ProdutoRecord.fromSnapshot),
          'anuncianteDoc': await getDocumentParameter<AnuncianteRecord>(
              data, 'anuncianteDoc', AnuncianteRecord.fromSnapshot),
        },
      ),
  'FeedCopy': ParameterData.none(),
  'AnuncianteDashboard': (data) async => ParameterData(
        allParams: {
          'documentoRefAnunciante':
              await getDocumentParameter<AnuncianteRecord>(data,
                  'documentoRefAnunciante', AnuncianteRecord.fromSnapshot),
        },
      ),
  'notificacoes': (data) async => ParameterData(
        allParams: {},
      ),
  'SubCtegoriaCopy2': (data) async => ParameterData(
        allParams: {
          'subCategoriaRefExcluir':
              getParameter<DocumentReference>(data, 'subCategoriaRefExcluir'),
          'categoriaDoc': await getDocumentParameter<CategoriasRecord>(
              data, 'categoriaDoc', CategoriasRecord.fromSnapshot),
        },
      ),
  'DashboardNWAssinatura': (data) async => ParameterData(
        allParams: {
          'anuncianteDoc': await getDocumentParameter<AnuncianteRecord>(
              data, 'anuncianteDoc', AnuncianteRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
