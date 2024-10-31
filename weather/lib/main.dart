import 'package:flutter/material.dart';
import 'package:weather_package/weather_package.dart';
import 'dart:developer' as developer;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

final weather = WeatherApi('ff2f6cbfaf9727c01857aaae6f767a96');
developer.log("Starting to fetch weather data...");
  // try {
    final weatherData = await weather.weatherByCity('London');
    // ignore: avoid_developer.log
    developer.log("Weather: ${weatherData.weather?.main}");
    developer.log("Description: ${weatherData.weather?.description}");
    developer.log("Temperature: ${weatherData.main?.temp}°C");
    developer.log("Humidity: ${weatherData.main?.humidity}%");
  // } catch (e) {
  //   developer.log("Error: $e");
  // }

 // runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
        
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'آب و هوا'),
//     );
//   }
// }

