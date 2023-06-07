import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'api.dart';
import 'gameSelection.dart';
import 'home.dart';

const Color white = Color(0xFFFFFFFF);
const Color black = Color(0xFF000000);
const Color grey = Color(0xFF535353);

const Color primaryColor = Color(0xFF53877D); //#53877d
const Color secondaryColor = Color(0xFFF4FBF9); //#F4FBF9
const Color accentColor = Color(0xFF46726A); //#46726A

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MainApp());
  initPhoneSystem();
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    initPhoneSystem();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      title: 'Game Party!',
      theme: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
            bodyMedium: GoogleFonts.playfairDisplay(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
            ),
          ),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
          buttonColor: primaryColor,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor)
        /* .copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
          surface: accentColor,
          // background: white,
          // onPrimary: white,
          // onSecondary: black,
          // onSurface: black,
          // onBackground: black,
        ) */
      ),
      routes: <String, WidgetBuilder>{
        '/gameSelection': (BuildContext context) => const GameSelectionPage(),
      },
      
    );
  }
}


void initPhoneSystem() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor,
    systemNavigationBarColor: primaryColor,
    systemNavigationBarDividerColor: primaryColor
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}