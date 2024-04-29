import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/gift_gallery/all_gifts_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class GetAllGiftsUseCase implements BaseUseCase<void, AllGiftsModel> {
  final Repository _repository;

  GetAllGiftsUseCase(this._repository);

  @override
  Future<Either<Failure, AllGiftsModel>> execute(void input) {
    return _repository.getAllGifts();
  }
}
