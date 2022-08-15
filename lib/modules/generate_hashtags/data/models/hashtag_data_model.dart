import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/entities/hashtag_data_entity.dart';

class HashtagDataModel extends HashtagDataEntity {
  HashtagDataModel({required super.term, required super.hashtags});

  factory HashtagDataModel.fromMap(Map<String, dynamic> map) {
    final mappedHashtags = map['hashtags'] as List;
    final hashtags = mappedHashtags.map((h) => h.toString()).toList();
    return HashtagDataModel(
      term: map['term'],
      hashtags: hashtags,
    );
  }
}
