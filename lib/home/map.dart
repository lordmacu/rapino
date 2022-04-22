import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:rapino/home/HomeController.dart';
import 'package:rapino/home/HomeProvider.dart';
import 'package:rapino/home/widgets/card_slide.dart';
import 'package:rapino/home/widgets/handler_card.dart';
import 'package:rapino/individual/IndividualController.dart';
import 'package:rapino/individual/IndividualProvider.dart';
import 'package:rapino/individual/individual.dart';
import 'package:rapino/models/point.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> with AfterLayoutMixin<Map> {
  HomeController controllerHome =
      HomeController(4.545367057195659, -76.09435558319092);
  final IndividualController _individualController = IndividualController();

  final Set<Marker> markers =   {};

  final MapController _mapController = MapController();
  final PanelController _panelController = PanelController();

  bool canAnimate = false;

  final SwiperController _swiperController = SwiperController();

  canAnimateSlide() async {
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        canAnimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    var individualProvider = Provider.of<IndividualProvider>(context);

    double width = MediaQuery.of(context).size.width;

    final double _panelMaxSize = MediaQuery.of(context).size.height - 300;

    return SlidingUpPanel(
        controller: _panelController,
        minHeight: 0,
        borderRadius: BorderRadius.circular(50),
        maxHeight: _panelMaxSize,
        backdropEnabled: true,
        parallaxEnabled: true,
        panel: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          width: width,
          child: Column(
            children: const [HandlerCard(), Individual()],
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(bottom: 130),
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Expanded(
                        child: FlutterMap(
                            mapController: _mapController,
                            options: MapOptions(
                                onTap: (position, latlon) {

                                },
                                zoom: 16.5,
                                center: LatLng(4.531053, -76.097644),
                                minZoom: 17,
                                maxZoom: 18,
                                onMapCreated: (mapController) async {
                                  homeProvider.isLoading = true;
                                  List<PointMap> points =
                                      await controllerHome.getPoints();
                                  homeProvider.pointMaps = points;
                                  await homeProvider
                                      .populateMarkers(_swiperController);
                                  homeProvider.isLoading = false;
                                }),
                            layers: [
                          TileLayerOptions(
                            tileProvider: NetworkTileProvider(),
                            urlTemplate:
                                'http://mt{s}.google.com/vt/lyrs=m@289000001,lyrs=m&x={x}&y={y}&z={z}&s=Gal&apistyle=s.t%3A3|s.e%3Al|p.v%3Aoff',
                            subdomains: ['0', '1', '2', '3'],
                            retinaMode: true,
                            minZoom: 17,
                            maxZoom: 18,
                          ),
                            MarkerLayerOptions(markers: homeProvider.markers),
                        ]))
                  ],
                ),
                color: Colors.red,
              ),
              canAnimate
                  ? Positioned(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 190,
                        width: width,
                        child: Swiper(
                          controller: _swiperController,
                          // index: homeProvider.indexCarousel,
                          onTap: (index) async {
                            individualProvider.pointMapIndividual =
                                homeProvider.pointMaps[index];
                            _panelController.open();

                            PointMap point =
                                await _individualController.getPoint(
                                    homeProvider.pointMaps[index].id,
                                    homeProvider.pointMaps[index].latitude,
                                    homeProvider.pointMaps[index].longitude,
                                    homeProvider.pointMaps[index]);
                            individualProvider.pointMapIndividual = point;
                          },
                          onIndexChanged: (index) {
                            if (canAnimate) {
                              _mapController.move(
                                  LatLng(homeProvider.pointMaps[index].latitude,
                                      homeProvider.pointMaps[index].longitude),
                                  17);
                            }
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return CardSlide(homeProvider.pointMaps[index]);
                          },
                          itemCount: homeProvider.pointMaps.length,
                          viewportFraction: 0.7,
                          scale: 0.8,
                        ),
                      ),
                      bottom: 10,
                    )
                  : Container()
            ],
          ),
        ));
  }

  @override
  void afterFirstLayout(BuildContext context) {
    canAnimateSlide();
  }
}
