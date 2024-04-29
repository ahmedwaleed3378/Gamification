import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class DeleteUseCase implements BaseUseCase<int, String> {
  final Repository _repository;

  DeleteUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(int userId) {
    return _repository.deleteUser(userId);
  }
}
