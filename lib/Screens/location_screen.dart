import 'package:flutter/material.dart';
import 'package:live_weather/Screens/city_screen.dart';
import 'package:live_weather/services/weather.dart';
import 'package:live_weather/utilities/constants.dart';
import 'package:live_weather/utilities/cards.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  String temp, icon, city, clouds;
  int pressure, id, humidity;
  double windspeed, temprature, feelslike;

  @override
  void initState() {
    super.initState();
    updateui(widget.locationweather);
  }

  void updateui(dynamic weatherdata) {
    setState(() {
      if (weatherdata == null) {
        temprature = 0;
        temp = '0';
        icon = 'error';
        city = '';
        id = 0;
        humidity = 0;
        clouds = 'unable to get location';
        windspeed = 0;
        feelslike = 0;
        pressure = 0;
        return 0;
      }
      temprature = weatherdata['main']['temp'];
      temp = temprature.round().toString();
      id = weatherdata['weather'][0]['id'];
      pressure = weatherdata['main']['pressure'];
      city = weatherdata['name'];
      icon = weatherModel.getWeatherIcon(id);
      windspeed = weatherdata['wind']['speed'];
      humidity = weatherdata['main']['humidity'];
      clouds = weatherdata['weather'][0]['description'];
      feelslike = weatherdata['main']['feels_like'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final String disp = weatherModel.getimage(temprature.toInt());
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('$disp'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.5), BlendMode.dstATop))),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getlocationweather();
                      updateui(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50,
                    )),
                FlatButton(
                    onPressed: () async {
                      var typename = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => CityScreen()));
                      if (typename != null) {
                        var weatherdata =
                            await weatherModel.getcitylocation(typename);
                        updateui(weatherdata);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Text(
                    weatherModel.getWeatherIcon(id),
                    style: messagetxtstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        temp + '℃',
                        style: tempstyle,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(city, style: citystyle),
                    ],
                  ),
                  Text(
                    "feels like : " + feelslike.toStringAsFixed(0),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                clouds,
                textAlign: TextAlign.center,
                style: messagetxtstyle,
              ),
            ),
            Cards(
              pressure: pressure,
              windspeed: windspeed,
              humidity: humidity,
            )
          ],
        ),
      ),
    ));
  }
}
