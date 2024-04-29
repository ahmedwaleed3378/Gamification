import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/streakModel/streak_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class GetStreakUseCase implements BaseUseCase<void, StreakModel> {
  final Repository _repository;

  GetStreakUseCase(this._repository);

  @override
  Future<Either<Failure, StreakModel>> execute(void input) {
    return _repository.getUserStreak();
  }
}
