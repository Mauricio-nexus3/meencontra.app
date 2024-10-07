import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

    safeSetState(() => _loading = true);
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
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
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
  'Resultado': (data) async => ParameterData(
        allParams: {
          'total': getParameter<double>(data, 'total'),
          'subCategoria': getParameter<String>(data, 'subCategoria'),
        },
      ),
  'SubCtegoria': (data) async => ParameterData(
        allParams: {
          'subCategoria': getParameter<DocumentReference>(data, 'subCategoria'),
        },
      ),
  'ForgotPassword': ParameterData.none(),
  'NovoAnunciante': ParameterData.none(),
  'Suporte': (data) async => ParameterData(
        allParams: {
          'usuarioRef': getParameter<DocumentReference>(data, 'usuarioRef'),
        },
      ),
  'myProfile': ParameterData.none(),
  'LinkExterno': (data) async => ParameterData(
        allParams: {
          'linkExterno': getParameter<String>(data, 'linkExterno'),
        },
      ),
  'PoliticaPrivacidade': ParameterData.none(),
  'TermosDeUso': ParameterData.none(),
  'Bloqueio': (data) async => ParameterData(
        allParams: {
          'anuncianteREF':
              getParameter<DocumentReference>(data, 'anuncianteREF'),
        },
      ),
  'meinformaDetalhesNoticia': (data) async => ParameterData(
        allParams: {
          'materiadoc': await getDocumentParameter<MateriasRecord>(
              data, 'materiadoc', MateriasRecord.fromSnapshot),
        },
      ),
  'PerfilImprensa': (data) async => ParameterData(
        allParams: {
          'imprensaRef': getParameter<DocumentReference>(data, 'imprensaRef'),
        },
      ),
  'CadastroInicial': ParameterData.none(),
  'ValidarEmail': ParameterData.none(),
  'meInforma': ParameterData.none(),
  'meContrata': ParameterData.none(),
  'meContrataDetalhesVaga': (data) async => ParameterData(
        allParams: {
          'vagaRef': await getDocumentParameter<MeContrataVAGASRecord>(
              data, 'vagaRef', MeContrataVAGASRecord.fromSnapshot),
        },
      ),
  'meDivirta': ParameterData.none(),
  'meDivirtiDetalhesEvento': (data) async => ParameterData(
        allParams: {
          'eventoRef': await getDocumentParameter<MeDiverteRecord>(
              data, 'eventoRef', MeDiverteRecord.fromSnapshot),
        },
      ),
  'cadastrarMateria': (data) async => ParameterData(
        allParams: {
          'materiaDoc': await getDocumentParameter<MateriasRecord>(
              data, 'materiaDoc', MateriasRecord.fromSnapshot),
        },
      ),
  'CriarNovaVaga': (data) async => ParameterData(
        allParams: {
          'vagaDoc': await getDocumentParameter<MeContrataVAGASRecord>(
              data, 'vagaDoc', MeContrataVAGASRecord.fromSnapshot),
        },
      ),
  'CriarNovoEvento': (data) async => ParameterData(
        allParams: {
          'eventoDoc': await getDocumentParameter<MeDiverteRecord>(
              data, 'eventoDoc', MeDiverteRecord.fromSnapshot),
        },
      ),
  'Perfil': ParameterData.none(),
  'meDashboardAnunciantes': ParameterData.none(),
  'meDashboard': ParameterData.none(),
  'meDashboardmecontrata': ParameterData.none(),
  'meDashboardmedivirta': ParameterData.none(),
  'meDashboardNotificacao': ParameterData.none(),
  'meDashboardUsuarios': ParameterData.none(),
  'meDashboardmeinforma': ParameterData.none(),
  'testeAtual': ParameterData.none(),
  'AnunciantePerfil': (data) async => ParameterData(
        allParams: {
          'referenciaAnunciante':
              getParameter<DocumentReference>(data, 'referenciaAnunciante'),
        },
      ),
  'DashAnuncianteCatalogo': (data) async => ParameterData(
        allParams: {
          'anuncianteDoc': await getDocumentParameter<AnuncianteRecord>(
              data, 'anuncianteDoc', AnuncianteRecord.fromSnapshot),
        },
      ),
  'DashAnunciantevagas': (data) async => ParameterData(
        allParams: {
          'anuncianteDoc': await getDocumentParameter<AnuncianteRecord>(
              data, 'anuncianteDoc', AnuncianteRecord.fromSnapshot),
        },
      ),
  'DashAnuncianteSuporte': (data) async => ParameterData(
        allParams: {
          'anuncianteDoc': await getDocumentParameter<AnuncianteRecord>(
              data, 'anuncianteDoc', AnuncianteRecord.fromSnapshot),
        },
      ),
  'Feed': ParameterData.none(),
  'AnunciantePage': (data) async => ParameterData(
        allParams: {
          'documentoRefAnunciante':
              await getDocumentParameter<AnuncianteRecord>(data,
                  'documentoRefAnunciante', AnuncianteRecord.fromSnapshot),
        },
      ),
  'notificacoes': ParameterData.none(),
  'DashAnuncianteAssinatura': (data) async => ParameterData(
        allParams: {
          'anuncianteDoc': await getDocumentParameter<AnuncianteRecord>(
              data, 'anuncianteDoc', AnuncianteRecord.fromSnapshot),
        },
      ),
  'meDashboardSuporte': ParameterData.none(),
  'configuracoes': ParameterData.none(),
  'impreendimentos': ParameterData.none(),
  'TonyAssist': ParameterData.none(),
  'meuperfil': ParameterData.none(),
  'definirImg': (data) async => ParameterData(
        allParams: {},
      ),
  'tema': ParameterData.none(),
  'localizacao': ParameterData.none(),
  'edit': (data) async => ParameterData(
        allParams: {
          'input': getParameter<String>(data, 'input'),
          'title': getParameter<String>(data, 'title'),
        },
      ),
  'optionsNotification': ParameterData.none(),
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
