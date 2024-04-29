import 'package:dartz/dartz.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

import '../../data/network/failure.dart';
import '../model/subjects_of_year/student_subjects.dart';
import '../repository/repository.dart';

class StudentSubjectsUseCase implements BaseUseCase<void, StudentSubjectsModel> {
  final Repository _repository;

  StudentSubjectsUseCase(this._repository);

  @override
  Future<Either<Failure, StudentSubjectsModel>> execute(void input) {
    return _repository.getAllSubjects();
  }
}
