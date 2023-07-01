import 'package:injectable/injectable.dart';
import 'package:notes/domain/auth/auth_failure.dart';
import 'package:notes/domain/auth/auth_repository.dart';
import 'package:notes/domain/auth/user/user.dart';
import 'package:notes/domain/auth/value_objects.dart';
import 'package:notes/infrastrucutre/auth/datasource/auth_remote_data_source.dart';
import 'package:notes/infrastrucutre/auth/model/user/user_dto.dart';
import 'package:oxidized/src/result.dart';

@LazySingleton(as: IAuthRepositroy)
class AuthRepositroy implements IAuthRepositroy {
  final IAuthRemoteDataSource authRemoteDataSource;

  AuthRepositroy({required this.authRemoteDataSource});

  @override
  Future<Result<User, AuthFailure>> loginUserWithEmailAndPassword(
      {required EmailAddress email, required Password password}) async {
    try {
      final emailStr = email.getOrElse("INVALID EMAIL");
      final passwordStr = password.getOrElse("INVALID PASSWORD");
      final userDto = await authRemoteDataSource
          .loginUserWithEmailAndPassword(emailStr, passwordStr);
      return Ok(userDto.toDomain());
    } catch (e) {
      return Err(AuthFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Result<User, AuthFailure>> registerUserWithEmailAndPassword(
      {required EmailAddress email, required Password password}) async {
    try {
      final emailStr = email.getOrElse("INVALID EMAIL");
      final passwordStr = password.getOrElse("INVALID PASSWORD");
      final userDto = await authRemoteDataSource
          .registerUserWithEmailAndPassword(emailStr, passwordStr);
      return Ok(userDto.toDomain());
    } catch (e) {
      return Err(AuthFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Result<User, AuthFailure>> registerUserWithGoogle() {
    // TODO: implement registerUserWithGoogle
    throw UnimplementedError();
  }
}
