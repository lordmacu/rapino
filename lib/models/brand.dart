import 'dart:typed_data';

class Brand {
  late String _id;
  late String _logo;
  late String _name;
  late bool _is_available;
  late String _description;

  bool get is_available => _is_available;

  set is_available(bool value) {
    _is_available = value;
  }

  late Uint8List _imageFormated;

  @override
  String toString() {
    return 'Brand{_id: $_id, _logo: $_logo, _name: $_name, _is_available: $_is_available, _description: $_description, _imageFormated: $_imageFormated}';
  }

  Uint8List get imageFormated => _imageFormated;

  set imageFormated(Uint8List value) {
    _imageFormated = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get logo => _logo;

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  set logo(String value) {
    _logo = value;
  }

  Brand(
      this._id, this._logo, this._name, this._is_available, this._description);
}
