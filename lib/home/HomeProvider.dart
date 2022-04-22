import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rapino/models/point.dart';

class HomeProvider with ChangeNotifier {
  String _hero = "capitan ";

  List<Marker> markers = [];

  bool _isLoading = false;

  int _indexCarousel = 0;

  int get indexCarousel => _indexCarousel;

  set indexCarousel(int value) {
    _indexCarousel = value;
  }

  List<PointMap> _pointMaps = [];

  List<PointMap> get pointMaps => _pointMaps;

  set pointMaps(List<PointMap> value) {
    _pointMaps = value;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  populateMarkers(_swiperController) async {
    for (var i = 0; i < pointMaps.length; i++) {
      var marker = Marker(
          width: 60.0,
          height: 60.0,
          point: LatLng(pointMaps[i].latitude, pointMaps[i].longitude),
          builder: (ctx) => Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(
                        onTap: () {
                          indexCarousel = i;
                          notifyListeners();
                          _swiperController.move(i);
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.network(
                              pointMaps[i].brand.logo,
                              width: 50,
                              height: 50,
                            )),
                      )),
                ],
              ));

      markers.add(marker);
    }

    notifyListeners();
  }

  String get hero => _hero;

  set hero(String value) {
    _hero = value;
    notifyListeners();
  }
}
