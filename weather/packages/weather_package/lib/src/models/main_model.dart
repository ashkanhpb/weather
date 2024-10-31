class MainModel{
  final String? temp;
  final String? humidity;

  MainModel({required this.temp, required this.humidity});
  
  factory MainModel.fromJson(Map<String , String> j){
    return MainModel(temp: j["temp"], humidity: j["humidity"]);
  }
}