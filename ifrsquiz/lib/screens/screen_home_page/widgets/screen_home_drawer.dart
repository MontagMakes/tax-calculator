import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ifrsquiz/main.dart';

class ScreenDrawer extends StatelessWidget {
  const ScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: Border.all(
        color: Colors.white,
        width: 0,
      ),
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer Header
          const SizedBox(
            height: 60,
            child: DrawerHeader(
              padding: EdgeInsets.only(left: 18, top: 12, bottom: 12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          // Drawer Items
          SizedBox(
            height: 40,
            child: ListTile(
              leading: const Icon(
                Icons.home,
                size: 25,
              ),
              horizontalTitleGap: 20,
              title: const Text('Home'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/');
              },
            ),
          ),

          const Divider(
            indent: 60,
          ),

          SizedBox(
            height: 40,
            child: ListTile(
              leading: const Icon(Icons.quiz, size: 25),
              horizontalTitleGap: 20,
              title: const Text('Quiz'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/chapters');
              },
            ),
          ),

          const Divider(
            indent: 60,
          ),

          SizedBox(
            height: 40,
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.bookOpen, size: 20),
              horizontalTitleGap: 20,
              title: const Text('Training'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/chapters');
              },
            ),
          ),

          const Divider(
            indent: 60,
          ),

          SizedBox(
            height: 40,
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.trophy, size: 20),
              horizontalTitleGap: 20,
              title: const Text('High Score'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          const Divider(
            indent: 60,
          ),

          SizedBox(
            height: 40,
            child: ListTile(
              leading: const Icon(Icons.settings, size: 25),
              horizontalTitleGap: 20,
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ),
          

          SizedBox(
            height: 40,
            child: ListTile(
              leading: const Icon(Icons.info, size: 25),
              horizontalTitleGap: 20,
              title: const Text('Learn More'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          const Divider(
            indent: 60,
          ),

          FirebaseAuth.instance.currentUser == null
              ? SizedBox(
                  height: 40,
                  child: ListTile(
                    leading: const Icon(Icons.login, size: 25),
                    horizontalTitleGap: 20,
                    title: const Text('Sign in'),
                    onTap: () {
                      signInWithGoogle().then((UserCredential user) {
                        print('Signed in as ${user.user?.displayName}');
                      }).catchError(
                          (e) => print('Failed to sign in with Google: $e'));
                      Navigator.pop(context);
                    },
                  ),
                )
              : SizedBox(
                  height: 40,
                  child: ListTile(
                    leading: const Icon(Icons.login, size: 25),
                    horizontalTitleGap: 20,
                    title: const Text('Sign Out'),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
                  ),
                ),

          const Divider(
            indent: 60,
          ),
        ],
      ),
    );
  }
}
