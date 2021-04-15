import 'package:dio/dio.dart';
import 'package:ejemplo_lunes/app/modules/home/page/home_page.dart';
import 'package:ejemplo_lunes/app/modules/home/repository/repo_impl.dart';
import 'package:ejemplo_lunes/app/modules/home/services/local_service.dart';
import 'package:ejemplo_lunes/app/modules/home/services/remote_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    // Bind.instance(SharedPreferences.getInstance()),
    // Bind.instance(InternetConnectionChecker()),
    // Bind.lazySingleton((i) => RemoteService(dio: i.get())),
    // Bind.lazySingleton((i) => LocalService(sharedPreferences: i.get())),
    // Bind.lazySingleton((i) => RepoPostImpl(
    //     localService: i.get(),
    //     remoteService: i.get(),
    //     internetConnectionChecker: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const HomePage()),
  ];
}
