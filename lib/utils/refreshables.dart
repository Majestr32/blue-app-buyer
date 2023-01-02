import 'package:blue/blocs/auth_bloc/auth_bloc.dart';
import 'package:blue/blocs/commerce_cubit/commerce_cubit.dart';
import 'package:blue/blocs/coupon_cubit/coupon_cubit.dart';
import 'package:blue/blocs/searched_coupons_cubit/searched_coupons_cubit.dart';
import 'package:blue/blocs/tag_cubit/tag_cubit.dart';
import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> refreshUserData(BuildContext context){
  return context.read<UserCubit>().init(context.read<AuthBloc>().state);
}
Future<void> refreshSearchedResult(BuildContext context){
  return context.read<SearchedCouponsCubit>().loadCoupons();
}
Future<void> refreshStartCoupons(BuildContext context){
  return context.read<CouponCubit>().loadStartCoupons(context.read<UserCubit>().state.tagsIds);
}