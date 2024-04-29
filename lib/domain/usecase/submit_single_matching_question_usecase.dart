import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/exam/submit_single_matching_question.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class SubmitSingleMatchingQuestionExamUseCase
    implements
        BaseUseCase<SubmitMatchingQuestionRequest, SubmitSingleMatchingQuestionModel> {
  final Repository _repository;

  SubmitSingleMatchingQuestionExamUseCase(this._repository);

  @override
  Future<Either<Failure, SubmitSingleMatchingQuestionModel>> execute(
      SubmitMatchingQuestionRequest submitMatchingQuestionRequest) async {
    return await _repository.submitSingleMatchingQuestion(submitMatchingQuestionRequest);
  }
}
