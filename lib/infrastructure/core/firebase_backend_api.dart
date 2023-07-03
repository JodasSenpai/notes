import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class IFirebaseBackendApi{
  Future<User?> registerUserWithEmailAndPassword(
      {required String email, required String password});


  Future<User?> loginUserWithEmailAndPassword(
      {required String email, required String password});

  Future<Map<String, dynamic>> registerWithGoogle();


}
@LazySingleton(as: IFirebaseBackendApi)
class FirebaseBackendApi implements IFirebaseBackendApi {
  final FirebaseAuth firebaseAuth;

  FirebaseBackendApi({
    required this.firebaseAuth,
  });


  @override
  Future<User?> loginUserWithEmailAndPassword({required String email, required String password}) async{
    final userInfo = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userInfo.user;
  }

  @override
  Future<User?> registerUserWithEmailAndPassword({required String email, required String password}) async{
    final userInfo = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userInfo.user;

  }

  @override
  Future<Map<String, dynamic>> registerWithGoogle() {
    // TODO: implement registerWithGoogle
    throw UnimplementedError();
  }}