import 'package:flutter/material.dart';
import 'package:test_aplication/data/api/services_of_info_cat.dart';
import 'package:provider/provider.dart';
import 'package:test_aplication/domain/controllers/home_controller.dart';
import 'package:test_aplication/presentation/screens/splash/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ServicesOfInfoCat()),
        ChangeNotifierProvider(create: (_)=> HomeController()),
      ],
      child: MaterialApp(
        title: 'CatBreeds',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
