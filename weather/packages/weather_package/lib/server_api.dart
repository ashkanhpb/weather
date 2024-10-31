import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'src/models/models.dart';

class WeatherApi {
  final String apiKey;
  final http.Client client;

  // Inject http.Client via constructor
  WeatherApi(this.apiKey, {http.Client? client})
      : client = client ?? http.Client();

  Future<ApiResponse> weatherByCity(String cityName) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric',
    );

    try {
      // Make the HTTP GET request with the provided client
      final response = await client.get(url);
      developer.log("Response status: ${response.statusCode}", name: 'WeatherService');
      developer.log("Response body: ${response.body}", name: 'WeatherService');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final apiResponse = ApiResponse.fromJson(data);
        developer.log(data);
        return apiResponse;
      } else {
        developer.log(
          "Error: HTTP ${response.statusCode} - ${response.reasonPhrase}",
          name: 'WeatherService',
          level: 1000,
        );
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      developer.log("Exception during fetch: $error", name: 'WeatherService', level: 1000);
      rethrow;
    } finally {
      client.close(); // Closes the client to free resources if not reused
    }
  }
}

