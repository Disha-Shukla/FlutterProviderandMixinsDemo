import 'package:flutter/material.dart';
import 'package:my_weather_app/views/task_screen.dart';
import 'package:my_weather_app/views/weather_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multi-Feature App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherScreen()),
                );
              },
              child: Text('Weather App'),
            ),
            SizedBox(height: 20), // Spacer between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskScreen()),
                );
              },
              child: Text('Task Management App'),
            ),
          ],
        ),
      ),
    );
  }
}
