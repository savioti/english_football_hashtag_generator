import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/datasources/generate_hashtags_datasource_impl.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/models/hashtag_data_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dataSource = GenerateHashtagsLocalDatasourceImpl(
      databasePath: 'lib\\core\\data\\database.json');
  const String tInput = 'Manchester United and Arsenal played yesterday.';

  group('Generate hashtags local data source', () {
    test('should return a List of HashtagDataModel ', () async {
      final result = await dataSource.retrieveHashtagsForInput(input: tInput);
      expect(result, isA<List<HashtagDataModel>>());
      expect(result[0].term, 'Manchester United');
      expect(result[1].term, 'Arsenal');
    });
  });
}
