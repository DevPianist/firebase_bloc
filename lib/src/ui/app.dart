import 'package:custom_splash/custom_splash.dart';
import 'package:firebase_bloc/src/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import '../repositories/repository.dart';

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase & BLoC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomSplash(
        imagePath: 'assets/logo.png',
        backGroundColor: Colors.white,
        home: SplashScreen(
          userRepository: this._userRepository,
        ),
        duration: 2500,
        type: CustomSplashType.StaticDuration,
      ),
    );
  }
}
