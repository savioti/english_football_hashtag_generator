import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/models/hashtag_data_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture.generate_hashtags.dart';

void main() {
  final tDataMap = GenerateHashtagsFixture.getDummyHashtagDataJson();

  group('HashtagDataModel', () {
    test(
        'should build a valid HashtagdataModel when a Map<String, dynamic> is provided',
        () {
      final model = HashtagDataModel.fromMap(tDataMap);
      assert(model.term.isNotEmpty);
      assert(model.hashtags.isNotEmpty);
    });
  });
}
