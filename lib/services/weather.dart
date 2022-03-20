import 'package:live_weather/services/location.dart';
import 'package:live_weather/services/networking.dart';

const openweathermap = 'https://api.openweathermap.org/data/2.5/weather';
const apikey = 'e2d60d2b70d13edaf060c8319638f526';

class WeatherModel {
  Future<dynamic> getcitylocation(String cityname) async {
    var url = '$openweathermap?q=$cityname&appid=$apikey&units=metric';
    NetworkHelper network = NetworkHelper(url);
    var citydata = await network.GetData();
    return citydata;
  }

  Future<dynamic> getlocationweather() async {
    Location location = Location();
    await location.getlocation();
    NetworkHelper network = NetworkHelper(
        '$openweathermap?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherdata = await network.GetData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition >= 200 && condition <= 300) {
      return '⛈️';
    } else if (condition >= 301 && condition <= 400) {
      return '🌦';
    } else if (condition > 401 && condition <= 500) {
      return '🌧';
    } else if (condition >= 501 && condition <= 600) {
      return '🌨';
    } else if (condition >= 601 && condition <= 700) {
      return '🌨';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getimage(int temp) {
    if (temp > 25) {
      return ('images/1.jpg');
    } else if (temp > 20) {
      return ('images/2.jpg');
    } else if (temp < 10) {
      return ('images/3.jpg');
    } else {
      return ('images/weather.jpg');
    }
  }
}
