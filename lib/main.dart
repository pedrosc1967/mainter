import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'login_screen.dart';
import 'transition_route_observer.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  /*
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      // LoginScreen.routeName
      print('User is signed in!');
    }
  });

  */

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maintenize',
      theme: ThemeData(
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.orange),
        // fontFamily: 'SourceSansPro',
        textTheme: TextTheme(
          headline3: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
            color: Colors.orange,
          ),
          button: const TextStyle(
            // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans',
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.deepPurple[300],
          ),
          headline1: const TextStyle(fontFamily: 'Quicksand'),
          headline2: const TextStyle(fontFamily: 'Quicksand'),
          headline4: const TextStyle(fontFamily: 'Quicksand'),
          headline5: const TextStyle(fontFamily: 'NotoSans'),
          headline6: const TextStyle(fontFamily: 'NotoSans'),
          subtitle1: const TextStyle(fontFamily: 'NotoSans'),
          bodyText1: const TextStyle(fontFamily: 'NotoSans'),
          bodyText2: const TextStyle(fontFamily: 'NotoSans'),
          subtitle2: const TextStyle(fontFamily: 'NotoSans'),
          overline: const TextStyle(fontFamily: 'NotoSans'),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(secondary: Colors.orange),
      ),
      navigatorObservers: [TransitionRouteObserver()],
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        DashboardScreen.routeName: (context) => const DashboardScreen(),
      },
    );
  }
}
