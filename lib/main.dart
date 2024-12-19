import 'package:flutter/material.dart';
import 'package:my_weather_app/viewmodels/task_viewmodel.dart';
import 'package:my_weather_app/viewmodels/weather_viewmodel.dart';
import 'package:my_weather_app/views/home_screen.dart';
import 'package:my_weather_app/views/weather_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherViewModel()),
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
      ],
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
