import 'dart:convert';
import 'dart:io';

import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/models/hashtag_data_model.dart';

class GenerateHashtagsFixture {
  static Map<String, dynamic> getDummyHashtagDataJson() {
    final fixtureFile = File(
        'test\\modules\\generate_hashtags\\fixtures\\fixture.man_utd_hashtags.json');
    final stringfiedJson = fixtureFile.readAsStringSync();
    final jsonContent = json.decode(stringfiedJson);
    return jsonContent;
  }

  static String getDummyHashtagDataString() {
    final fixtureFile = File(
        'test/src/modules/get_trivia_questions/fixtures/trivia_question.json');
    final stringfiedJson = fixtureFile.readAsStringSync();
    return stringfiedJson;
  }

  static String getServerResponse() {
    final fixtureFile = File(
        'test/src/modules/get_trivia_questions/fixtures/example_response.json');
    final stringfiedJson = fixtureFile.readAsStringSync();
    return stringfiedJson;
  }

  static HashtagDataModel getDummyHashtagDataModel() {
    final jsonContent = getDummyHashtagDataJson();
    final question = HashtagDataModel.fromMap(jsonContent);
    return question;
  }

  // static List<QuestionEntity> getDummyHashtagDatas(int count) {
  //   final dummyQuestion = getDummyHashtagData();
  //   final questions =
  //       List<QuestionEntity>.generate(count, (_) => dummyQuestion);
  //   return questions;
  // }
}
