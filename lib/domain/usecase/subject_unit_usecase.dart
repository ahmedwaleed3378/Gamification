import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/courses/subject_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class SubjectUnitUseCase implements BaseUseCase<int, List<SubjectUnitModel>> {
  final Repository _repository;

  SubjectUnitUseCase(this._repository);

  @override
  Future<Either<Failure, List<SubjectUnitModel>>> execute(int subjectId) {
    return _repository.returnContentBySubjectId(subjectId);
  }
}
