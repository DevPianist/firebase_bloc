import 'package:firebase_bloc/src/blocs/bloc.dart';
import 'package:firebase_bloc/src/repositories/repository.dart';
import 'package:firebase_bloc/src/ui/screens/home/home_screen.dart';
import 'package:firebase_bloc/src/ui/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  final UserRepository _userRepository;

  SplashScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is Unauthenticated) {
          return LoginScreen(userRepository: widget._userRepository);
        }
        if (state is Authenticated) {
          return HomeScreen(currentUser: state.currentUser);
        }
        return Scaffold(
          body: Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      },
    );
  }
}
