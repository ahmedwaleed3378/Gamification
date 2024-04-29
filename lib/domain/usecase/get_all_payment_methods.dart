import 'package:dartz/dartz.dart';
import 'package:gamification/domain/model/payment/all_payment_methods_model.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';

class GetAllPaymentMethodsUseCase implements BaseUseCase<void, AllPaymentMethodsModel> {
  final Repository _repository;

  GetAllPaymentMethodsUseCase(this._repository);

  @override
  Future<Either<Failure, AllPaymentMethodsModel>> execute(void input) {
    return _repository.getAllPaymentMethod();
  }
}
