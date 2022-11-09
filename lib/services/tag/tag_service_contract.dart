import 'package:blue/models/tag/tag.dart';

abstract class ITagService{
  Future<List<Tag>> getTags();
  Future<List<Tag>> getTagsWithCoupons();
}