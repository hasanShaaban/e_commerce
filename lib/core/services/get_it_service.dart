import 'package:e_commerce/core/services/data_base_service.dart';
import 'package:e_commerce/core/services/fire_store_service.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce/feature/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataBaseService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>(), dataBaseService: getIt<DataBaseService>()));

}