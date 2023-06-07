import 'package:flutter/material.dart';
import 'package:game_party/api.dart';
import 'package:game_party/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(flex: 10),
              const Text(
                'Game Party!',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,

                ),
              ),
              const Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/gameSelection');
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0)),
                  ),
                  child: const Text('Play', style: TextStyle(fontSize: 30),),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('options');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(grey),
                ),
                child: const Text('Options'),
              ),
              const Spacer(flex: 10),
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