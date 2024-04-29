import 'package:dartz/dartz.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

import '../../data/network/failure.dart';
import '../model/check_balance/check_balance.dart';
import '../repository/repository.dart';

class CheckBalanceUseCase implements BaseUseCase<void, CheckBalanceModel> {
  final Repository _repository;

  CheckBalanceUseCase(this._repository);

  @override
  Future<Either<Failure, CheckBalanceModel>> execute(void input) {
    return _repository.checkBalance();
  }
}
