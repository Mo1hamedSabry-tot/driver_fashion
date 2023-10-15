class AccountStatsModel {
  final String balance;
  final double? lastProfit;
  final int deliveredOrders;

  AccountStatsModel(
      {required this.balance, this.lastProfit, required this.deliveredOrders});

  factory AccountStatsModel.fromJson({required Map<String, dynamic> json}) {
    return AccountStatsModel(
      balance: json['balance'],
      deliveredOrders: json['delivered_orders'],
      lastProfit: json['last_profit'],
    );
  }
}
