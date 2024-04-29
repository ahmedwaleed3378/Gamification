import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/gift_gallery/gift_gallery_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class GiftGalleryUseCase implements BaseUseCase<void, GiftGalleryModel> {
  final Repository _repository;

  GiftGalleryUseCase(this._repository);

  @override
  Future<Either<Failure, GiftGalleryModel>> execute(void input) {
    return _repository.getGiftGallery();
  }
}
