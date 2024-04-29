import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/editProfile/edit_profile.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class EditProfileUseCase implements BaseUseCase<EditProfileRequest, EditProfileModel> {
  final Repository _repository;

  EditProfileUseCase(this._repository);

  @override
  Future<Either<Failure, EditProfileModel>> execute(EditProfileRequest editProfileRequest ) {
    return _repository.editProfile(editProfileRequest);
  }
}
