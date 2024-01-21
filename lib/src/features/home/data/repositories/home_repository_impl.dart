import 'package:dartz/dartz.dart';
import 'package:e_learning/src/core/errors/failures.dart';
import 'package:e_learning/src/features/home/data/datasources/my_courses_remote_datasourse.dart';
import 'package:e_learning/src/features/home/domain/entities/home_user_entity.dart';
import 'package:e_learning/src/features/home/domain/entities/monitors_entity.dart';
import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, HomeUserEntity>> getUserData(
      {required String uID}) async {
    try {
      var res = await remoteDataSource.getUserData(uID: uID);
      return Right(res);
    } catch (e) {
      return Left(FirebaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<MonitorEntity>>> getMonitors() async {
    try {
      var res = await remoteDataSource.getMonitors();
      return Right(res);
    } catch (e) {
      return Left(FirebaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getUserCourses(
      {required String uID}) async {
    try {
      var res = await remoteDataSource.getUserCourses(uID: uID);
      return Right(res);
    } catch (e) {
      return Left(FirebaseFailure());
    }
  }
}
