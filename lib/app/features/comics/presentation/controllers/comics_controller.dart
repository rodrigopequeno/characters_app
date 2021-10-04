import 'package:mobx/mobx.dart';

import '../../../../core/controllers/infinite_paging_controller.dart';
import '../../domain/entities/comic.dart';
import '../../domain/usecases/get_comics.dart';

part 'comics_controller.g.dart';

class ComicsController = _ComicsControllerBase with _$ComicsController;

abstract class _ComicsControllerBase
    extends InfinitePagingController<Comic, GetComicsParams> with Store {
  final int characterId;
  final GetComics getComics;

  _ComicsControllerBase({
    required this.characterId,
    required this.getComics,
  });

  @computed
  List<Comic> get comics => List<Comic>.from(objects);

  Future<void> loadComics({bool isRefresh = false}) => loadObjects(
        usecase: getComics,
        params: GetComicsParams(characterId: characterId),
        isRefresh: isRefresh,
      );

  Future<void> loadNextComics() => loadNextObjects(
        usecase: getComics,
        params: GetComicsParams(characterId: characterId, next: true),
      );
}
