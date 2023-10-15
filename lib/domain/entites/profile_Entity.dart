class ProfileEntity {
  final AppBarEntity appBarModel;
  final AccountStatsEntity accountStatsModel;

  ProfileEntity({
    required this.appBarModel,
    required this.accountStatsModel,
  });

  factory ProfileEntity.fromJson({required Map<String, dynamic> json}) {
    return ProfileEntity(
      appBarModel: AppBarEntity.fromJson(json: json["appbar"]),
      accountStatsModel:
          AccountStatsEntity.fromJson(json: json['accountStats']),
    );
  }
}

class AppBarEntity {
  final double rating;
  final String? img;
  final String name;
  final String id;

  AppBarEntity({
    required this.rating,
    this.img,
    required this.name,
    required this.id,
  });

  factory AppBarEntity.fromJson({required Map<String, dynamic> json}) {
    return AppBarEntity(
      rating: json["rating"],
      name: json["name"],
      id: json["id"],
      img: json["img"],
    );
  }
}

class AccountStatsEntity {
  final double balance;
  final double lastProfit;
  final int deliveredOrders;

  AccountStatsEntity({
    required this.balance,
    required this.lastProfit,
    required this.deliveredOrders,
  });

  factory AccountStatsEntity.fromJson({required Map<String, dynamic> json}) {
    return AccountStatsEntity(
      balance: double.parse(json["balance"]),
      lastProfit: json["lastProfit"],
      deliveredOrders: json["deliveredOrders"],
    );
  }
}

class ProfileSettingsEntity {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String? imgUrl;

  ProfileSettingsEntity({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    this.imgUrl,
  });

  factory ProfileSettingsEntity.fromJson({required Map<String, dynamic> json}) {
    return ProfileSettingsEntity(
      firstName: json["firstName"],
      lastName: json["lastName"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      imgUrl: json["imgUrl"],
    );
  }
}
