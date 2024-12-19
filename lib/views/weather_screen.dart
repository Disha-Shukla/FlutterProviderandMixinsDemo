import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/weather_viewmodel.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = Provider.of<WeatherViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final city = _cityController.text.trim();
                if (city.isNotEmpty) {
                  weatherViewModel.getWeather(city);
                }
              },
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 16),
            weatherViewModel.isLoading
                ? const CircularProgressIndicator()
                : weatherViewModel.weather != null
                    ? Column(
                        children: [
                          Text(
                            'City: ${weatherViewModel.weather!.cityName}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Temperature: ${weatherViewModel.weather!.temperature}°C',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Description: ${weatherViewModel.weather!.description}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      )
                    : const Text('No data available'),
          ],
        ),
      ),
    );
  }
}
