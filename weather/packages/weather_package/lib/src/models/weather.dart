class Weather{
  final String? main;
  final String? description;

  Weather({required this.main, required this.description});

  factory Weather.fromJson(Map<String,String> j){
    return Weather(main: j["main"], description: j["description"]);
  }

}