import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherApiService {
  final Dio _dio = Dio();

  Future<WeatherModel> fetchWeather(String city) async {
    const apiKey = 'APIKey';
    const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

    final response = await _dio.get(baseUrl,
        queryParameters: {'q': city, 'appid': apiKey, 'units': 'metric'});

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}
