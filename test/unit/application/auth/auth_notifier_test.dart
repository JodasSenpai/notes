import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:notes/application/auth/auth_notifier.dart';
import 'package:notes/application/auth/auth_notifier_provider.dart';
import 'package:notes/application/auth/auth_state.dart';
import 'package:notes/domain/auth/user/user.dart';
import 'package:notes/domain/auth/value_objects.dart';
import 'package:notes/domain/core/value_objects.dart';
import 'package:notes/infrastructure/auth/auth_repository.dart';

import '../../core/mockListener.dart';
import 'auth_notifier_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
void main() {
  late final MockAuthRepository mockAuthRepository;
  final fakeUser = User(
      id: UniqueStringId.fromUniqueString("fakeId"),
      email: EmailAddress("fake@email.com"));
  setUpAll(() {
    mockAuthRepository = MockAuthRepository();
  });
  test("Given initial value, When /, Then state is unauthenticated", () {
    //arrange
    final container = ProviderContainer(overrides: [
      authNotifierProvider.overrideWith(
        (ref) => AuthNotifier(),
      )
    ]);

    final listener = Listener<AuthState>();

    container.listen<AuthState>(authNotifierProvider, listener,
        fireImmediately: true);

    //act
    //assert
    expect(container.read(authNotifierProvider), isA<Unauthenticated>());
  });

  test("Given token, When authenticate is called, Then state is authenticated",
      () {
    //arrange

    final container = ProviderContainer(overrides: [
      authNotifierProvider.overrideWith(
        (ref) => AuthNotifier(),
      )
    ]);

    final listener = Listener<AuthState>();

    container.listen<AuthState>(authNotifierProvider, listener,
        fireImmediately: true);

    //act
    container.read(authNotifierProvider.notifier).authenticate(fakeUser);
    //assert

    expect(
        container.read(authNotifierProvider),
        isA<Authenticated>()
            .having((state) => state.user, "state.user", fakeUser));
  });

  test(
      "Given state is authenticated, When logOut is called, Then state is unauthenticated",
      () {
    //arrange
    final container = ProviderContainer(overrides: [
      authNotifierProvider.overrideWith(
        (ref) => AuthNotifier(),
      )
    ]);

    final listener = Listener<AuthState>();

    container.listen<AuthState>(authNotifierProvider, listener,
        fireImmediately: true);

    //act
    container.read(authNotifierProvider.notifier).authenticate(fakeUser);
    //assert

    expect(
        container.read(authNotifierProvider),
        isA<Authenticated>()
            .having((state) => state.user, "state.user", fakeUser));
//act
    container.read(authNotifierProvider.notifier).logOut();
    //assert

    expect(container.read(authNotifierProvider), isA<Unauthenticated>());
  });
}
