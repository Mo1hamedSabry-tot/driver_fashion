class ParcelEntity {
  final int id;
  final AddressEntity originAddress;
  final String originPhone;
  final String originUsername;
  final AddressEntity destinationAddress;
  final String destinationPhone;
  final String destinationUsername;
  final String currencySymbol;
  final num totalPrice;
  final String createdAt;
  final String? updatedAt;

  ParcelEntity({
    required this.id,
    required this.originAddress,
    required this.originUsername,
    required this.destinationAddress,
    required this.currencySymbol,
    required this.totalPrice,
    required this.createdAt,
    required this.destinationPhone,
    required this.destinationUsername,
    required this.originPhone,
    this.updatedAt,
  });

  factory ParcelEntity.fromJson({required Map<String, dynamic> json}) {
    return ParcelEntity(
      id: json["id"],
      originAddress: AddressEntity.fromJson(json: json["originAddress"]),
      originUsername: json["originUsername"],
      destinationAddress:
          AddressEntity.fromJson(json: json["destinationAddress"]),
      currencySymbol: json["currencySymbol"],
      totalPrice: json["totalPrice"],
      createdAt: json["createdAt"],
      destinationPhone: json["destinationPhone"],
      destinationUsername: json["destinationUsername"],
      originPhone: json["originPhone"],
      updatedAt: json["updatedAt"],
    );
  }
}

class AddressEntity {
  final String address;
  final double lat;
  final double lng;

  AddressEntity({required this.address, required this.lat, required this.lng});

  factory AddressEntity.fromJson({required Map<String, dynamic> json}) {
    return AddressEntity(
      address: json['address'],
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
