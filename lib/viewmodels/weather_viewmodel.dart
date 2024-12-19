import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_api_service.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherApiService _apiService = WeatherApiService();
  WeatherModel? weather;
  bool isLoading = false;

  Future<void> getWeather(String city) async {
    isLoading = true;
    notifyListeners();

    try {
      weather = await _apiService.fetchWeather(city);
    } catch (e) {
      debugPrint('Error fetching weather: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
