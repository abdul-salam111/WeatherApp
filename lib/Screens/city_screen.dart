import 'package:flutter/material.dart';
import 'package:live_weather/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image(
              image: AssetImage('images/city.jpg'),
              fit: BoxFit.cover,
            ),
            constraints: BoxConstraints.expand(),
          ),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: inputdecorationn,
                      onChanged: (val) {
                        cityname = val;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 80),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context, cityname);
                      },
                      child: Text(
                        'Get Weather',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
