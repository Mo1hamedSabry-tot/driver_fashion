import 'package:flutter/material.dart';
import 'package:test_project/app/core/utils/value_managers/app_strings.dart';
import 'package:test_project/view/parcels/organisms/parcels_or_empty_organism.dart';

import '../../app/components/templates/deliveries_history_template.dart';
import '../../domain/entites/parcel_entity.dart';

class ParcelsHistoryScreen extends StatefulWidget {
  const ParcelsHistoryScreen({super.key});

  @override
  State<ParcelsHistoryScreen> createState() => _ParcelsHistoryScreenState();
}

class _ParcelsHistoryScreenState extends State<ParcelsHistoryScreen> {
  late Map<String, dynamic> json;
  // List<ParcelModel> activeOrders = [];
  List<ParcelEntity> parcels = [];

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
      parcels.add(ParcelEntity.fromJson(json: json));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DeliveriesHistoryTemplate(
      title: AppStrings.parcelsHistory,
      child: ParcelsOrEmptyOrganism(
        parcels: parcels,
        isntHistory: false,
      ),
    );
  }
}
