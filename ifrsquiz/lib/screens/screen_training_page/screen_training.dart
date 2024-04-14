import 'package:flutter/material.dart';
import 'package:ifrsquiz/globals/globals.dart';
import 'package:ifrsquiz/providers/provider_question.dart';
import 'package:provider/provider.dart';

class ScreenTraining extends StatefulWidget {
  final int chapterIndex;
  const ScreenTraining({super.key, required this.chapterIndex});

  @override
  State<ScreenTraining> createState() => _ScreenTrainingState();
}

class _ScreenTrainingState extends State<ScreenTraining> {
  List<bool> _expandedTiles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _expandedTiles = List<bool>.filled(3, false);
  }

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
        title: const Text("Training"),
      ),

      // Body
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Consumer<QuestionProvider>(
              builder: (context, value, child) => Card(
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    child: ExpansionTile(
                      // Title
                      title: Text(
                        "${value.listOfQuestions[value.listOfChapters[widget.chapterIndex].title]?[index].question}",
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black54),
                      ),

                      // Trailing
                      trailing: Icon(
                        _expandedTiles[index]
                            ? Icons.arrow_drop_down_circle
                            : Icons.arrow_drop_down,
                      ),
                      onExpansionChanged: (bool expanded) {
                        setState(() {
                          _expandedTiles[index] = expanded;
                        });
                      },
                      tilePadding: const EdgeInsets.only(left: 15, right: 15),
                      childrenPadding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      collapsedBackgroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      collapsedIconColor: Colors.black54,
                      expandedAlignment: Alignment.centerLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,

                      // Children
                      children: [
                        Text(
                          "${value.listOfQuestions[value.listOfChapters[widget.chapterIndex].title]?[index].explanation}",
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 13),
                        ),
                      ],
                    ),
                  ));
        },
      ),
    ));
  }
}


// body: LayoutBuilder(
//             builder: (BuildContext context, BoxConstraints constraints) {
//           return ListView.builder(itemBuilder: (context, index) {
//             return Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.grey,
//                     spreadRadius: 0,
//                     blurRadius: 2,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               margin:
//                   const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
//               padding: const EdgeInsets.all(15),

//               // Column
//               child: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Text
//                   Text(
//                     "Please sign in so that your settings are saved.",
//                     style: TextStyle(fontSize: 13, color: Colors.black54),
//                   ),

//                   // Divider
//                   SizedBox(
//                     height: 10,
//                   ),

//                   // Text
//                   Text(
//                     "Try Training mode first to learn content, and then try Quiz mode to make sure you understand the concepts",
//                     style: TextStyle(color: Colors.black54, fontSize: 13),
//                   ),
//                 ],
//               ),
//             );
//           });
//         }),