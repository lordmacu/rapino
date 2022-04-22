import 'package:flutter/material.dart';
import 'package:rapino/models/point.dart';

class CardSlide extends StatelessWidget {
  final PointMap _pointMap;
  const CardSlide(this._pointMap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                _pointMap.brand.logo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Text(
              _pointMap.brand.name,
              style: const TextStyle(
                  color: Color(0xff8f87a6),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            margin: const EdgeInsets.only(top: 5),
          )
        ],
      ),
    );
  }
}
