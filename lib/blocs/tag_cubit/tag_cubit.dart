import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/tag/tag.dart';
import '../../repositories/tag/tag_repository.dart';

part 'tag_state.dart';

class TagCubit extends Cubit<TagState> {
  final TagRepository _tagRepository;

  Future<void> loadFavs() async{
    List<Tag> tags = await _tagRepository.getTags();
    emit(state.copyWith(tags: tags,status: FavStateStatus.loaded));
  }
  TagCubit({
    required TagRepository tagRepository,
  }) : _tagRepository = tagRepository, super(TagState.initial());
}
