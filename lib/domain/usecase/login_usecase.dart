import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/login/login_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginRequest, LoginModel> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, LoginModel>> execute(LoginRequest loginRequest) async {
    return await _repository.login(loginRequest);
  }
}
