import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/register/register_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class RegisterUseCase implements BaseUseCase<RegisterRequest, RegisterModel> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, RegisterModel>> execute(
    RegisterRequest registerRequest,
  ) async {
    return await _repository.register(registerRequest);
  }
}
