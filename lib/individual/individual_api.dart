import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

class IndividualApi {
  final Dio _client;

  IndividualApi(this._client);

  Future getPoint(String id, double lat, double lng) async {
    try {
      final response =
          await _client.get('/branch-offices/$id', queryParameters: {
        'city_id': 'c1e4bcc9-eb84-4653-872c-e38f8de4bf79',
        'lat': '$lat',
        'lng': '$lng',
        'slim': 'false',
        'schedule': 'false'
      });
      return json.decode(response.toString());
    } on DioError catch (ex) {
      String errorMessage = ex.message.toString();
      throw  Exception(errorMessage);
    }
  }
}
