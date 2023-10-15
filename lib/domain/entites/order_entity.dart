// class OrderEntity {
//   final String title;
//   final String id;
//   final String createdAt;
//   final num totalPrice;
//   final num deliveryFee;
//   final AddressEntity address;
//   final UserEntity user;
//   final ShopEntity shop;

//   OrderEntity({
//     required this.title,
//     required this.id,
//     required this.createdAt,
//     required this.totalPrice,
//     required this.deliveryFee,
//     required this.user,
//     required this.address,
//     required this.shop,
//   });

//   factory OrderEntity.fromJson({required Map<String, dynamic> json}) {
//     return OrderEntity(
//       title: json['title'],
//       id: json['id'],
//       createdAt: json["createdAt"],
//       totalPrice: json["totalPrice"],
//       deliveryFee: json["deliveryFee"],
//       user: UserEntity.fromJson(json: json["user"]),
//       address: AddressEntity.fromJson(json: json["adress"]),
//       shop: ShopEntity.fromJson(json: json["shop"]),
//     );
//   }
// }

// class AddressEntity {
//   final String address;

//   AddressEntity({required this.address});

//   factory AddressEntity.fromJson({required Map<String, dynamic> json}) {
//     return AddressEntity(address: json['adress']);
//   }
// }

// class UserEntity {
//   final String img;
//   final String firstName;
//   final String phone;

//   UserEntity({required this.firstName, required this.phone, required this.img});

//   factory UserEntity.fromJson({required Map<String, dynamic> json}) {
//     return UserEntity(
//       firstName: json['firstName'],
//       phone: json['phone'],
//       img: json['img'],
//     );
//   }
// }

// class ShopEntity {
//   final String title;
//   String? logoImg;

//   ShopEntity({required this.title, this.logoImg});

//   factory ShopEntity.fromJson({required Map<String, dynamic> json}) {
//     return ShopEntity(
//       title: json['title'],
//       logoImg: json['logoImg'],
//     );
//   }
// }
