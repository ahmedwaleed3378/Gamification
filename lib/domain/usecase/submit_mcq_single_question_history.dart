import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/exam/submit_single_question_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class SubmitMCQSingleQuestionExamHistoryUseCase
    implements
        BaseUseCase<SubmitMCQSingleQuestionRequest, SubmitSingleQuestionModel> {
  final Repository _repository;

  SubmitMCQSingleQuestionExamHistoryUseCase(this._repository);

  @override
  Future<Either<Failure, SubmitSingleQuestionModel>> execute(
      SubmitMCQSingleQuestionRequest submitSingleQuestionRequest) async {
    return await _repository.submitMCQSingleQuestionHistory(submitSingleQuestionRequest);
  }
}
