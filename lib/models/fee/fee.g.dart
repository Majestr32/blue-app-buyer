// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Fee _$$_FeeFromJson(Map<String, dynamic> json) => _$_Fee(
      serviceFee: (json['service_fee'] as num).toDouble(),
      commission: (json['commission'] as num).toDouble(),
    );

Map<String, dynamic> _$$_FeeToJson(_$_Fee instance) => <String, dynamic>{
      'service_fee': instance.serviceFee,
      'commission': instance.commission,
    };
