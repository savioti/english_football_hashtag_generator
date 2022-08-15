import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/models/hashtag_data_model.dart';

abstract class GenerateHashtagsLocalDatasource {
  Future<List<HashtagDataModel>> retrieveHashtagsForInput({
    required String input,
  });
}
