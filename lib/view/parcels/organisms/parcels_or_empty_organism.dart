import 'package:flutter/material.dart';
import 'package:test_project/view/parcels/organisms/parcel_card.dart';

import '../../../app/components/organisms/empty_organism.dart';
import '../../../domain/entites/parcel_entity.dart';

class ParcelsOrEmptyOrganism extends StatelessWidget {
  final bool isntHistory;
  final List<ParcelEntity> parcels;
  const ParcelsOrEmptyOrganism(
      {super.key, required this.parcels, this.isntHistory = true});

  @override
  Widget build(BuildContext context) {
    return (parcels.isNotEmpty)
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView.builder(
              itemCount: parcels.length,
              itemBuilder: (context, index) => ParcelCard(
                  parcelModel: parcels[index], isntHistory: isntHistory),
            ),
          )
        : const EmptyOrganism();
  }
}
