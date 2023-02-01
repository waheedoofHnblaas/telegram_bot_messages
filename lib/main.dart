import 'package:animations/core/services/services.dart';
import 'package:animations/initialbinding.dart';
import 'package:animations/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Cairo',
        cardColor: const Color(0xFF5E0000),
        focusColor: Colors.blueAccent,
        hoverColor: Colors.blueAccent,
        backgroundColor: const Color(0xFFFFB5B5),
        primaryColor: const Color(0xFF7C0202),
        scaffoldBackgroundColor: const Color(0xFFFFB5B5),
        appBarTheme: const AppBarTheme(

          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xFFFFB5B5),
          foregroundColor: Colors.black,
        ),
        primarySwatch: Colors.blue,
      ),
      getPages: routes,
      locale: const Locale('ar'),
      initialBinding: InitialBinding(),
    );
  }
}
