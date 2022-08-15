import 'package:english_football_hashtag_generator/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/entities/hashtag_data_entity.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/repositories/generate_hashtags_repository.dart';
import 'package:english_football_hashtag_generator/shared/use_cases/use_case.dart';

class GenerateHashTagUseCase
    implements UseCase<List<HashtagDataEntity>, String> {
  final GenerateHashTagsRepository repository;

  GenerateHashTagUseCase({required this.repository});

  @override
  Future<Either<Failure, List<HashtagDataEntity>>> call(String params) {
    return repository.generateHashtags(input: params);
  }
}
