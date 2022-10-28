import 'dart:developer';

import 'package:blue/models/local_coupon_history/local_coupon_history.dart';
import 'package:sqflite/sqflite.dart';

import 'data_source_contract.dart';

class SqfliteDataSource implements IDataSource{
  final Database _db;

  const SqfliteDataSource(this._db);

  @override
  Future<LocalCouponHistory> addCouponToHistory(LocalCouponHistory history) async{
      final id = await _db.insert('history', history.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace);
      final rows = await _db.query('history',where: 'id = ?', whereArgs: [id], limit: 1);
      return LocalCouponHistory.fromJson(rows.first);
  }

  @override
  Future<List<LocalCouponHistory>> getCouponsHistory(int offset, int count) async{
    final rows = await _db.query('history',limit: count, offset: offset, orderBy: 'created_at DESC');
    return rows.map((e) => LocalCouponHistory.fromJson(e)).toList();
  }

}