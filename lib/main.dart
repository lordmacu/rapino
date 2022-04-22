import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapino/home/HomeProvider.dart';
import 'package:rapino/individual/IndividualProvider.dart';
import 'package:rapino/pages/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => IndividualProvider())
      ],
      child: MaterialApp(
        initialRoute: 'home',
        routes: {'home': (context) => HomePage()},
        title: 'Rapino',
        theme: ThemeData(
            primarySwatch: Colors.yellow,
            appBarTheme: const AppBarTheme(
              color: Color(0xff00c600),
            )),
      ),
    );
  }
}
