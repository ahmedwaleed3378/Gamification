import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/exam/submit_single_matching_question.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class SubmitSingleMatchingQuestionExamHistoryUseCase
    implements
        BaseUseCase<SubmitMatchingQuestionRequestHistory, SubmitSingleMatchingQuestionHistoryModel> {
  final Repository _repository;

  SubmitSingleMatchingQuestionExamHistoryUseCase(this._repository);

  @override
  Future<Either<Failure, SubmitSingleMatchingQuestionHistoryModel>> execute(
      SubmitMatchingQuestionRequestHistory submitMatchingQuestionRequestHistory) async {
    return await _repository.submitSingleMatchingQuestionHistory(submitMatchingQuestionRequestHistory);
  }
}
