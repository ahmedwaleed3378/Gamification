import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/gift_gallery/gift_by_user_id_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class GetGiftByUserIdUseCase implements BaseUseCase<void, List<GiftByUserIdModel>> {
  final Repository _repository;

  GetGiftByUserIdUseCase(this._repository);

  @override
  Future<Either<Failure, List<GiftByUserIdModel>>> execute(void input) {
    return _repository.getGiftByUserId();
  }
}
