import 'package:dartz/dartz.dart';
import '../../data/app_exceptions/app_exceptions.dart';
import '../../data/request/request.dart';
import '../models/list_model.dart';

abstract class Repository {
  Future<Either<Failure, ProfileData>> getTopData(
      TopRequest tourRequest);
}
