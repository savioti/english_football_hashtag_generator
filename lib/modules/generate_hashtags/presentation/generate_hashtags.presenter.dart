import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/entities/hashtag_data_entity.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/usecases/generate_hashtags_usecase.dart';
import 'package:riverpod/riverpod.dart';

class GenerateHashtagsPresenter {
  final GenerateHashTagUseCase usecase;
  late final FutureProvider<String> provider;

  GenerateHashtagsPresenter({required this.usecase});

  Future<String> generateHashtags(String input) async {
    final result = await usecase.call(input);
    final hashTags = result.fold((l) => <HashtagDataEntity>[], (r) => r);
    final buffer = StringBuffer();

    for (var hashtagEntity in hashTags) {
      for (var hashtag in hashtagEntity.hashtags) {
        buffer.write('#$hashtag ');
      }
    }

    return buffer.toString();
  }
}
