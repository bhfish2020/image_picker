class JobModel {
  int id;
  String image;
  String name;
  String description;
  double rating;
  double minHourly;
  double maxHourly;
  bool choice;

  JobModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.rating,
    required this.minHourly,
    required this.maxHourly,
    required this.choice,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      rating: double.parse(json['rating'].toString()),
      minHourly: double.parse(json['minimum_hourly'].toString()),
      maxHourly: double.parse(json['maximum_hourly'].toString()),
      choice: json['choice']==1?true:false,
    );
  }
}