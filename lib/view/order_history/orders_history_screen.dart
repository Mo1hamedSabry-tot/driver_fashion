import 'package:flutter/material.dart';
import 'package:test_project/app/components/organisms/orders_or_empty_organism.dart';
import 'package:test_project/app/core/utils/value_managers/app_strings.dart';
import 'package:test_project/view/orders/bloc/orders_bloc.dart';

import '../../app/components/templates/deliveries_history_template.dart';
import '../../domain/entites/order_details_entity.dart';

class OrdersHistoryScreen extends StatefulWidget {
  const OrdersHistoryScreen({super.key});

  @override
  State<OrdersHistoryScreen> createState() => _OrdersHistoryScreenState();
}

class _OrdersHistoryScreenState extends State<OrdersHistoryScreen> {
  late Map<String, dynamic> json;
  List<OrderDetailsEntity> orders = [];

  @override
  void initState() {
    super.initState();
    // fetch().then((value) => null);
    json = {
      "title": "order",
      "id": "order ID",
      "createdAt": "2023-09-24T07:11:36.3024115Z",
      "totalPrice": 200,
      "deliveryFee": 10,
      "distance": 20,
      "current": true,
      "note": "don't be late",
      "location": {
        "lat": 1234.9,
        "lng": 12.0,
      },
      "user": {
        "id": "userID",
        "img":
            "https://th.bing.com/th/id/OIP.IbA5TZAIWjSdJCfZRZayTAAAAA?pid=ImgDet&rs=1",
        "firstName": "AbuAlhamd",
        "phone": "0000000000"
      },
      "shop": {
        "title": "shop",
        "logoImg":
            "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/gold-roman-imperial-eagle-s-p-q-r-special-edition-over-red-velvet-serge-averbukh.jpg",
        "phone": "7558989",
        "location": {
          "lat": 1234.9,
          "lng": 12.0,
        }
      },
      "adress": {
        "adress": "adress",
        "house": "house",
        "office": "office",
        "floor": "floor",
      },
      "transaction": {
        "tag": "tag",
      },
      "products": [
        {
          "title": "Brandeul",
          "interval": 10,
          "unitTitle": "pc",
          "description": "description",
          "totalPrice": 100,
        },
        {
          "title": "Ratatue",
          "interval": 1,
          "unitTitle": "pc",
          "description": "description",
          "totalPrice": 200,
        }
      ]
    };
    for (int i = 0; i < 5; i++) {
      // activeOrders.add(OrderModel.fromJson(json: json));
      orders.add(OrderDetailsEntity.fromJson(json: json));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DeliveriesHistoryTemplate(
      title: AppStrings.ordersHistory,
      child: OrdersOrEmptyOrganism(
        orders: orders,
        isntHistory: false,
        changeOrderStatusEvent: ChangeOrderStatusEvents.pickup,
      ),
    );
  }
}
