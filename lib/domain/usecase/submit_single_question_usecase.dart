import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/exam/submit_single_question_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class SubmitSingleQuestionExamUseCase
    implements
        BaseUseCase<SubmitSingleQuestionRequest, SubmitSingleQuestionModel> {
  final Repository _repository;

  SubmitSingleQuestionExamUseCase(this._repository);

  @override
  Future<Either<Failure, SubmitSingleQuestionModel>> execute(
      SubmitSingleQuestionRequest submitSingleQuestionRequest) async {
    return await _repository.submitSingleQuestion(submitSingleQuestionRequest);
  }
}
