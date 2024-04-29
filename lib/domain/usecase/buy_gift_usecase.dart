import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/gift_gallery/buy_gift_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class BuyGiftUseCase implements BaseUseCase<int, BuyGiftModel> {
  final Repository _repository;

  BuyGiftUseCase(this._repository);

  @override
  Future<Either<Failure, BuyGiftModel>> execute(int giftId) {
    return _repository.buyGift(giftId);
  }
}
