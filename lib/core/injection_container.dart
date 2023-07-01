import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


import 'injection_container.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit(initializerName: r"$initGetIt",
preferRelativeImports:true,
asExtension:false)
void configureDependencies(String env) => $initGetIt(sl);

void setup(){}

@module
abstract class RegisterModule{

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}