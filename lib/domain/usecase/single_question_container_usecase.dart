import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/question/single_question_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class SingleQuestionContainerUseCase
    implements BaseUseCase<ContainerSubmitSingleQuestionRequest, SingleQuestionModel> {
  final Repository _repository;

  SingleQuestionContainerUseCase(this._repository);

  @override
  Future<Either<Failure, SingleQuestionModel>> execute(
      ContainerSubmitSingleQuestionRequest containerSubmitSingleQuestionRequest,
      ) {
    return _repository.submitSingleContainerQuestion(containerSubmitSingleQuestionRequest);
  }
}
