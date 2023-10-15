import '../../../../domain/profile/entites/account_stats_entity.dart';
import '../../models/dummy_models/account_stats.dart';

extension ToDomain on AccountStatsModel {
  AccountStatsEntity toDomain() {
    return AccountStatsEntity(
      balance: balance,
      lastProfit: lastProfit ?? 0,
      deliveredOrders: deliveredOrders,
    );
  }
}
