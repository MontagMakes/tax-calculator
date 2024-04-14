import 'package:flutter/material.dart';
import 'package:ifrsquiz/globals/globals.dart';
import 'package:ifrsquiz/providers/provider_question.dart';
import 'package:provider/provider.dart';

class ScreenExplanation extends StatelessWidget {
  final String question;
  final String explanation;
  final bool isCorrect;
  const ScreenExplanation(
      {super.key,
      required this.question,
      required this.explanation,
      required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // AppBar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 51,
          backgroundColor: Globals.primaryColor,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text("Explanation"),
        ),

        // Body
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: ListTile(
                  title: Text(
                    question,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                ),
              ),
            ),

            // Explanation
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: RichText(
                      text: TextSpan(children: [
                    isCorrect
                        ? const TextSpan(
                            text: "Correct, you got it!\n\n",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        : const TextSpan(
                            text: "Sorry, that's not right.\n\n",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                    TextSpan(
                      text: "Explanation\n\n",
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: explanation,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ])),
                ),
              ),
            ),

            // Correct or Incorrect
            Consumer<QuestionProvider>(builder: (context, value, child) {
              return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Globals.primaryColor),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                  ),
                  onPressed: () {
                    // If last question, pop to home
                    if (value.getQuestionIndex() ==
                        value.listOfQuestions[value.getChapter()]!.length - 1) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Chapter done!",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Congrats, you are through with this chapter! Your score is ${value.getScore()} of ${value.listOfQuestions[value.getChapter()]!.length * 10}",
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.popUntil(context,
                                                  ModalRoute.withName('/'));
                                            },
                                            child: const Text(
                                              "Share",
                                              style: TextStyle(
                                                  color: Globals.primaryColor),
                                            )),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            value.setQuestionIndex(0);
                                            value.setScore(0);
                                            Navigator.popAndPushNamed(
                                                context, '/chapters');
                                          },
                                          child: const Text("LET'S CONTINUE!",
                                              style: TextStyle(
                                                  color: Globals.primaryColor)))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      return;
                    } else {
                      value.setQuestionIndex(value.getQuestionIndex() + 1);
                      value.setScore(
                          isCorrect ? value.getScore() + 10 : value.getScore());
                      Navigator.pop(context);
                    }

                    // Otherwise, increment question index and score and then pop back to quiz
                  },
                  child: const Text(
                    "OK, CONTINUE",
                    style: TextStyle(color: Colors.white),
                  ));
            })
          ],
        ),
      ),
    );
  }
}
