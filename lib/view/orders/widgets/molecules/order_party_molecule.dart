import 'package:test_project/view/orders/widgets/molecules/order_party_image_molecule.dart';

import '../../../../app/components/molecules/image_title_subtitle_molecule.dart';

class OrderPartyMolecule extends ITSMolecule {
  OrderPartyMolecule({
    super.key,
    String? img,
    required super.title,
    required super.subTitle,
    super.extraDetail,
  }) : super(
          img: OrderPartyImageMolecule(img: img),
        );
}
