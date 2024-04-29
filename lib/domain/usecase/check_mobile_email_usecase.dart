import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/register/register_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class CheckMobileEmailUsecase implements BaseUseCase<EmailMobileRequest, CheckEmailAndPhoneModel> {
  final Repository _repository;

  CheckMobileEmailUsecase(this._repository);

  @override
  Future<Either<Failure, CheckEmailAndPhoneModel>> execute(EmailMobileRequest input) {
    return _repository.checkMobileAndEmail(input);
  }
}
