import 'package:dartz/dartz.dart';
import 'package:gamification/domain/model/payment/plans_model.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';

class GetAllPaymentPlansUseCase implements BaseUseCase<void, PlansModel> {
  final Repository _repository;

  GetAllPaymentPlansUseCase(this._repository);

  @override
  Future<Either<Failure, PlansModel>> execute(void input) {
    return _repository.getAllPaymentPlans();
  }
}
