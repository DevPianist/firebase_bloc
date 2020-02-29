import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_bloc/src/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseUser _currentUser;

  HomeScreen({Key key, @required FirebaseUser currentUser})
      : assert(currentUser != null),
        _currentUser = currentUser,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Text('Firebase & BLoC ${_currentUser.displayName}'),
      ),
    );
  }
}
