import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game_party/questions.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

//Translate any string to any language to another
Future<String> translate(String inputText, {String from = 'en', String to = 'fr'}) async {
  final translator = GoogleTranslator();
  var translation = await translator
      .translate(inputText, from: from, to: to);
  print(translation.text);
  return translation.text;
}

/* 
//Fetch a random word from the dictionary
Future<String> randomWord() async {

} */



//Fetch question from this api: https://the-trivia-api.com/v2/questions?limit=10&region=FR
Future<List<Question>> fetchQuestions({int count = 5, String language = 'fr'}) async {
  final response = await http.get(Uri.parse('https://the-trivia-api.com/v2/questions?limit=$count&region=FR'));
  
  if (response.statusCode == 200) {
  List<Question> questions = [];
  var questionsJson = jsonDecode(response.body);
  for (var question in questionsJson) {
    questions.add(await Question.fromJson(question, language: language));
  }

  return questions;
  } else {
    print('Failed to load question');
    throw Exception('Failed to load question');
  }
}