class ForecastModel {
  final String name;
  final num temp;
  final String conditionText;
  final String conditionIcon;

  ForecastModel({
    required this.name,
    required this.temp,
    required this.conditionText,
    required this.conditionIcon,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      name: json['location']['name'],
      temp: json['current']['temp_c'],
      conditionText: json['current']['condition']['text'],
      conditionIcon: json['current']['condition']['icon'],
    );
  }
}
