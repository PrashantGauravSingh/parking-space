import 'package:get_it/get_it.dart';
import 'package:parking_space/core/networking/api_manager.dart';

class DependencyInjector {
  final GetIt _serviceLocator = GetIt.instance;

  GetIt get serviceLocator => _serviceLocator;

  ///init Dependency Injector
  Future<void> init() async {
    ///Inject Service Manager
    _injectServiceManagerV2();
  }

  void _injectServiceManagerV2() {
    _serviceLocator.registerLazySingleton<ServiceManagerV1>(
        () => ServiceManagerV1.instance);
  }
}
