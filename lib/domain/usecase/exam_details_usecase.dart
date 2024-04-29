import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class ExamDetailsUseCase implements BaseUseCase<int, ExamDetailsModel> {
  final Repository _repository;

  ExamDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, ExamDetailsModel>> execute(int examId) {
    return _repository.examDetails(examId);
  }
}
