import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/user_points/user_points_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class UserPointsUseCase implements BaseUseCase<void, UserPointsModel> {
  final Repository _repository;

  UserPointsUseCase(this._repository);

  @override
  Future<Either<Failure, UserPointsModel>> execute(void input) {
    return _repository.getPointsOfUser();
  }
}