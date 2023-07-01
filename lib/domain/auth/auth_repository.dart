
import 'package:notes/domain/auth/auth_failure.dart';
import 'package:notes/domain/auth/user/user.dart';
import 'package:notes/domain/auth/value_objects.dart';
import 'package:oxidized/oxidized.dart';

abstract class IAuthRepositroy {
  Future<Result<User, AuthFailure>> registerUserWithEmailAndPassword(
      {required EmailAddress email, required Password password});

  Future<Result<User, AuthFailure>> loginUserWithEmailAndPassword(
      {required EmailAddress email, required Password password});

  Future<Result<User, AuthFailure>> registerUserWithGoogle();

}
