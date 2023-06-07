// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:game_party/main.dart';
import 'package:google_fonts/google_fonts.dart';

class BeforeSQuiz extends StatefulWidget {
  const BeforeSQuiz({super.key});

  @override
  State<BeforeSQuiz> createState() => _BeforeSQuizState();
}

class _BeforeSQuizState extends State<BeforeSQuiz> {
  bool isEnglish = true;
  int playerCount = 3;
  int roundCount = 5;
  int difficulty = -1;

  void switchLang(String lang) {
    setState(() {
      if(lang == 'en') isEnglish = true;
      else isEnglish = false;
    });
  }

  String difficultyToString(int difficulty) {
    switch (difficulty) {
      case 0:
        return 'Easy';
      case 1:
        return 'Medium';
      case 2:
        return 'Hard';
      case -1:
        return 'All';
      default:
        return 'Medium';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 6),


                  const Text('Simple Quiz', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          isEnglish ? 'assets/icons/English_selected.png' : 'assets/icons/English.png',
                          width: isEnglish ? 120 : 80,
                        ),
                        onTap: () {
                          switchLang('en');
                        },
                      ),
                      const SizedBox(width: 40),
                      GestureDetector(
                        child: Image.asset(
                          !isEnglish ? 'assets/icons/French_selected.png' : 'assets/icons/French.png',
                          width: isEnglish ? 80 : 120,
                        ),
                        onTap: () {
                          switchLang('fr');
                        },
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 30),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Number of players',
                          style: GoogleFonts.signikaNegative(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                          
                        ),
                        const Spacer(),
                        FloatingActionButton.small(
                          onPressed: () {
                            setState(() {
                              if(playerCount > 1) playerCount--;
                            });
                          },
                          child: const Icon(Icons.remove),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 100,
                          ),
                          child: Text(
                            playerCount.toString(),
                            style: GoogleFonts.signikaNegative(
                              fontSize: 30,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        FloatingActionButton.small(
                          onPressed: () {
                            setState(() {
                              if(playerCount < 10) playerCount++;
                            });
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Round count',
                          style: GoogleFonts.signikaNegative(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                          
                        ),
                        const Spacer(),
                        FloatingActionButton.small(
                          onPressed: () {
                            setState(() {
                              if(roundCount > 3) roundCount--;
                            });
                          },
                          child: const Icon(Icons.remove),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          roundCount.toString(),
                          style: GoogleFonts.signikaNegative(
                            fontSize: 30,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(width: 10),
                        FloatingActionButton.small(
                          onPressed: () {
                            setState(() {
                              if(roundCount < 20) roundCount++;
                            });
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Difficulty',
                          style: GoogleFonts.signikaNegative(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                          
                        ),
                        const Spacer(),
                        FloatingActionButton.small(
                          onPressed: () {
                            setState(() {
                              difficulty--;
                              if(difficulty < -1) difficulty = 2;
                            });
                          },
                          child: const Icon(Icons.remove),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 100,
                          ),
                          child: Text(
                            difficultyToString(difficulty),
                            style: GoogleFonts.signikaNegative(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        FloatingActionButton.small(
                          onPressed: () {
                            setState(() {
                              difficulty++;
                              if(difficulty > 2) difficulty = -1;
                            });
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  
                  //const SizedBox(height: 30),
                  
                  const Spacer(flex: 4),

                  ElevatedButton(
                    onPressed: () {
                      /* Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GamePage(playerCount: playerCount, roundCount: roundCount, difficulty: difficulty, isEnglish: isEnglish)),
                      ); */
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: GoogleFonts.signikaNegative(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    child: const Text('Start game'),
                  ),

                  const Spacer(flex: 2),
                  
                ],
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                minHeight: 200,
                maxHeight: 400,
              ),
              child: !isEnglish ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: Text(
                  '\tAttention! Le jeu utilise un service de questions en anglais. Le jeu doit donc traduire toutes les questions et réponses, ce qui peut prendre du temps. La traduction peut ne pas être exacte.',
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w300
                  ),
                  textAlign: TextAlign.justify,
            
                ),
              ) : Container(color: Colors.transparent, width: 0, height: 0,), // Empty container if english
            ),
          ],
        ),
        
      ),
    );
  }
}

