import 'package:rapino/api_client.dart';
import 'package:rapino/individual/individual_api.dart';
import 'package:rapino/models/brand.dart';
import 'package:rapino/models/point.dart';

class IndividualController {
  final Client _client =   Client();
  var _endpointProvider;

  IndividualController() {
    _endpointProvider =   IndividualApi(_client.init());
  }

  Future<PointMap> getPoint(id, lat, lng, PointMap pointMap) async {
    var data = await _endpointProvider.getPoint(id, lat, lng);
    PointMap pointMap = PointMap();
    var dataPoint = data["data"];
    pointMap.message = dataPoint["message"];
    pointMap.cover = dataPoint["brand"]["logo"];
    pointMap.brand = Brand(
        dataPoint["brand"]["id"],
        dataPoint["brand"]["logo"],
        dataPoint["brand"]["name"],
        dataPoint["brand"]["is_available"],
        dataPoint["brand"]["description"]);
    return pointMap;
  }
}
