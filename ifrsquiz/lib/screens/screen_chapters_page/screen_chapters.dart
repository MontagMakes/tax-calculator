import 'package:flutter/material.dart';
import 'package:ifrsquiz/globals/globals.dart';
import 'package:ifrsquiz/providers/provider_question.dart';
import 'package:provider/provider.dart';

class ScreenChapters extends StatefulWidget {
  const ScreenChapters({super.key});

  @override
  State<ScreenChapters> createState() => ScreenChaptersState();
}

class ScreenChaptersState extends State<ScreenChapters> {
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
          title: const Text("Chapters"),
        ),

        // Body
        body: Consumer<QuestionProvider>(builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.listOfChapters.length,
            itemBuilder: (context, index) {
              return Column(children: [
                ListTile(
                  title: Text(
                    "${value.getChapterTitle(index)}",
                    style: const TextStyle(color: Globals.primaryColor),
                  ),
                  subtitle: Text("${value.getChapterDescription(index)}"),
                  onTap: () {
                    if (value.getMode() == 'Training') {
                      Navigator.pushNamed(context, '/training', arguments: index);
                    } else {
                      value.setQuestionIndex(0);
                      value.setChapter("${value.getChapterTitle(index)}");
                      Navigator.pushNamed(context, '/quiz', );
                    }
                  },
                ),
                const Divider()
              ]);
            },
          );
        }),
      ),
    );
  }
}
