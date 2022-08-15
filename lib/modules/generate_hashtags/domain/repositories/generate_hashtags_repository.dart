import 'package:dartz/dartz.dart';
import 'package:english_football_hashtag_generator/core/error/failure.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/entities/hashtag_data_entity.dart';

abstract class GenerateHashTagsRepository {
  Future<Either<Failure, List<HashtagDataEntity>>> generateHashtags({
    required String input,
  });
}
