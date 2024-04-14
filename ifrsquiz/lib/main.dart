import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ifrsquiz/models/explanation_arguments.dart';
import 'package:ifrsquiz/providers/provider_mode.dart';
import 'package:ifrsquiz/providers/provider_question.dart';
import 'package:ifrsquiz/screens/screen_chapters_page/screen_chapters.dart';
import 'package:ifrsquiz/screens/screen_explanation_page/screen_explanation.dart';
import 'package:ifrsquiz/screens/screen_home_page/screen_home.dart';
import 'package:ifrsquiz/screens/screen_quiz_page/screen_quiz.dart';
import 'package:ifrsquiz/screens/screen_settings_page/screen_settings.dart';
import 'package:ifrsquiz/screens/screen_training_page/screen_training.dart';
import 'package:provider/provider.dart';

Future<UserCredential> signInWithGoogle() async {
  try {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    print("Failed to sign in with Google: $e");
    rethrow;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => QuestionProvider()),
      ChangeNotifierProvider(create: (context) => ModeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/chapters':
            return MaterialPageRoute(
                builder: (context) => const ScreenChapters());

          case '/training':
            final args = settings.arguments as int;
            return MaterialPageRoute(
              builder: (context) => ScreenTraining(chapterIndex: args),
            );

          case '/quiz':
            return MaterialPageRoute(builder: (context) => const ScreenQuiz());

          case '/settings':
            return MaterialPageRoute(builder: (context) => const ScreenSettings());

          case '/explanation':
            final args = settings.arguments as ExplanationArguments;
            return MaterialPageRoute(
                builder: (context) => ScreenExplanation(
                      explanation: args.explanation,
                      isCorrect: args.isCorrect,
                      question: args.question,
                    ));

          default:
            return MaterialPageRoute(builder: (context) => const MyHomePage());
        }
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
