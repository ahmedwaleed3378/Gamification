import 'package:dartz/dartz.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

import '../../data/network/failure.dart';
import '../model/student_rank/student_rank_model.dart';
import '../repository/repository.dart';

class StudentRankUseCase implements BaseUseCase<void, StudentRankModel> {
  final Repository _repository;

  StudentRankUseCase(this._repository);

  @override
  Future<Either<Failure, StudentRankModel>> execute(void input) {
    return _repository.getStudentRank();
  }
}
