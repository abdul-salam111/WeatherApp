import 'package:flutter/material.dart';
import 'package:live_weather/Screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:live_weather/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void get_current_location_data() async {
    var weatherdata = await WeatherModel().getlocationweather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationweather: weatherdata);
    }));
  }

  @override
  void initState() {
    super.initState();
    get_current_location_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.blue,
          size: 100,
        ),
      ),
    );
  }
}
