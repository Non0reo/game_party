import 'package:game_party/api.dart';

class Question {
  String question;
  String answer;
  List<String> incorrect;

  String category;
  int difficulty;
  int type;
  bool isNiche = false;

  Question({
    required this.question,
    required this.answer,
    required this.incorrect,
    this.category = 'General',
    this.difficulty = 0,
    this.type = 0, //0: 'text_choice', 1: 'image_choice'
    this.isNiche = false,
  });

  static Future<Question> fromJson(jsonDecode, {String language = 'fr'}) async {

    int questionDifficulty = 0;
    switch (jsonDecode['difficulty']) {
      case 'easy':
        questionDifficulty = 0;
        break;
      case 'medium':
        questionDifficulty = 1;
        break;
      case 'hard':
        questionDifficulty = 2;
        break;
      default:
        questionDifficulty = 0;
    }

    List<String> incorrect = [];
    for (var answer in jsonDecode['incorrectAnswers']) {
      //incorrect.add(await translate(answer, to: language));
      incorrect.add(answer);
    }

    String formatedFetch = '${jsonDecode['question']['text']}///${jsonDecode['category']}///${jsonDecode['correctAnswer']}///${incorrect.join('///')}';
    var componentList = [];
    if(language != 'en') {
      String result = await translate(formatedFetch, to: language);
      componentList = result.split('///');
      incorrect = [];
      for (var i = 3; i < componentList.length; i++) {
        incorrect.add(componentList[i]);
      }
    } else {
      componentList = formatedFetch.split('///');
    }
    

    return Question(
      question: componentList[0],
      answer: componentList[2],
      incorrect: incorrect,
      category: componentList[1],
      difficulty: questionDifficulty,
      type: jsonDecode['type'] == 'text_choice' ? 0 : 1,
      isNiche: jsonDecode['isNiche']
    );
  }
}