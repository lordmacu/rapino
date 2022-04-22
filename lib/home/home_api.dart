import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

class HomeApi {
  final Dio _client;

  HomeApi(this._client);

  Future getPoints() async {
    try {
      final response = await _client.get('/branch-offices/', queryParameters: {
        'city_id': 'c1e4bcc9-eb84-4653-872c-e38f8de4bf79',
        'lat': '4.545367057195659',
        'lng': '-76.09435558319092',
        'coverage_radio': 'true'
      });
      return json.decode(response.toString());
    } on DioError catch (ex) {
      String errorMessage = ex.message.toString();
      throw  Exception(errorMessage);
    }
  }
}
