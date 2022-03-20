import 'package:flutter/material.dart';
import 'constants.dart';

class Cards extends StatelessWidget {
  final int pressure;
  final double windspeed;
  final int humidity;
  Cards({this.pressure, this.windspeed, this.humidity});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          cards((pressure), 'Pressure', '🌡'),
          cards((windspeed).toInt(), 'WindSpeed', '💨'),
          cards(humidity, 'Humidity', '💧'),
        ],
      ),
    );
  }
}

Widget cards(int cardname, String title, String icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white38,
      ),
      width: 100,
      height: 150,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: cardheader,
          ),
          Text(
            icon,
            style: cardicon,
          ),
          Text(
            cardname.toString(),
            style: cardstyle,
          ),
        ],
      )),
    ),
  );
}
