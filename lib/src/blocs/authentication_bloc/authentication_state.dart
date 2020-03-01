import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final FirebaseUser currentUser;

  const Authenticated(this.currentUser);

  @override
  List<Object> get props => [currentUser];

  @override
  String toString() => 'Authenticated { displayName: ${currentUser.email}}';
}

class Unauthenticated extends AuthenticationState {}
