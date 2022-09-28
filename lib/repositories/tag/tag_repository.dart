import 'package:blue/services/tag/tag_service_contract.dart';

import '../../models/tag/tag.dart';

class TagRepository{
  final ITagService _tagService;



  Future<List<Tag>> getTags(){
    return _tagService.getTags();
  }

  const TagRepository({
    required ITagService tagService,
  }) : _tagService = tagService;
}