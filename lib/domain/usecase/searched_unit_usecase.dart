import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/searched_unit/searched_unit_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class SearchedUnitUseCase implements BaseUseCase<int, List<SearchedUnitModel>> {
  final Repository _repository;

  SearchedUnitUseCase(this._repository);

  @override
  Future<Either<Failure, List<SearchedUnitModel>>> execute(int subjectId) {
    return _repository.returnSearchedUnitsBySubjectId(subjectId);
  }
}
