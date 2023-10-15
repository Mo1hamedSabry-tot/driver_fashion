import 'package:flutter/material.dart';
import 'package:test_project/app/core/utils/value_managers/app_strings.dart';
import 'package:test_project/domain/entites/parcel_entity.dart';

import '../../app/components/templates/deliveries_template.dart';
import 'organisms/parcels_or_empty_organism.dart';

class ParcelsScreen extends StatefulWidget {
  const ParcelsScreen({super.key});

  @override
  State<ParcelsScreen> createState() => _ParcelsScreenState();
}

class _ParcelsScreenState extends State<ParcelsScreen>
    with SingleTickerProviderStateMixin {
  late Map<String, dynamic> json;
  List<ParcelEntity> activeParcels = [];
  List<ParcelEntity> availableParcels = [];

  @override
  void initState() {
    super.initState();
    // fetch().then((value) => null);
    json = {
      "id": 111,
      "originPhone": "0100000000",
      "originUsername": "originUsername",
      "originAddress": {
        "address": "originalAddress",
        "lat": 84870.1,
        "lng": 11034.2
      },
      "destinationPhone": "020000000",
      "destinationUsername": "destinationUsername",
      "destinationAddress": {
        "address": "destinationAddress",
        "lat": 84870.1,
        "lng": 11034.2
      },
      "currencySymbol": "\$",
      "totalPrice": 1000,
      "createdAt": "2022-01-01 12:34:56.789"
    };

    for (int i = 0; i < 5; i++) {
      // activeOrders.add(OrderModel.fromJson(json: json));
      availableParcels.add(ParcelEntity.fromJson(json: json));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DeliveriesTemplate(
      //TODO
      count: 0,
      title: AppStrings.parcelsTitle,
      activeTitle: AppStrings.activeParcels,
      availableTitle: AppStrings.availableParcels,
      activeWidget: ParcelsOrEmptyOrganism(
        parcels: activeParcels,
      ),
      availableWidget: ParcelsOrEmptyOrganism(
        parcels: availableParcels,
      ),
    );
  }
}
