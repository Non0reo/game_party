import 'package:flutter/material.dart';
import 'package:game_party/api.dart';
import 'package:game_party/main.dart';

class GameSelectionPage extends StatefulWidget {
  const GameSelectionPage({super.key});

  @override
  State<GameSelectionPage> createState() => _GameSelectionPageState();
}

class _GameSelectionPageState extends State<GameSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Text(
                  'Select a game mode',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('Game1');
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(Size(200, 100)),
                    ),
                    child: const Text('Simple Quiz'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(Size(200, 100)),
                    ),
                    child: const Text('WikiWhat?'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(Size(200, 100)),
                    ),
                    child: const Text('JALM'),
                  ),
                ],
              )
            ],
          ),
        )
      );
  }
}

/* ElevatedButton(
  onPressed: () {
    translate('Hello World', from: 'en', to: 'fr');
  },
  child: const Text('Translate'),
), */