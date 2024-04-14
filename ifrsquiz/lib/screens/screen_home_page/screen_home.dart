import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ifrsquiz/globals/globals.dart';
import 'package:ifrsquiz/main.dart';
import 'package:ifrsquiz/providers/provider_question.dart';
import 'package:ifrsquiz/screens/screen_home_page/widgets/screen_home_drawer.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String signInText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        setState(() {
          signInText = "Please sign in so that your settings are saved.";
        });
      } else {
        setState(() {
          signInText = "Welcome ${FirebaseAuth.instance.currentUser?.displayName}!";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var chapter =  context.watch<QuestionProvider>().listOfChapters[2].title;
    // print("$chapter ${context.watch<QuestionProvider>().listOfQuestions[chapter]?[2].question}");
    // print("${context.watch<QuestionProvider>().listOfQuestions[chapter]?[2].correctOption}");
    return SafeArea(
      child: Scaffold(
          // Drawer
          drawer: const ScreenDrawer(),

          // AppBar
          appBar: AppBar(
            toolbarHeight: 51,
            backgroundColor: Globals.primaryColor,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text("Home"),
          ),

          // Body
          body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Body
                const Center(
                  child: Icon(
                    FontAwesomeIcons.house,
                    size: 150,
                    color: Globals.primaryColor,
                  ),
                ),

                // Text Box
                Container(
                  width: constraints.maxWidth * 0.95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(10),

                  // Column
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        signInText,
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black54),
                      ),
                      
                      FirebaseAuth.instance.currentUser == null ?

                        // Google sign in
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 5),
                          child: SizedBox(
                            height: 30,
                            width: 130,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                backgroundColor:
                                    MaterialStateProperty.all(Globals.primaryColor),
                                elevation: MaterialStateProperty.all(3),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                signInWithGoogle().then((UserCredential user) {
                                  print(
                                      "User signed in: ${user.user?.displayName}");
                                }).catchError((e) =>
                                    print("Failed to sign in with Google: $e"));
                              },
                              child: const Text("GOOGLE SIGN IN",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ): Container(),

                      // Divider
                      const SizedBox(
                        height: 10,
                      ),

                      // Text
                      RichText(
                          text: const TextSpan(
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                        children: [
                          TextSpan(
                              text: "IFRS Quiz ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  "is your friendly companion on your journey through Accounting.")
                        ],
                      )),
                      const SizedBox(
                        height: 5,
                      ),
                      // Text
                      const Text(
                        "Try Training mode first to learn content, and then try Quiz mode to make sure you understand the concepts",
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Consumer<QuestionProvider>(builder: (context, value, child) {
                  return SizedBox(
                    width: constraints.maxWidth * 0.95,
                    child: ElevatedButton(
                      onPressed: () {
                        value.setMode('Training');
                        Navigator.pushNamed(context, '/chapters');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Globals.primaryColor),
                        elevation: MaterialStateProperty.all(3),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      child: const Text(
                        "TRAINING",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),

                Consumer<QuestionProvider>(builder: (context, value, child) {
                  return SizedBox(
                    width: constraints.maxWidth * 0.95,
                    child: ElevatedButton(
                      onPressed: () {
                        value.setMode('Quiz');
                        Navigator.pushNamed(context, '/chapters');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Globals.primaryColor),
                        elevation: MaterialStateProperty.all(3),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      child: const Text(
                        "QUIZ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),

                SizedBox(
                  width: constraints.maxWidth * 0.95,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Globals.primaryColor),
                      elevation: MaterialStateProperty.all(3),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      "HIGH SCORE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(
                  width: constraints.maxWidth * 0.95,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Globals.primaryColor),
                      elevation: MaterialStateProperty.all(3),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      "LEARN MORE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          })),
    );
  }
}
