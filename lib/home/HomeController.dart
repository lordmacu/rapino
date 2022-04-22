import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'package:rapino/api_client.dart';
import 'package:rapino/home/home_api.dart';
import 'package:rapino/models/brand.dart';
import 'package:rapino/models/point.dart';

class HomeController {
  final Client _client = Client();
  var _endpointProvider;

  double _defaultlat = 0;
  double _defaultlng = 0;

  double get defaultlat => _defaultlat;

  set defaultlat(double value) {
    _defaultlat = value;
  }

  HomeController(lat, lng) {
    _endpointProvider = HomeApi(_client.init());
    _defaultlat = lat;
    _defaultlng = lng;
  }

  formatPoint(PointMap point) async {
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(point.brand.logo))
            .load(point.brand.logo))
        .buffer
        .asUint8List();

    point.brand.imageFormated = bytes;

    return point;
  }

  Future<List<PointMap>> getPoints() async {
    var data = await _endpointProvider.getPoints();

    List<PointMap> points = [];

    for (var i = 0; i < data["data"].length; i++) {
      var dataPoint = data["data"][i];

      PointMap point = PointMap();
      point.id = dataPoint["id"];
      point.name = dataPoint["name"];
      point.address = dataPoint["address"];
      point.delivery_rate = dataPoint["delivery_rate"];
      point.is_available = dataPoint["is_available"];
      point.accept_datafono = dataPoint["accept_datafono"];
      point.accept_creditcard = dataPoint["accept_creditcard"];
      point.accept_cash = dataPoint["accept_cash"];
      point.has_pickup = dataPoint["has_pickup"];
      point.is_coming_soon = dataPoint["is_coming_soon"];
      point.join_name = dataPoint["join_name"];
      point.latitude = dataPoint["latitude"];
      point.longitude = dataPoint["longitude"];
      point.is_working = dataPoint["is_working"];
      point.is_demo = dataPoint["is_demo"];
      point.branchoffice_type = dataPoint["branchoffice_type"];
      point.is_develop = dataPoint["is_develop"];
      point.coverage_radio = dataPoint["coverage_radio"];
      point.is_featured = dataPoint["is_featured"];

      point.brand = Brand(
          dataPoint["brand"]["id"],
          dataPoint["brand"]["logo"],
          dataPoint["brand"]["name"],
          dataPoint["brand"]["is_available"],
          dataPoint["brand"]["description"]);

      points.add(point);
    }

    return points;
  }

  double get defaultlng => _defaultlng;

  set defaultlng(double value) {
    _defaultlng = value;
  }
}
