import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/profile/profile_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class ProfileUseCase implements BaseUseCase<void, ProfileModel> {
  final Repository _repository;

  ProfileUseCase(this._repository);

  @override
  Future<Either<Failure, ProfileModel>> execute(void input) {
    return _repository.returnProfile();
  }
}
