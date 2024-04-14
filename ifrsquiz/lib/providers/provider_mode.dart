import 'package:flutter/material.dart';
import 'package:ifrsquiz/models/explanation_arguments.dart';

class ModeProvider with ChangeNotifier{
  final List<ExplanationArguments> _list = [];
  bool _singlePageExplanation = false;

  void setSinglePageExplanation(bool value){
    _singlePageExplanation = value;
    notifyListeners();
  }

  bool getSinglePageExplanation(){
    return _singlePageExplanation;
  }
  
  void addExplanation(ExplanationArguments explanationArguments){
    _list.add(explanationArguments);
    notifyListeners();
  }

  void removeExplanation(ExplanationArguments explanationArguments){
    _list.remove(explanationArguments);
    notifyListeners();
  }

  void clearExplanation(){
    _list.clear();
    notifyListeners();
  }

  int getExplanationCount(){
    return _list.length;
  }

  List<ExplanationArguments> getExplanationList(){
    return _list;
  }

  bool isExplanationAdded(ExplanationArguments explanationArguments){
    return _list.contains(explanationArguments);
  }
}