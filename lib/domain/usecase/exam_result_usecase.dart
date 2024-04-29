import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/exam/exam_result_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class ExamResultUseCase implements BaseUseCase<int, ExamResultModel> {
  final Repository _repository;

  ExamResultUseCase(this._repository);

  @override
  Future<Either<Failure, ExamResultModel>> execute(int examId) {
    return _repository.examResults(examId);
  }
}
