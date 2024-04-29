import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/lecture_parts/lecture_parts_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class LecturePartsUseCase implements BaseUseCase<int, LecturePartsModel> {
  final Repository _repository;

  LecturePartsUseCase(this._repository);

  @override
  Future<Either<Failure, LecturePartsModel>> execute(int lessonId) async {
    return await _repository.getLessonPartsAndExams(lessonId);
  }
}
