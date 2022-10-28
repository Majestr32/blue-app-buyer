import '../../models/local_coupon_history/local_coupon_history.dart';

abstract class IDataSource{
  Future<LocalCouponHistory> addCouponToHistory(LocalCouponHistory history);
  Future<List<LocalCouponHistory>> getCouponsHistory(int offset, int count);
}