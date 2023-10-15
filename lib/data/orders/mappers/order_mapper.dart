import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../app/core/utils/value_managers/assets_manager.dart';
import '../../../domain/entites/order_details_entity.dart';
import '../models/order_model.dart';

extension ToDomain on TOTOrderModel {
  OrderDetailsEntity toDomain() {
    List<ProductEntity> products = [];

    for (final item in items!) {
      products.add(
        ProductEntity(
            title: item.name ?? "product name",
            quantity: item.quantity ?? 0,
            unitTitle: item.currency ?? "pc",
            description: "description", //item.comment,
            totalPrice: item.extendedPriceWithTax ?? 120),
      );
    }

    return OrderDetailsEntity(
        id: id,
        // isApproved: isApproved ?? false,
        status: status ?? "Created",
        createdAt: createdDate,
        totalPrice: sum,
        deliveryFee: fee ?? 0.0,
        customer: UserEntity(
            firstName: (customerName != null && customerName!.isNotEmpty)
                ? customerName!
                : "Customer name",
            phone: "02020202020",
            img: ImgManager.defaultProfileImg),
        address: AddressEntity(address: "Giza"),
        shop: ShopEntity(
            title: storeName ?? "Pharmacy name",
            location: const LocationEntity(latLng: LatLng(0, 0))),
        transaction: TransactionEntity(tag: "tag"),
        distance: 200,
        products: products,
        location: LocationEntity(latLng: LatLng(0.1, 0)));
  }
}
