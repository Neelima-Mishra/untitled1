import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../domain/models/list_model.dart';
import '../../domain/repository/repository.dart';
import '../app_exceptions/app_exceptions.dart';
import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';
import '../request/request.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource remoteDataSource;
  LocalDataSource localDataSource;
  NetworkInfo networkInfo;

  RepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<TopData>>> getTopData(
      TopRequest tourRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getTop(tourRequest);
        Map<String, dynamic> responseJson = jsonDecode(response);
        final responseData = TopListResponse.fromJson(responseJson);
        if (responseData.status == 200) // success
        {
          await localDataSource.saveLoginDataPref(
              response: jsonEncode(responseData.routes));
          return Right(responseData.routes!);
        } else {
          return Left(Failure(response.statusCode,
              responseData.message ?? ResponseMessage.defaults, false));
        }
      } catch (error) {
        return (Left(AppExceptions.handle(error).failure));
      }
    } else {
      return (Left(AppExceptions.handle("").failure));

    }
  }

  Future<Either<Failure, List<TopData>>> getPopularData(
      TopRequest tourRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getTop(tourRequest);
        Map<String, dynamic> responseJson = jsonDecode(response);
        final responseData = TopListResponse.fromJson(responseJson);
        if (responseData.status == 200) // success
            {
          await localDataSource.saveLoginDataPref(
              response: jsonEncode(responseData.routes));
          return Right(responseData.routes!);
        } else {
          return Left(Failure(response.statusCode,
              responseData.message ?? ResponseMessage.defaults, false));
        }
      } catch (error) {
        return (Left(AppExceptions.handle(error).failure));
      }
    } else {
      return (Left(AppExceptions.handle("").failure));

    }
  }
  Future<Either<Failure, List<TopData>>> getValueData(
      TopRequest tourRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getTop(tourRequest);
        Map<String, dynamic> responseJson = jsonDecode(response);
        final responseData = TopListResponse.fromJson(responseJson);
        if (responseData.status == 200) // success
            {
          await localDataSource.saveLoginDataPref(
              response: jsonEncode(responseData.routes));
          return Right(responseData.routes!);
        } else {
          return Left(Failure(response.statusCode,
              responseData.message ?? ResponseMessage.defaults, false));
        }
      } catch (error) {
        return (Left(AppExceptions.handle(error).failure));
      }
    } else {
      return (Left(AppExceptions.handle("").failure));

    }
  }
}
