import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: 'https://boardmember.azaniabank.co.tz/api/v1/Auth',
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

  static String? responseCodeApi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.responseCode''',
      ));
  static String? messageApi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static dynamic? userDetails(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  static List<String>? userCometee(dynamic response) => (getJsonField(
        response,
        r'''$.committee[:].committee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? userCometeelist(dynamic response) => getJsonField(
        response,
        r'''$.committee''',
        true,
      ) as List?;
}

class GetAllEventsPostedCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAllEventsPosted',
      apiUrl: 'https://boardmember.azaniabank.co.tz/api/v1/postedEvents/All',
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

  static String? responseCodeApi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.responseCode''',
      ));
  static String? messageApi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? eventPost(dynamic response) => getJsonField(
        response,
        r'''$.EventsPosts''',
        true,
      ) as List?;
}

class GetAllMeeetingsCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAllMeeetings',
      apiUrl: 'https://boardmember.azaniabank.co.tz/api/v1/meeting/All',
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

  static String? responseCodeApi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.responseCode''',
      ));
  static String? messageApi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? meetingLists(dynamic response) => getJsonField(
        response,
        r'''$.CommitteeMeetings''',
        true,
      ) as List?;
}

class GetAllMeeetingsByFoldernameCall {
  static Future<ApiCallResponse> call({
    String? folderName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "folder_name": "${folderName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAllMeeetings ByFoldername',
      apiUrl:
          'https://boardmember.azaniabank.co.tz/api/v1/meetingFolderPreview/All',
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

  static String? responseCodeApi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.responseCode''',
      ));
  static String? messageApi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? folderdetals(dynamic response) => getJsonField(
        response,
        r'''$.folder_detals''',
        true,
      ) as List?;
}

class GetallCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getall',
      apiUrl: 'https://boardmember.azaniabank.co.tz/api/v1/users',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
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
