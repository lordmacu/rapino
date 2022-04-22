import 'package:flutter/material.dart';
import 'package:rapino/models/point.dart';

class IndividualProvider with ChangeNotifier {
  late PointMap _pointMapIndividual = PointMap();

  PointMap get pointMapIndividual {
    return _pointMapIndividual;
  }

  set pointMapIndividual(PointMap value) {
    _pointMapIndividual = value;
    notifyListeners();
  }
}
