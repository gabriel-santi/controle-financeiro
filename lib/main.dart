import 'package:finapp/interfaces/configuration/route/routes.dart';
import 'package:finapp/interfaces/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finapp',
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Montserrat",
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontSize: MainTheme.fontSizeLarge),
            bodyMedium: TextStyle(fontSize: MainTheme.fontSizeMedium),
            bodySmall: TextStyle(fontSize: MainTheme.fontSizeSmall),
          ),
          colorScheme: MainTheme.lightTheme),
    );
  }
}
