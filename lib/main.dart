import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ui/views/home/home_view.dart';
import 'ui/views/register/register_view.dart';
import 'ui/views/welcome/welcome_view.dart';
import 'ui/views/profile/profile_view.dart';

import 'package:stacked_services/stacked_services.dart';
import 'app.locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Color(0xFFF5EAFE),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeView(),
        '/register': (context) => RegisterView(),
        '/home': (context) => HomeView(),
        '/profile-view': (context) => ProfileView(),
      },
    );
  }
}
