import 'package:dartz/dartz.dart';
import '../../data/app_exceptions/app_exceptions.dart';
import '../../data/request/request.dart';
import '../models/list_model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class ListUseCase extends BaseUseCase<TopRequest, ProfileData> {
  Repository repository;
  ListUseCase({required this.repository});
  @override
  Future<Either<Failure, ProfileData>> execute(TopRequest input) async {
    return await repository.getTopData(input);
  }
}
