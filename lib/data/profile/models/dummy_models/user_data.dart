class UserModel {
  final String name;
  final String id;
  final String? imgUrl;
  final double? rating;
  final String? phoneNumber;

  UserModel({
    required this.name,
    required this.id,
    this.imgUrl,
    this.rating,
    this.phoneNumber,
  });

  factory UserModel.fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      name: json["name"],
      id: json["id"],
      imgUrl: json["img_url"],
      rating: json["rating"],
      phoneNumber: json["phone_number"],
    );
  }
}
