import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/gift_gallery/buy_gift_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class AssignGiftToUserUseCase
    implements BaseUseCase<AssignGiftToUserRequest, AssignGiftModel> {
  final Repository _repository;

  AssignGiftToUserUseCase(this._repository);

  @override
  Future<Either<Failure, AssignGiftModel>> execute(AssignGiftToUserRequest input) {
    return _repository.assignGiftToUser(input);
  }
}
