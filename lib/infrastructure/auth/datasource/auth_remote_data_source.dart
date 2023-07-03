import 'package:injectable/injectable.dart';
import 'package:notes/infrastructure/auth/model/user/user_dto.dart';
import 'package:notes/infrastructure/core/firebase_backend_api.dart';

abstract class IAuthRemoteDataSource {
  Future<UserDto> registerUserWithEmailAndPassword(
      String email, String password);

  Future<UserDto> registerUserWithGoogle();

  Future<UserDto> loginUserWithEmailAndPassword(String email, String password);
}

@LazySingleton(as: IAuthRemoteDataSource)
class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final IFirebaseBackendApi firebaseBackendApi;

  AuthRemoteDataSource({required this.firebaseBackendApi});

  @override
  Future<UserDto> loginUserWithEmailAndPassword(
      String email, String password) async {
    final response = await firebaseBackendApi.loginUserWithEmailAndPassword(
        email: email, password: password);
    return UserDto.fromFirebaseUser(response!);
  }

  @override
  Future<UserDto> registerUserWithEmailAndPassword(
      String email, String password) async {
    final response = await firebaseBackendApi.registerUserWithEmailAndPassword(
        email: email, password: password);
    return UserDto.fromFirebaseUser(response!);
  }

  @override
  Future<UserDto> registerUserWithGoogle() {
    // TODO: implement registerUserWithGoogle
    throw UnimplementedError();
  }
}
