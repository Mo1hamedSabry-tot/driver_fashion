class AccountStatsEntity {
  final String balance;
  final double lastProfit;
  final int deliveredOrders;

  AccountStatsEntity({
    required this.balance,
    required this.lastProfit,
    required this.deliveredOrders,
  });
}
