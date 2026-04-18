import 'package:dartz/dartz.dart';
import 'package:qodraapp/core/errors/faluire.dart';

abstract class SetttingsRepo {
  Future<Either<Failure, void>> transferWorkshop(
      {required String token,
      required String fromCode,
      required String toCode,
      required String reason});
}
