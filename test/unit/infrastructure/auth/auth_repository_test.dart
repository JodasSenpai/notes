import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes/domain/auth/value_objects.dart';
import 'package:notes/infrastructure/auth/auth_repository.dart';
import 'package:notes/infrastructure/auth/datasource/auth_remote_data_source.dart';
import 'package:notes/infrastructure/auth/model/user/user_dto.dart';

import 'auth_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRemoteDataSource>()])
void main() {
  late final AuthRemoteDataSource mockAuthRemoteDataSource;
  const mockUserDto = UserDto(user_id: "fake_id", email: "fake@email.com");

  setUpAll(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    when(mockAuthRemoteDataSource.loginUserWithEmailAndPassword(
            "fake@email.com", "password"))
        .thenAnswer(
            (_) async => UserDto(user_id: "fake_id", email: "fake@email.com"));
  });

  Future<void> setUpMockReturns(
      {UserDto? loginUserWithEmailAndPassword}) async {
    loginUserWithEmailAndPassword != null
        ? when(mockAuthRemoteDataSource.loginUserWithEmailAndPassword(
                "email@gmail.com", "password"))
            .thenAnswer((_) async => loginUserWithEmailAndPassword)
        : null;
  }

  test(
      "Given user has correct credentials, When user loginUserWithEmailAndPassword is called, Then Ok() is returned",
      () async {
    //arrange
    when(mockAuthRemoteDataSource.loginUserWithEmailAndPassword(
            "fake@email.com", "password"))
        .thenAnswer(
            (_) async => UserDto(user_id: "fake_id", email: "fake@email.com"));
    //await setUpMockReturns(loginUserWithEmailAndPassword: mockUserDto);
    final authRepository =
        AuthRepository(authRemoteDataSource: mockAuthRemoteDataSource);
    //act
    final response = await authRepository.loginUserWithEmailAndPassword(
        email: EmailAddress("fake@email.com"), password: Password("password"));
    //assert
    expect(response.isOk(), true);
  });
}
