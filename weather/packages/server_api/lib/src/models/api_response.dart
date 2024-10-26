import 'main_model.dart';
import 'weather.dart';

class ApiResponse{
  final Weather? weather ;
  final MainModel? main;

  ApiResponse({required this.weather, required this.main});

  factory ApiResponse.fromJson(Map<String,dynamic> j){
    var main=j["main"]!=null ?MainModel.fromJson(j["main"]) :null;
    var weather=j["weather"]!=null ?Weather.fromJson(j["weather"]) :null;
    return ApiResponse(weather: weather, main: main);
  }
}