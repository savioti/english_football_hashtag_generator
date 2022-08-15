import 'package:english_football_hashtag_generator/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/datasources/generate_hashtags_datasource.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/entities/hashtag_data_entity.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/repositories/generate_hashtags_repository.dart';

class GenerateHashtagsRepositoryImpl implements GenerateHashTagsRepository {
  final GenerateHashtagsLocalDatasource dataSource;

  GenerateHashtagsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<HashtagDataEntity>>> generateHashtags(
      {required String input}) async {
    try {
      final result = await dataSource.retrieveHashtagsForInput(input: input);
      return Right(result);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }
}
