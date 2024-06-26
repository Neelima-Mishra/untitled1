import 'package:dartz/dartz.dart';

import '../../data/app_exceptions/app_exceptions.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
