import 'package:dartz/dartz.dart';
import 'package:english_football_hashtag_generator/core/error/failure.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/entities/hashtag_data_entity.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/repositories/generate_hashtags_repository.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/usecases/generate_hashtags_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGenerateHashtagsRepository extends Mock
    implements GenerateHashTagsRepository {}

void main() {
  final mockRepository = MockGenerateHashtagsRepository();
  final usecase = GenerateHashTagUseCase(repository: mockRepository);

  group('Generate hashtags use case', () {
    test('should forward the call to the repository when called', () async {
      when(() => mockRepository.generateHashtags(input: any(named: 'input')))
          .thenAnswer((_) async => const Right([]));

      final result = await usecase.call('');
      expect(result, isA<Right<Failure, List<HashtagDataEntity>>>());
      verify(() => mockRepository.generateHashtags(input: any(named: 'input')));
    });
  });
}
