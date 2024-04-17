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

  RepositoryImpl({required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo});

  @override
  Future<Either<Failure, ProfileData>> getTopData(
      TopRequest tourRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getTop(tourRequest);
        Map<String, dynamic> responseJson = jsonDecode(response);
        final responseData = ProfileData.fromJson(responseJson);
        if (responseData.seoSettings != null) // success
            {
          await localDataSource.saveLoginDataPref(
              response: jsonEncode(responseData.deals));
          return Right(responseData);
        } else {
          return Left(Failure(response.statusCode,
              responseData.seoSettings!.webUrl ?? ResponseMessage.defaults,
              false));
        }
      } catch (error) {
        return (Left(AppExceptions
            .handle(error)
            .failure));
      }
    } else {
      return (Left(AppExceptions
          .handle("")
          .failure));
    }
  }
}