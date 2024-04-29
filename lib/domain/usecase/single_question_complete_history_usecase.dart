import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/question/single_question_history_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class SingleQuestionCompleteHistoryUseCase
    implements
        BaseUseCase<SubmitSingleQuestionRequest, SingleQuestionHistoryModel> {
  final Repository _repository;

  SingleQuestionCompleteHistoryUseCase(this._repository);

  @override
  Future<Either<Failure, SingleQuestionHistoryModel>> execute(
    SubmitSingleQuestionRequest submitSingleQuestionRequest,
  ) {
    return _repository
        .submitSingleCompleteQuestionHistory(submitSingleQuestionRequest);
  }
}
