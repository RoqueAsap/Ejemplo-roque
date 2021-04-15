import 'package:dartz/dartz.dart';
import 'package:ejemplo_lunes/app/config/error/failures.dart';
import 'package:ejemplo_lunes/app/modules/home/models/response_model.dart';

abstract class IRepoPost {
  Future<Either<Failure, ResponseModel>> getPost();
  // Future<Either<Failure, Unit>> auth();
  // Future<Option<Failure>> auth2();
}
