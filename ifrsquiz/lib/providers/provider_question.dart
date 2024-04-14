import 'package:flutter/material.dart';
import 'package:ifrsquiz/models/model_chapter.dart';
import 'package:ifrsquiz/models/model_question.dart';

class QuestionProvider with ChangeNotifier {
  String mode = 'Training';
  int currentQuestionIndex = 0;
  String currentChapter = "Africa";
  int currentScore = 0;

  List<ModelChapter> listOfChapters = [
    ModelChapter(
      title: 'Africa',
      description: 'Learn the Country Capitals of Africa',
    ),
    ModelChapter(
      title: 'South Asia',
      description: 'Learn the Country Capitals of South Asia',
    ),
    ModelChapter(
      title: 'Europe',
      description: 'Learn the Country Capitals of Europe',
    ),
  ];

  Map<String, List<ModelQuestion>> listOfQuestions = {
    "Africa": [
      ModelQuestion(
        question: 'What is the capital of Nigeria?',
        option1: 'Lagos',
        option2: 'Abuja',
        option3: 'Kano',
        option4: 'Ibadan',
        correctOption: 'Abuja',
        explanation: 'Abuja is the capital of Nigeria',
      ),
      ModelQuestion(
        question: 'What is the capital of Ghana?',
        option1: 'Accra',
        option2: 'Kumasi',
        option3: 'Tamale',
        option4: 'Takoradi',
        correctOption: 'Accra',
        explanation: 'Accra is the capital of Ghana',
      ),
      ModelQuestion(
        question: 'What is the capital of South Africa?',
        option1: 'Johannesburg',
        option2: 'Cape Town',
        option3: 'Pretoria',
        option4: 'Durban',
        correctOption: 'Pretoria',
        explanation: 'Pretoria is the capital of South Africa',
      ),
    ],
    "South Asia": [
      ModelQuestion(
        question: 'What is the capital of India?',
        option1: 'Mumbai',
        option2: 'New Delhi',
        option3: 'Bangalore',
        option4: 'Hyderabad',
        correctOption: 'New Delhi',
        explanation: 'New Delhi is the capital of India',
      ),
      ModelQuestion(
        question: 'What is the capital of Pakistan?',
        option1: 'Karachi',
        option2: 'Lahore',
        option3: 'Islamabad',
        option4: 'Faisalabad',
        correctOption: 'Islamabad',
        explanation: 'Islamabad is the capital of Pakistan',
      ),
      ModelQuestion(
        question: 'What is the capital of Bangladesh?',
        option1: 'Dhaka',
        option2: 'Chittagong',
        option3: 'Khulna',
        option4: 'Rajshahi',
        correctOption: 'Dhaka',
        explanation: 'Dhaka is the capital of Bangladesh',
      ),
    ],
    "Europe": [
      ModelQuestion(
        question: 'What is the capital of Germany?',
        option1: 'Berlin',
        option2: 'Hamburg',
        option3: 'Munich',
        option4: 'Frankfurt',
        correctOption: 'Berlin',
        explanation: 'Berlin is the capital of Germany',
      ),
      ModelQuestion(
        question: 'What is the capital of France?',
        option1: 'Paris',
        option2: 'Marseille',
        option3: 'Lyon',
        option4: 'Toulouse',
        correctOption: 'Paris',
        explanation: 'Paris is the capital of France',
      ),
      ModelQuestion(
        question: 'What is the capital of Netherlands?',
        option1: 'Amsterdam',
        option2: 'Rotterdam',
        option3: 'The Hague',
        option4: 'Utrecht',
        correctOption: 'Amsterdam',
        explanation: 'Amsterdam is the capital of Netherlands',
      ),
    ],
  };

  getQuestion() {
    return listOfQuestions[currentChapter]?[currentQuestionIndex].question;
  }

  getOption1() {
    return listOfQuestions[currentChapter]?[currentQuestionIndex].option1;
  }

  getOption2() {
    return listOfQuestions[currentChapter]?[currentQuestionIndex].option2;
  }

  getOption3() {
    return listOfQuestions[currentChapter]?[currentQuestionIndex].option3;
  }

  getOption4() {
    return listOfQuestions[currentChapter]?[currentQuestionIndex].option4;
  }

  getCorrectOption() {
    return listOfQuestions[currentChapter]?[currentQuestionIndex].correctOption;
  }

  getExplanation() {
    return listOfQuestions[currentChapter]?[currentQuestionIndex].explanation;
  }

  getChapterTitle(index) {
    return listOfChapters[index].title;
  }

  getChapterDescription(index) {
    return listOfChapters[index].description;
  }

  void setScore(score) {
    currentScore = score;
    notifyListeners();
  }

  int getScore() {
    return currentScore;
  }

  void setQuestionIndex(index) {
    currentQuestionIndex = index;
    notifyListeners();
  }

  int getQuestionIndex() {
    return currentQuestionIndex;
  }

  void setChapter(String chapter) {
    currentChapter = chapter;
    notifyListeners();
  }

  String getChapter() {
    print("currentChapter: $currentChapter");
    return currentChapter;
  }

  void setMode(String setMode) {
    mode = setMode;
    notifyListeners();
  }

  String getMode() {
    return mode;
  }
}
