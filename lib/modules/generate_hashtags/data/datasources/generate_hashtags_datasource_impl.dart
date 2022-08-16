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
    final noPunctutationInput = input.replaceAll(RegExp(r'[.,():?!]'), '');
    final capitalWords = _filterCapitalWords(noPunctutationInput);
    final hashtags = _detectKeyWords(capitalWords);
    return hashtags;
  }

  void _indexKeys() {
    indexedKeys = database.map((e) => e['term'] as String).toList();
  }

  List<String> _filterCapitalWords(String input) {
    final capitalWords =
        input.split(' ').where((e) => e[0] == e[0].toUpperCase()).toList();
    return capitalWords;
  }

  List<HashtagDataModel> _detectKeyWords(List<String> words) {
    final hashtags = <HashtagDataModel>[];

    for (var i = 0; i < words.length; i++) {
      if (indexedKeys.contains(words[i])) {
        final model = HashtagDataModel.fromMap(
            database.firstWhere((e) => e['term'] == words[i]));
        if (!hashtags.contains(model)) {
          hashtags.add(model);
        }
        continue;
      }

      if (i + 1 < words.length) {
        final key = '${words[i]} ${words[i + 1]}';

        if (indexedKeys.contains(key)) {
          final model = HashtagDataModel.fromMap(
              database.firstWhere((e) => e['term'] == key));

          if (!hashtags.contains(model)) {
            hashtags.add(model);
          }
        }
      }
    }

    return hashtags;
  }
}
