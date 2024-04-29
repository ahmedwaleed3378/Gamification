import 'package:dartz/dartz.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

import '../../data/network/failure.dart';
import '../model/subject_progress/subjects_progress.dart';
import '../repository/repository.dart';

class SubjectsProgressUseCase
    implements BaseUseCase<void, SubjectsProgressModel> {
  final Repository _repository;

  SubjectsProgressUseCase(this._repository);

  @override
  Future<Either<Failure, SubjectsProgressModel>> execute(void input) {
    return _repository.getAllSubjectsProgress();
  }
}
