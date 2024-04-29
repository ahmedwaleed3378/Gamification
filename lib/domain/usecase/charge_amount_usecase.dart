import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/payment/charge_amount_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class ChargeAmountUseCase implements BaseUseCase<ChargeAmountRequest, ChargeAmountModel> {
  final Repository _repository;

  ChargeAmountUseCase(this._repository);

  @override
  Future<Either<Failure, ChargeAmountModel>> execute(ChargeAmountRequest chargeAmountRequest) {
    return _repository.chargeAmount(
        chargeAmountRequest.amount,
        chargeAmountRequest.eduCompId,
        chargeAmountRequest.paymentMethodId,
        chargeAmountRequest.paymentPlanId,
    );
  }
}


