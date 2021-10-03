import 'package:characters_app/app/core/entities/image.dart';
import 'package:characters_app/app/core/entities/response_data.dart';
import 'package:characters_app/app/features/comics/domain/entities/comic.dart';
import 'package:characters_app/app/features/comics/domain/repositories/comics_repository.dart';
import 'package:characters_app/app/features/comics/domain/usecases/get_comics.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockComicsRepository extends Mock implements ComicsRepository {}

void main() {
  late GetComics usecase;
  late MockComicsRepository mockComicsRepository;

  setUp(() {
    mockComicsRepository = MockComicsRepository();
    usecase = GetComics(mockComicsRepository);
  });

  const characterId = 0;
  final params = GetComicsParams(characterId: characterId);

  final tThumbnail = Image(
    path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
    extension: "jpg",
  );
  final tComics = List<Comic>.from(
    [
      Comic(
        id: 1011334,
        description: "Test",
        thumbnail: tThumbnail,
        images: [tThumbnail, tThumbnail],
        title: 'Comic 1',
        variantDescription: 'Comic 1 variantDescription',
      ),
    ],
  );
  final tResponseComicsModel = ResponseData(
    haveMore: false,
    result: tComics,
  );

  test('should get the comics from the repository', () async {
    when(
      () => mockComicsRepository.getComics(
        offset: params.offset,
        characterId: characterId,
      ),
    ).thenAnswer((_) async => Right(tResponseComicsModel));

    final result = await usecase(params);

    expect(result, Right(tResponseComicsModel));
    verify(
      () => mockComicsRepository.getComics(
        offset: params.offset,
        characterId: characterId,
      ),
    );
    verifyNoMoreInteractions(mockComicsRepository);
  });
}
