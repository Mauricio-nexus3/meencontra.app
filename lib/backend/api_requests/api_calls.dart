import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start MercadoPago Group Code

class MercadoPagoGroup {
  static String baseUrl = 'https://api.mercadopago.com/v1';
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
      apiUrl: '${MercadoPagoGroup.baseUrl}/payments',
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
    return ApiManager.instance.makeApiCall(
      callName: 'statusPix',
      apiUrl: '${MercadoPagoGroup.baseUrl}/payments/${idPix}',
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
      apiUrl: '${MercadoPagoGroup.baseUrl}/card_tokens?public_key=${publicKey}',
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
      apiUrl: '${MercadoPagoGroup.baseUrl}/payments',
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
      alwaysAllowBody: false,
    );
  }
}

/// End MercadoPago Group Code

class ApiViacepCall {
  static Future<ApiCallResponse> call({
    String? cep = '92704-380',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ApiViacep',
      apiUrl: 'viacep.com.br/ws/${cep}/json/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? logradouro(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.logradouro''',
      ));
  static String? complemento(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.complemento''',
      ));
  static String? bairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bairro''',
      ));
  static String? cidade(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.localidade''',
      ));
  static String? uf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uf''',
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
