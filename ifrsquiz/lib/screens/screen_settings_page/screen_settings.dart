import 'package:flutter/material.dart';
import 'package:ifrsquiz/globals/globals.dart';
import 'package:ifrsquiz/providers/provider_mode.dart';
import 'package:provider/provider.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  bool currentMode = false;
  @override
  Widget build(BuildContext context) {
    print('currentMode: $currentMode');
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Settings',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          backgroundColor: Globals.primaryColor,
        ),
        body: Column(
          children: <Widget>[
            Consumer<ModeProvider>(builder: (BuildContext context,
                ModeProvider providerMode, Widget? child) {
              return InkWell(
                onTap: () {
                  setState(() {
                    currentMode = !currentMode;
                    providerMode.setSinglePageExplanation(currentMode);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Switch to Quiz Mode',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Switch(
                        value: currentMode,
                        onChanged: (value) {
                          setState(() {
                            currentMode = value;
                            providerMode.setSinglePageExplanation(value);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            })
          ],
        ));
  }
}
