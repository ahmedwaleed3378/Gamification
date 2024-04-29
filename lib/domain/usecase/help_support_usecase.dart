import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/help_support/help_support_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class HelpSupportUseCase implements BaseUseCase<void, HelpSupportModel> {
  final Repository _repository;

  HelpSupportUseCase(this._repository);

  @override
  Future<Either<Failure, HelpSupportModel>> execute(void input) {
    return _repository.getHelpAndSupport();
  }
}