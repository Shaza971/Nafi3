class DonationModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final String location;
  final String userId;

  DonationModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.location,
    required this.userId,
  });

  factory DonationModel.fromJson(
      Map<String, dynamic> json, String id) {
    return DonationModel(
      id: id,
      title: json["title"],
      category: json["category"],
      description: json["description"],
      location: json["location"],
      userId: json["userId"],
    );
  }
}