import 'package:flutter/material.dart';
import 'package:ifrsquiz/globals/globals.dart';
import 'package:ifrsquiz/models/explanation_arguments.dart';
import 'package:ifrsquiz/providers/provider_question.dart';
import 'package:provider/provider.dart';

class ScreenQuiz extends StatefulWidget {
  const ScreenQuiz({super.key});

  @override
  State<ScreenQuiz> createState() => _ScreenQuizState();
}

class _ScreenQuizState extends State<ScreenQuiz> {
  String _selectedOption = '';
  String _correctAnswer = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // AppBar
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          toolbarHeight: 51,
          backgroundColor: Globals.primaryColor,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text("Quiz"),
        ),

        // Body
        body: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.white,
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Consumer<QuestionProvider>(
                    builder: (context, value, child) {
                  return Column(
                    children: [
                      // Question
                      ListTile(
                        title: Text(
                          "Question ${value.getQuestionIndex() + 1}",
                          style: const TextStyle(color: Globals.primaryColor),
                        ),
                        subtitle: Text(
                            "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].question}"),
                      ),

                      // Options
                      Column(
                        children: [
                          ListTile(
                            title: Text(
                                "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].option1}"),
                            leading: Radio(
                              value:
                                  "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].option1}",
                              groupValue: _selectedOption,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              },
                            ),
                            onTap: () {
                              setState(() {
                                _selectedOption =
                                    "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].option1}";
                              });
                            },
                          ),
                          ListTile(
                            onTap: () {
                              setState(() {
                                _selectedOption =
                                    "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].option2}";
                              });
                            },
                            title: Text(
                                "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].option2}"),
                            leading: Radio(
                              value:
                                  "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].option2}",
                              groupValue: _selectedOption,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              setState(() {
                                _selectedOption =
                                    "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].option3}";
                              });
                            },
                            title: Text(
                                "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].option3}"),
                            leading: Radio(
                              value:
                                  "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].option3}",
                              groupValue: _selectedOption,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              setState(() {
                                _selectedOption =
                                    "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].option4}";
                              });
                            },
                            title: Text(
                                "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].option4}"),
                            leading: Radio(
                              value:
                                  "${value.listOfQuestions[value.getChapter()]?[value.getQuestionIndex()].option4}",
                              groupValue: _selectedOption,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),

              // Check Button
              Consumer<QuestionProvider>(builder: (context, value, child) {
                return ElevatedButton(
                  style: ButtonStyle(

                    // Greyed Button if no option is selected
                    backgroundColor: MaterialStateProperty.all(
                        _selectedOption == ''
                            ? Globals.primaryColor.withOpacity(0.5)
                            : Globals.primaryColor),
                    
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                  ),

                  // Disable button if no option is selected
                  onPressed: _selectedOption == ''
                      ? null
                      : () {
                          _selectedOption = '';
                          _correctAnswer = value.getCorrectOption();

                          
                          if (_selectedOption == _correctAnswer) {
                            Navigator.pushNamed(context, '/explanation',
                                arguments: ExplanationArguments(
                                    question: value.getQuestion(),
                                    explanation: value.getExplanation(),
                                    isCorrect: true));
                          } else {
                            Navigator.pushNamed(context, '/explanation',
                                arguments: ExplanationArguments(
                                    question: value.getQuestion(),
                                    explanation: value.getExplanation(),
                                    isCorrect: false));
                          }
                        },
                  child: const Text(
                    'Check',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
            ],
          ),
          Consumer<QuestionProvider>(
            builder: (context, value, child) => Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Score: ${value.getScore()}",
                        style: const TextStyle(color: Colors.white)),
                    Text(
                      "Question ${value.getQuestionIndex() + 1} of ${value.listOfQuestions[value.getChapter()]?.length}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
