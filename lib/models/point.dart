
import 'package:rapino/models/brand.dart';

class PointMap {
  late String _id;
  late String _name;
  late String _address;
  late String _delivery_rate;
  late bool _is_available;
  late bool _accept_datafono;
  late bool _accept_creditcard;
  late bool _accept_cash;
  late bool _has_pickup;
  late bool _is_coming_soon;
  late bool _join_name;
  late double _latitude;
  late double _longitude;
  late bool _is_working;
  late bool _is_demo;
  late String _branchoffice_type;
  late bool _is_develop;
  late int _coverage_radio;
  late bool _is_featured;
  late Brand _brand;

  @override
  String toString() {
    return 'PointMap{_address: $_address}';
  }

  String _cover = "";
  late String _message;

  String get cover => _cover;

  set cover(String value) {
    _cover = value;
  }

  bool get is_featured => _is_featured;

  set is_featured(bool value) {
    _is_featured = value;
  }

  int get coverage_radio => _coverage_radio;

  set coverage_radio(int value) {
    _coverage_radio = value;
  }

  double get latitude => _latitude;

  set latitude(double value) {
    _latitude = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get delivery_rate => _delivery_rate;

  set delivery_rate(String value) {
    _delivery_rate = value;
  }

  bool get is_available => _is_available;

  set is_available(bool value) {
    _is_available = value;
  }

  bool get accept_datafono => _accept_datafono;

  set accept_datafono(bool value) {
    _accept_datafono = value;
  }

  bool get accept_creditcard => _accept_creditcard;

  set accept_creditcard(bool value) {
    _accept_creditcard = value;
  }

  bool get accept_cash => _accept_cash;

  set accept_cash(bool value) {
    _accept_cash = value;
  }

  bool get has_pickup => _has_pickup;

  set has_pickup(bool value) {
    _has_pickup = value;
  }

  bool get is_coming_soon => _is_coming_soon;

  set is_coming_soon(bool value) {
    _is_coming_soon = value;
  }

  bool get join_name => _join_name;

  set join_name(bool value) {
    _join_name = value;
  }

  bool get is_working => _is_working;

  set is_working(bool value) {
    _is_working = value;
  }

  bool get is_demo => _is_demo;

  set is_demo(bool value) {
    _is_demo = value;
  }

  String get branchoffice_type => _branchoffice_type;

  set branchoffice_type(String value) {
    _branchoffice_type = value;
  }

  bool get is_develop => _is_develop;

  set is_develop(bool value) {
    _is_develop = value;
  }

  Brand get brand => _brand;

  set brand(Brand value) {
    _brand = value;
  }

  double get longitude => _longitude;

  set longitude(double value) {
    _longitude = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }
}
