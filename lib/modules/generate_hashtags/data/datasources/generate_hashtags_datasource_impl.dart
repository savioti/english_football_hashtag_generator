import 'dart:convert';
import 'dart:io';

import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/datasources/generate_hashtags_datasource.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/models/hashtag_data_model.dart';

class GenerateHashtagsLocalDatasourceImpl
    implements GenerateHashtagsLocalDatasource {
  final String databasePath;
  late final List<dynamic> database;
  late final List<String> indexedKeys;

  GenerateHashtagsLocalDatasourceImpl({required this.databasePath}) {
    final file = File(databasePath);
    final stringfiedJson = file.readAsStringSync();
    database = jsonDecode(stringfiedJson);
    _indexKeys();
  }

  @override
  Future<List<HashtagDataModel>> retrieveHashtagsForInput({
    required String input,
  }) async {
    final hashtags = <HashtagDataModel>[];

    for (var key in indexedKeys) {
      if (input.contains(key)) {
        final model = HashtagDataModel.fromMap(
            database.firstWhere((e) => e['term'] == key));

        if (!hashtags.contains(model)) {
          hashtags.add(model);
        }
      }
    }
    return hashtags;
  }

  void _indexKeys() {
    indexedKeys = database.map((e) => e['term'] as String).toList();
  }
}
