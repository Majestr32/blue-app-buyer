import 'package:blue/consts/api.dart';
import 'package:blue/models/tag/tag.dart';
//import 'package:blue/models/fav/tag.dart';
import 'package:blue/services/tag/tag_service_contract.dart';
import 'package:dio/dio.dart';

class TagService implements ITagService{
  final Dio _dio;

  @override
  Future<List<Tag>> getTags() async{
    final response = await _dio.get(hostApi+"tags");
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => Tag.fromJson(e)).toList();
  }

  const TagService({
    required Dio dio,
  }) : _dio = dio;
}