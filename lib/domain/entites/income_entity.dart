class IncomeEntity {
  final LastOrderEntity lastOrderModel;
  final DelivermanTransctionsEntity delivermanTransctionsModel;
  final StatisticsEntity statisticsModel;

  IncomeEntity({
    required this.lastOrderModel,
    required this.delivermanTransctionsModel,
    required this.statisticsModel,
  });

  factory IncomeEntity.fromJson({required Map<String, dynamic> json}) {
    return IncomeEntity(
      lastOrderModel: LastOrderEntity.fromJson(json: json["lastOrder"]),
      delivermanTransctionsModel: DelivermanTransctionsEntity.fromJson(
          json: json["delivermanTransctions"]),
      statisticsModel: StatisticsEntity.fromJson(json: json["statistics"]),
    );
  }
}

class LastOrderEntity {
  final double lastOrderPrice;
  final double lastIncome;

  LastOrderEntity({
    required this.lastOrderPrice,
    required this.lastIncome,
  });

  factory LastOrderEntity.fromJson({required Map<String, dynamic> json}) {
    return LastOrderEntity(
      lastOrderPrice: json["price"],
      lastIncome: json["income"],
    );
  }
}

class DelivermanTransctionsEntity {
  final double wallet;
  final double rating;

  DelivermanTransctionsEntity({
    required this.wallet,
    required this.rating,
  });

  factory DelivermanTransctionsEntity.fromJson(
      {required Map<String, dynamic> json}) {
    return DelivermanTransctionsEntity(
      wallet: json["wallet"],
      rating: json["rating"],
    );
  }
}

class StatisticsEntity {
  final TotalOrdersEntity totalOrders;
  final OrdersSubCategoryEntity acceptedOrders;
  final OrdersSubCategoryEntity rejectedOrders;
  final OrdersSubCategoryEntity completedOrders;
  final OrdersSubCategoryEntity newOrders;

  StatisticsEntity({
    required this.totalOrders,
    required this.acceptedOrders,
    required this.rejectedOrders,
    required this.completedOrders,
    required this.newOrders,
  });

  factory StatisticsEntity.fromJson({required Map<String, dynamic> json}) {
    return StatisticsEntity(
      totalOrders: TotalOrdersEntity.fromJson(json: json["totalOrders"]),
      acceptedOrders:
          OrdersSubCategoryEntity.fromJson(json: json["acceptedOrders"]),
      rejectedOrders:
          OrdersSubCategoryEntity.fromJson(json: json["rejectedOrders"]),
      completedOrders:
          OrdersSubCategoryEntity.fromJson(json: json["completedOrders"]),
      newOrders: OrdersSubCategoryEntity.fromJson(json: json["newOrders"]),
    );
  }
}

class TotalOrdersEntity {
  final int totalOrdersCount;
  final int todaysOrdersCount;

  TotalOrdersEntity({
    required this.totalOrdersCount,
    required this.todaysOrdersCount,
  });

  factory TotalOrdersEntity.fromJson({required Map<String, dynamic> json}) {
    return TotalOrdersEntity(
      totalOrdersCount: json['totalOrders'],
      todaysOrdersCount: json["todaysOrders"],
    );
  }
}

class OrdersSubCategoryEntity {
  final int count;
  final double prc;

  OrdersSubCategoryEntity({
    required this.count,
    required this.prc,
  });

  factory OrdersSubCategoryEntity.fromJson(
      {required Map<String, dynamic> json}) {
    return OrdersSubCategoryEntity(
      count: json['count'],
      prc: json["prc"],
    );
  }
}
