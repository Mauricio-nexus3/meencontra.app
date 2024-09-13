import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start MercadoPago Group Code

class MercadoPagoGroup {
  static String getBaseUrl() => 'https://api.mercadopago.com/v1';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer APP_USR-4780078497213161-102612-898b4fdbb2fb19ea993ee1a0863de558-1526092524',
  };
  static PixCall pixCall = PixCall();
  static StatusPixCall statusPixCall = StatusPixCall();
  static CriarTokenCall criarTokenCall = CriarTokenCall();
  static PagamentoCartaoCall pagamentoCartaoCall = PagamentoCartaoCall();
}

class PixCall {
  Future<ApiCallResponse> call({
    double? amount,
    String? productTitle = '',
    String? email = '',
    String? firstName = '',
    String? lastName = '',
    String? identificationType = '',
    String? numberDocumento = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
"transaction_amount":${amount},
"payment_method_id": "pix",
"payer": {
"email": "${email}",
"first_name": "${firstName}",
"last_name": "${lastName}",
"identification": {
"type":"${identificationType}",
"number": "${numberDocumento}"
        }
    }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pix',
      apiUrl: '${baseUrl}/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-4780078497213161-102612-898b4fdbb2fb19ea993ee1a0863de558-1526092524',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic idPedido(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic pix(dynamic response) => getJsonField(
        response,
        r'''$.payment_method_id''',
      );
  dynamic chavePix(dynamic response) => getJsonField(
        response,
        r'''$.point_of_interaction.transaction_data.qr_code_base64''',
      );
  dynamic qRcode(dynamic response) => getJsonField(
        response,
        r'''$.point_of_interaction.transaction_data.qr_code''',
      );
  dynamic msgErro(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class StatusPixCall {
  Future<ApiCallResponse> call({
    int? idPix,
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'statusPix',
      apiUrl: '${baseUrl}/payments/${idPix}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer APP_USR-4780078497213161-102612-898b4fdbb2fb19ea993ee1a0863de558-1526092524',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic statusPedido(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class CriarTokenCall {
  Future<ApiCallResponse> call({
    String? cardNumber = '',
    String? cardholderName = '',
    String? cardExpirationMonth = '',
    String? cardExpirationYear = '',
    String? securityCode = '',
    String? identificationType = '',
    String? identificationNumber = '',
    String? accessToken = '',
    String? publicKey = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
 "card_number":"${cardNumber}",
 "cardholder": {
   "name": "${cardholderName}",
   "identification": {
     "type": "${identificationType}",
     "number": "${identificationNumber}"
    }
  },
 "security_code": "${securityCode}",
 "expiration_month": "${cardExpirationMonth}",
 "expiration_year": "${cardExpirationYear}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Criar token',
      apiUrl: '${baseUrl}/card_tokens?public_key=${publicKey}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-4780078497213161-102612-898b4fdbb2fb19ea993ee1a0863de558-1526092524',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class PagamentoCartaoCall {
  Future<ApiCallResponse> call({
    double? transactionAmount,
    String? token = '',
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? identificationType = '',
    String? identificationNumber = '',
    String? zipCode = '',
    String? streetName = '',
    String? neighborhood = '',
    String? city = '',
    String? federalUnit = '',
    String? description = '',
    String? accessToken = '',
    int? installments,
    String? streetNumber = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "transaction_amount": ${transactionAmount},
  "token": "${token}",
  "installments": ${installments},
  "payer": {
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "email": "${email}",
    "type": "customer",
    "identification": {
      "type": "${identificationType}",
      "number": "${identificationNumber}"
    },
    "address": {
      "zip_code": "${zipCode}",
      "street_name": "${streetName}",
      "street_number": "${streetNumber}",
      "neighborhood": "${neighborhood}",
      "city": "${city}",
      "federal_unit": "${federalUnit}"
    }
  },
  "description": "${description}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pagamento Cartao',
      apiUrl: '${baseUrl}/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-4780078497213161-102612-898b4fdbb2fb19ea993ee1a0863de558-1526092524',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End MercadoPago Group Code

/// Start openweather Group Code

class OpenweatherGroup {
  static String getBaseUrl({
    String? apiKey = '8275df55a0c4d5e00e834df871234e80',
    String? idioma = 'imperial',
    String? graus = 'lang=pt',
  }) =>
      'https://api.openweathermap.org/data/2.5';
  static Map<String, String> headers = {};
  static LongitudeLatitudeDiaCall longitudeLatitudeDiaCall =
      LongitudeLatitudeDiaCall();
  static LongitudeLatitudeSemanaCall longitudeLatitudeSemanaCall =
      LongitudeLatitudeSemanaCall();
  static RetrievePaymentIntentCall retrievePaymentIntentCall =
      RetrievePaymentIntentCall();
  static RetrieveCheckoutSessionCall retrieveCheckoutSessionCall =
      RetrieveCheckoutSessionCall();
  static ListCustomersUsuariosAtivoCall listCustomersUsuariosAtivoCall =
      ListCustomersUsuariosAtivoCall();
}

class LongitudeLatitudeDiaCall {
  Future<ApiCallResponse> call({
    String? apiKey = '8275df55a0c4d5e00e834df871234e80',
    String? idioma = 'imperial',
    String? graus = 'lang=pt',
  }) async {
    final baseUrl = OpenweatherGroup.getBaseUrl(
      apiKey: apiKey,
      idioma: idioma,
      graus: graus,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'longitude latitude dia',
      apiUrl:
          '${baseUrl}/weather?lat=-30.1260869&lon=-51.3636263&appid=8275df55a0c4d5e00e834df871234e80&cnt=7&units=metric&lang=pt',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? cidade(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? tempo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.weather[:].main''',
      ));
  String? descricao(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.weather[:].description''',
      ));
  double? temperatura(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.temp''',
      ));
  double? minima(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.temp_min''',
      ));
  double? maxima(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.temp_max''',
      ));
  double? sensacao(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.feels_like''',
      ));
  int? umidade(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.main.humidity''',
      ));
  String? img(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.weather[:].icon''',
      ));
}

class LongitudeLatitudeSemanaCall {
  Future<ApiCallResponse> call({
    String? apiKey = '8275df55a0c4d5e00e834df871234e80',
    String? idioma = 'imperial',
    String? graus = 'lang=pt',
  }) async {
    final baseUrl = OpenweatherGroup.getBaseUrl(
      apiKey: apiKey,
      idioma: idioma,
      graus: graus,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'longitude latitude semana',
      apiUrl:
          '${baseUrl}/weather?lat=-30.1260869&lon=-51.3636263&appid=8275df55a0c4d5e00e834df871234e80&cnt=7&units=metric&lang=pt',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? cidade(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? tempo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.weather[:].main''',
      ));
  String? descricao(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.weather[:].description''',
      ));
  double? temperatura(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.temp''',
      ));
  double? minima(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.temp_min''',
      ));
  double? maxima(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.temp_max''',
      ));
  double? sensacao(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.feels_like''',
      ));
  int? umidade(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.main.humidity''',
      ));
  String? img(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.weather[:].icon''',
      ));
}

class RetrievePaymentIntentCall {
  Future<ApiCallResponse> call({
    String? idPaymentIntent = '',
    String? apiKey = '8275df55a0c4d5e00e834df871234e80',
    String? idioma = 'imperial',
    String? graus = 'lang=pt',
  }) async {
    final baseUrl = OpenweatherGroup.getBaseUrl(
      apiKey: apiKey,
      idioma: idioma,
      graus: graus,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Retrieve PaymentIntent',
      apiUrl: '${baseUrl}/payment_intents/${idPaymentIntent}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveCheckoutSessionCall {
  Future<ApiCallResponse> call({
    String? idsessionCheckout = '',
    String? status = '',
    String? apiKey = '8275df55a0c4d5e00e834df871234e80',
    String? idioma = 'imperial',
    String? graus = 'lang=pt',
  }) async {
    final baseUrl = OpenweatherGroup.getBaseUrl(
      apiKey: apiKey,
      idioma: idioma,
      graus: graus,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Retrieve Checkout Session',
      apiUrl: '${baseUrl}/checkout/sessions/${idsessionCheckout}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class ListCustomersUsuariosAtivoCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? status = 'complete',
    String? apiKey = '8275df55a0c4d5e00e834df871234e80',
    String? idioma = 'imperial',
    String? graus = 'lang=pt',
  }) async {
    final baseUrl = OpenweatherGroup.getBaseUrl(
      apiKey: apiKey,
      idioma: idioma,
      graus: graus,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'List Customers UsuariosAtivo',
      apiUrl: '${baseUrl}/customers',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? statusAssinatura(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].subscriptions.data[:].status''',
      ));
  List<String>? emailAnunciante(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? nomeAnunciante(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[:].subscriptions.data[:].items.data[:].plan.active''',
      ));
}

/// End openweather Group Code

class GeminiaiCall {
  static Future<ApiCallResponse> call({
    String? textfildPrompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "${textfildPrompt}"
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Geminiai',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyC86urKfOutTVTWj2SpOBWYihcnzDwwp8I',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? textGeminai(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
