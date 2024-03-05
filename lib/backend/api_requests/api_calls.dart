import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetNewsPollutionCall {
  static Future<ApiCallResponse> call({
    String? language = 'eng',
  }) async {
    final ffApiRequestBody = '''
{
  "action": "getArticles",
  "keyword": "Pollution",
  "articlesPage": 1,
  "articlesCount": 5,
  "articlesSortBy": "date",
  "articlesSortByAsc": false,
  "articlesArticleBodyLen": -1,
  "resultType": "articles",
  "apiKey": "58715943-f84e-4c5e-a7a5-4ebfd41707a6",
  "forceMaxDataTimeWindow": 31,
  "lang": "$language"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getNewsPollution',
      apiUrl: 'http://eventregistry.org/api/v1/article/getArticles',
      callType: ApiCallType.POST,
      headers: {},
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

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.articles.results''',
        true,
      ) as List?;
  static dynamic articles(dynamic response) => getJsonField(
        response,
        r'''$.articles''',
      );
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.articles.results[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.articles.results[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AirQualityCurrentConditionCall {
  static Future<ApiCallResponse> call({
    String? city = 'Milano',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'airQualityCurrentCondition',
      apiUrl: 'https://api.api-ninjas.com/v1/airquality?city=$city',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': 'RrPpVi135wW2qGfpG+KeVw==svXFFXH4fufaFNan',
      },
      params: {
        'city': city,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? overallaqi(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.overall_aqi''',
      ));
  static int? pm10aqi(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.PM10.aqi''',
      ));
  static int? so2aqi(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.SO2.aqi''',
      ));
  static int? o3aqi(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.O3.aqi''',
      ));
  static int? no2aqi(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.NO2.aqi''',
      ));
  static int? coaqi(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.CO.aqi''',
      ));
}

class AirQualityByCoordinatesCall {
  static Future<ApiCallResponse> call({
    double? latitude = 45,
    double? longitude = 9,
  }) async {
    final ffApiRequestBody = '''
{
  "universalAqi": true,
  "location": {
    "latitude": $latitude,
    "longitude": $longitude
  },
  "extraComputations": [
    "HEALTH_RECOMMENDATIONS",
    "DOMINANT_POLLUTANT_CONCENTRATION",
    "POLLUTANT_CONCENTRATION",
    "POLLUTANT_ADDITIONAL_INFO"
  ],
  "languageCode": "en"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'airQualityByCoordinates',
      apiUrl:
          'https://airquality.googleapis.com/v1/currentConditions:lookup?key=AIzaSyA_u3dQcWxlKGObgpH3Bkj_qHiwWAo6FHU',
      callType: ApiCallType.POST,
      headers: {},
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

  static String? aqi(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.indexes[:].aqiDisplay''',
      ));
}

class GeocodingCall {
  static Future<ApiCallResponse> call({
    String? address = 'Milano',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'geocoding',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=AIzaSyA_u3dQcWxlKGObgpH3Bkj_qHiwWAo6FHU',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'address': address,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static dynamic coordinates(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location''',
      );
  static double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
      ));
  static double? lng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
      ));
}

class MapCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'map',
      apiUrl:
          'https://airquality.googleapis.com/v1/mapTypes/UAQI_INDIGO_PERSIAN/heatmapTiles/0/0/0?key=AIzaSyA_u3dQcWxlKGObgpH3Bkj_qHiwWAo6FHU',
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
}

class ReverseGeocodingCall {
  static Future<ApiCallResponse> call({
    String? latlng = '45.46,9.18',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'reverseGeocoding',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latlng&key=AIzaSyA_u3dQcWxlKGObgpH3Bkj_qHiwWAo6FHU',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latlng': latlng,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ProfilePicCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'profilePic',
      apiUrl: 'https://api.api-ninjas.com/v1/randomimage?category=abstract',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': 'RrPpVi135wW2qGfpG+KeVw==svXFFXH4fufaFNan',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class PollutionMapInteractiveCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'pollutionMapInteractive',
      apiUrl:
          'https://api.mapbox.com/styles/v1/ismaelevilla/cltdfck4a002n01nrge994dfd.html?title=view&access_token=pk.eyJ1IjoiaXNtYWVsZXZpbGxhIiwiYSI6ImNsdGFiMWZ2MTE5MmYybW8xc3hpZG1uMjMifQ.bZnOW7ae8-NuDIDYJuxeTQ&zoomwheel=true&fresh=true#3.1/47.75/17.5/14.7/29',
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
