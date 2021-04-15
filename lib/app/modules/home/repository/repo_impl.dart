import 'package:dartz/dartz.dart';
import 'package:ejemplo_lunes/app/config/error/exceptions.dart';

import 'package:ejemplo_lunes/app/config/error/failures.dart';
import 'package:ejemplo_lunes/app/modules/home/models/response_model.dart';
import 'package:ejemplo_lunes/app/modules/home/repository/i_repo.dart';
import 'package:ejemplo_lunes/app/modules/home/services/local_service.dart';
import 'package:ejemplo_lunes/app/modules/home/services/remote_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class RepoPostImpl implements IRepoPost {
  RemoteService remoteService;
  LocalService localService;
  InternetConnectionChecker internetConnectionChecker;
  RepoPostImpl({
    required this.remoteService,
    required this.localService,
    required this.internetConnectionChecker,
  });
  @override
  Future<Either<Failure, ResponseModel>> getPost() async {
    // Verificamos si hay internet, en caso de no haber retornamos algo del local
    // Si hay internet pedimos al remote
    /// Se pide al remoto, se almacena en el local, se retorna
    if (await internetConnectionChecker.hasConnection) {
      try {
        // Pedimos al remote
        final respuesta = await remoteService.getPost();
        // Salvamos
        localService.savePost(respuesta);
        // Retornamos
        return Right(respuesta);
      } on NoInternetException {
        return const Left(NoInternetFailure());
      } on ServerException {
        return const Left(ServerFailure());
      } on LocalStorageException {
        return const Left(LocalStorageFailure());
      }
      // retornamos
    } else {
      try {
        return Right(localService.getPost());
      } on LocalStorageException {
        return const Left(LocalStorageFailure());
      }
    }
  }
}
