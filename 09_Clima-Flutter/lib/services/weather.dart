import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "e59964ef00d45dafb668b3bb34f98530";
const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather?";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = "$openWeatherMapURL"
        "&q=$cityName"
        "&units=metric"
        "&appid=$apiKey";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url: "$openWeatherMapURL"
            "lat=${location.latitude}"
            "&lon=${location.longitude}"
            "&units=metric"
            "&appid=$apiKey");
    return await networkHelper.getData();
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

//
//double temperature = weatherData['main']['temp'];
//int condition = weatherData['weather'][0]['id'];
//String cityName = weatherData['name'];
