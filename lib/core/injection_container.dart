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

 
}