import 'package:dartz/dartz.dart';
import 'package:english_football_hashtag_generator/core/error/exception.dart';
import 'package:english_football_hashtag_generator/core/error/failure.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/datasources/generate_hashtags_datasource.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/repositories/generate_hashtags_repository_impl.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/entities/hashtag_data_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/fixture.generate_hashtags.dart';

class MockGenerateHashtagsLocalDatasource extends Mock
    implements GenerateHashtagsLocalDatasource {}

void main() {
  final mockDataSource = MockGenerateHashtagsLocalDatasource();
  final repository = GenerateHashtagsRepositoryImpl(dataSource: mockDataSource);
  const String tInput = 'Manchester United';
  const int tCount = 5;

  group('Generate hashtags repository implementation', () {
    test(
        'should return a HashtagDataEntity when hashtags for the input are found',
        () async {
      when(() => mockDataSource.retrieveHashtagsForInput(input: tInput))
          .thenAnswer((_) async => List.generate(tCount,
              (_) => GenerateHashtagsFixture.getDummyHashtagDataModel()));
      final result = await repository.generateHashtags(input: tInput);
      expect(result, isA<Right<Failure, List<HashtagDataEntity>>>());
      verify(() => mockDataSource.retrieveHashtagsForInput(input: tInput));
    });

    test(
        'should return a DatabaseFailure when the call to retrieve data from database fails',
        () async {
      when(() => mockDataSource.retrieveHashtagsForInput(input: tInput))
          .thenThrow(DatabaseException());
      final result = await repository.generateHashtags(input: tInput);
      expect(result, isA<Left<Failure, List<HashtagDataEntity>>>());
      verify(() => mockDataSource.retrieveHashtagsForInput(input: tInput));
    });
  });
}
