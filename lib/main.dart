import 'package:flutter/material.dart';
import 'package:hazob_card_app/api/sheets_api.dart';

import 'package:hazob_card_app/hazob_form/hazob_page.dart';
import 'package:hazob_card_app/splash_screen/splash_screen.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HazobSheetsApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hazob Card App',
      theme: ThemeData(primarySwatch: Colors.amber, fontFamily: 'Lato'),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => const SplashScreen(),
        HAZOB_FORM: (BuildContext context) => const HazobPage(),
    
      },
    );
  }
}
