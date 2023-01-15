class ModelCity {
  final String name;
  final int population;
  final String subject;

  ModelCity({
    required this.name,
    required this.population,
    required this.subject,
  });

  factory ModelCity.fromJson(Map<String, dynamic> json) {
    return ModelCity(
        name: json['name'],
        population: json['population'],
        subject: json['subject']);
  }
}
