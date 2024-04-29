
import 'package:dartz/dartz.dart';
import 'package:gamification/domain/model/subject_progress/subject_progress_details.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class SubjectProgressDetailsUseCase implements BaseUseCase<int, SubjectProgressIdModel> {
  final Repository _repository;

  SubjectProgressDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, SubjectProgressIdModel>> execute(int id) {
    return _repository.subjectProgressDetails(id);
  }
}
