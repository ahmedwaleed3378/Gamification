import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/exam/submit_single_qvoice_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class SubmitSingleQVoiceQuestionUseCase
    implements
        BaseUseCase<SubmitSingleVoiceQuestionRequest, SubmitSingleQVoiceQuestionModel> {
  final Repository _repository;

  SubmitSingleQVoiceQuestionUseCase(this._repository);

  @override
  Future<Either<Failure, SubmitSingleQVoiceQuestionModel>> execute(
      SubmitSingleVoiceQuestionRequest singleVoiceQuestionRequest) async {
    return await _repository.submitSingleQVoiceQuestion(singleVoiceQuestionRequest);
  }
}
