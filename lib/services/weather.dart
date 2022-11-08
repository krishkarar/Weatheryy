import 'package:weatheryy/services/location.dart';
import 'package:weatheryy/services/networking.dart';

const apiKey = 'ad7b4c8cda57492c3d3460cf9daf117e';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<Future> getCityWeather(String cityName) async{
    var url = '$openWeatherURL?q=$cityName&appid=$apiKey&units=metric';

    networkingHelper networkHelp = networkingHelper(url);

    var weatherData = networkHelp.getData();

    return weatherData;
  }

  Future<Future> getLocationWeather() async{
    location loc = location();

    await loc.getCurrentLocation();

    networkingHelper networkHelp = networkingHelper('$openWeatherURL?lat=${loc.latitude}'
        '&lon=${loc.longitude}&appid=$apiKey&units=metric');

    var weatherData =  networkHelp.getData();

    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
