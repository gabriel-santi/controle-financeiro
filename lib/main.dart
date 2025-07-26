import 'package:finapp/features/language/domain/language.dart';
import 'package:finapp/route/routes.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/notification.widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Finapp',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return NotificationWidget(key: notificationKey, child: child!);
      },
      supportedLocales: Language.values.map((l) => l.locale),
      locale: Language.values.first.locale,
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
