import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsEntity {
  final String id;
  final String createdAt;
  final num totalPrice;
  final num deliveryFee;
  final num distance;
  final String? note;
  final String? updatedAt;
  final String status;
  // bool isApproved;
  final AddressEntity address;
  final UserEntity customer;
  final ShopEntity shop;
  final TransactionEntity transaction;
  final LocationEntity location;
  final List<ProductEntity> products;

  OrderDetailsEntity({
    required this.id,
    required this.createdAt,
    required this.totalPrice,
    required this.deliveryFee,
    required this.customer,
    required this.address,
    required this.shop,
    required this.transaction,
    required this.distance,
    required this.products,
    // required this.isApproved,
    this.note,
    this.updatedAt,
    required this.location,
    required this.status,
  });

  factory OrderDetailsEntity.fromJson({required Map<String, dynamic> json}) {
    List<ProductEntity> products = [];

    for (final productJson in json["products"]) {
      final product = ProductEntity.fromJson(json: productJson);
      products.add(product);
    }

    return OrderDetailsEntity(
      // title: json['title'],
      id: json['id'],
      createdAt: json["createdAt"],
      totalPrice: json["totalPrice"],
      deliveryFee: json["deliveryFee"],
      customer: UserEntity.fromJson(json: json["user"]),
      address: AddressEntity.fromJson(json: json["adress"]),
      shop: ShopEntity.fromJson(json: json["shop"]),
      transaction: TransactionEntity.fromJson(json: json["transaction"]),
      distance: json["distance"],
      note: json["note"],
      updatedAt: json["updatedAt"],
      // isApproved: json["current"],
      location: LocationEntity.fromJson(json: json['location']),
      products: products, status: '',
    );
  }
}

class AddressEntity {
  final String address;
  final String? house;
  final String? office;
  final String? floor;

  AddressEntity({required this.address, this.house, this.office, this.floor});

  factory AddressEntity.fromJson({required Map<String, dynamic> json}) {
    return AddressEntity(
      address: json['adress'],
      house: json['house'],
      office: json['office'],
      floor: json['floor'],
    );
  }
}

class UserEntity {
  final String img;
  final String firstName;
  final String phone;

  UserEntity({required this.firstName, required this.phone, required this.img});

  factory UserEntity.fromJson({required Map<String, dynamic> json}) {
    return UserEntity(
      firstName: json['firstName'],
      phone: json['phone'],
      img: json['img'],
    );
  }
}

class ShopEntity {
  final String title;
  String? logoImg;
  final String? phone;
  final LocationEntity location;

  ShopEntity(
      {required this.title, this.logoImg, this.phone, required this.location});

  factory ShopEntity.fromJson({required Map<String, dynamic> json}) {
    return ShopEntity(
      title: json['title'],
      logoImg: json['logoImg'],
      phone: json['phone'],
      location: LocationEntity.fromJson(json: json['location']),
    );
  }
}

class LocationEntity {
  final LatLng latLng;

  const LocationEntity({required this.latLng});

  factory LocationEntity.fromJson({required Map<String, dynamic> json}) {
    return LocationEntity(latLng: LatLng(json['lat'], json['lng']));
  }
}

class TransactionEntity {
  final String tag;

  TransactionEntity({required this.tag});

  factory TransactionEntity.fromJson({required Map<String, dynamic> json}) {
    return TransactionEntity(tag: json['tag']);
  }
}

class ProductEntity {
  final String title;
  final int quantity;
  final String unitTitle;
  final String description;
  final num totalPrice;

  ProductEntity({
    required this.title,
    required this.quantity,
    required this.unitTitle,
    required this.description,
    required this.totalPrice,
  });

  factory ProductEntity.fromJson({required Map<String, dynamic> json}) {
    return ProductEntity(
      title: json["title"],
      quantity: json["interval"],
      unitTitle: json["unitTitle"],
      description: json["description"],
      totalPrice: json["totalPrice"],
    );
  }
}
