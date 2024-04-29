import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:gamification/app/functions.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/help_support/help_support_model.dart';
import 'package:gamification/domain/usecase/delete_usecase.dart';
import 'package:gamification/domain/usecase/editProfile_usecase.dart';
import 'package:gamification/domain/usecase/help_support_usecase.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/base/base_view_model.dart';
import 'package:gamification/presentation/common/freezed_data_classes.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:rxdart/rxdart.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../../domain/model/register/register_model.dart';
import '../../../domain/usecase/get_all_eduyears_id.dart';
import '../../../domain/usecase/get_all_stages.dart';
import '../../../domain/usecase/profile_usecase.dart';

class ProfileViewModel extends BaseViewModel
    implements ProfileViewModelOutputs, ProfileViewModelInputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _userEmailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _mobileStreamController =
      StreamController<String>.broadcast();
  final StreamController _newPasswordStreamController =
      StreamController<String>.broadcast();
  final StreamController _confirmNewPasswordStreamController =
      StreamController<String>.broadcast();
  final StreamController stagesIDStreamController =
      BehaviorSubject<List<AllStagesModel>>();
  final StreamController eduYearsIDStreamController =
      BehaviorSubject<AllEduYearsModel>();

  final StreamController profileDataModelStreamController =
      StreamController<ProfileObject>.broadcast();

  final StreamController _arAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController isPasswordProfileUpdatedSuccessfullyStreamController =
      StreamController<bool>.broadcast();

  final StreamController imageProfileStreamController =
      StreamController<File>.broadcast();

  final StreamController helpSupportStreamController =
      StreamController<HelpSupportModel>.broadcast();

  final StreamController deleteStreamController =
      StreamController<String>.broadcast();

  final ProfileUseCase _profileUseCase;
  final EditProfileUseCase _editProfileUseCase;
  final HelpSupportUseCase _helpSupportUseCase;
  final DeleteUseCase _deleteUseCase;
  final GetAllStagesUseCase allStagesUseCase;
  final GetAllEduYearsIdUseCase allEduYearsIdUseCase;
  String? stage;
  String? eduYaer;
  ProfileObject _profileObject =
      ProfileObject("", "", "", "", "", "", "", 0.0, 0, '', '', false, 0);
  PictureObject _pictureObject = PictureObject("", "", 0, "", 0, "");

  ProfileViewModel(
    this._profileUseCase,
    this._editProfileUseCase,
    this._helpSupportUseCase,
    this._deleteUseCase,
    this.allStagesUseCase,
    this.allEduYearsIdUseCase,
  );

  @override
  void start() {
    getProfile();
  }

  @override
  void dispose() {
    super.dispose();
    _userEmailStreamController.close();
    _passwordStreamController.close();
    _newPasswordStreamController.close();
    _confirmNewPasswordStreamController.close();
    _userNameStreamController.close();
    stagesIDStreamController.close();
    eduYearsIDStreamController.close();
    _arAllInputsValidStreamController.close();
    _mobileStreamController.close();
    profileDataModelStreamController.close();
    isPasswordProfileUpdatedSuccessfullyStreamController.close();
    imageProfileStreamController.close();
    helpSupportStreamController.close();
    deleteStreamController.close();
  }

  /// inputs
  @override
  Sink get inputAreAllDataValid => _arAllInputsValidStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputUserEmail => _userEmailStreamController.sink;

  @override
  Sink get inputUserMobile => _mobileStreamController.sink;

  @override
  Sink get inputUserPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserNewPassword => _newPasswordStreamController.sink;

  @override
  Sink get inputUserConfirmNewPassword =>
      _confirmNewPasswordStreamController.sink;

  @override
  Sink get inputProfileDataObject => profileDataModelStreamController.sink;

  @override
  Sink get inputPasswordProfileUpdate =>
      isPasswordProfileUpdatedSuccessfullyStreamController.sink;

  @override
  Sink get inputImageProfile => imageProfileStreamController.sink;

  @override
  Sink get inputHelpSupport => helpSupportStreamController.sink;

  @override
  Sink get inputDeleteUser => deleteStreamController.sink;

  Sink get inputAllEduYearsID => eduYearsIDStreamController.sink;

  Sink get inputAllStagesID => stagesIDStreamController.sink;

  /// outputs
  @override
  Stream<bool> get outIAreAllDataValid =>
      _arAllInputsValidStreamController.stream.map((_) => areAllInputsValid());

  @override
  Stream<bool> get outIsUserNameValid =>
      _userNameStreamController.stream.map((userName) => isValidName(userName));

  @override
  Stream<bool> get outIsUserEmailValid =>
      _userEmailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<bool> get outIsUserMobileValid => _mobileStreamController.stream
      .map((mobile) => isMobileNumberValid(mobile));

  @override
  Stream<bool> get outIsUserPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  Stream<List<AllStagesModel>> get outStagesDataStream =>
      stagesIDStreamController.stream.map((event) => event);

  Stream<AllEduYearsModel> get outEduYearsDataStream =>
      eduYearsIDStreamController.stream.map((event) => event);

  @override
  Stream<bool> get outIsUserNewPasswordValid =>
      _newPasswordStreamController.stream.map(
        (password) => _isPasswordValid(password),
      );

  @override
  Stream<bool> get outIsUserConfirmNewPasswordValid =>
      _confirmNewPasswordStreamController.stream
          .map((password) => _isConfirmedNewPasswordValid(password));

  @override
  Stream<ProfileObject> get outProfileDataObject =>
      profileDataModelStreamController.stream.map((profileData) => profileData);

  @override
  Stream<bool> get outPasswordProfileUpdate =>
      isPasswordProfileUpdatedSuccessfullyStreamController.stream
          .map((updateProfile) => updateProfile);

  @override
  Stream<File> get outImageProfile =>
      imageProfileStreamController.stream.map((image) => image);

  @override
  Stream<HelpSupportModel> get outputHelpSupport =>
      helpSupportStreamController.stream.map((helpSupport) => helpSupport);

  @override
  Stream<String> get outputDeleteUser =>
      deleteStreamController.stream.map((userId) => userId);

  bool areAllInputsValid() {
    return _isPasswordValid(_profileObject.password) &&
        isEmailValid(_profileObject.email) &&
        isValidName(_profileObject.userName) &&
        isMobileNumberValid(_profileObject.mobile);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty && password.length > 4;
  }

  bool _isConfirmedNewPasswordValid(String password) {
    return password.isNotEmpty &&
        _profileObject.newPassword.length > 4 &&
        _profileObject.newPassword == _profileObject.confirmNewPassword;
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    _profileObject = _profileObject.copyWith(userName: userName);
    inputAreAllDataValid.add(null);
  }

  @override
  setUserEmail(String email) {
    inputUserEmail.add(email);
    _profileObject = _profileObject.copyWith(email: email);
    inputAreAllDataValid.add(null);
  }

  @override
  setUserMobile(String mobile) {
    inputUserMobile.add(mobile);
    _profileObject = _profileObject.copyWith(mobile: mobile);
    inputAreAllDataValid.add(null);
  }

  @override
  setPassword(String password) {
    inputUserPassword.add(password);
    _profileObject = _profileObject.copyWith(password: password);
    inputAreAllDataValid.add(null);
  }

  @override
  setNewConfirmPassword(String newPassword) {
    inputUserConfirmNewPassword.add(newPassword);
    _profileObject = _profileObject.copyWith(confirmNewPassword: newPassword);
    inputAreAllDataValid.add(null);
  }

  @override
  setNewPassword(String newPassword) {
    inputUserNewPassword.add(newPassword);
    _profileObject = _profileObject.copyWith(newPassword: newPassword);
    inputAreAllDataValid.add(null);
  }

  getProfile() async {
    (await _profileUseCase.execute(Void)).fold(
        (failure) => {
              // left -> failure
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message))
            }, (data) {
      // right -> data (success)
      // content
      _profileObject = _profileObject.copyWith(
          profilePicture: data.picturePath,
          mobile: data.user!.mobile,
          email: data.user!.accountEmail,
          userName: data.user!.arName,
          totalPoints: data.totallPoints,
          loginCounter: data.user!.loginCounter,
          stage: data.stage,
          academicYear: data.eduYear,
          isEduYearEditable: data.isEduYearEditable,
          eduYearId: data.eduYearId);
      profileDataModelStreamController.add(
        ProfileObject(
            _profileObject.userName,
            _profileObject.email,
            _profileObject.mobile,
            _profileObject.password,
            _profileObject.newPassword,
            _profileObject.confirmNewPassword,
            _profileObject.profilePicture,
            _profileObject.totalPoints,
            _profileObject.loginCounter,
            _profileObject.stage,
            _profileObject.academicYear,
            _profileObject.isEduYearEditable,
            _profileObject.eduYearId),
      );
      //   stage=_profileObject.stage;
      inputState.add(ContentState());
    });
    // profileDataModelStreamController.add(UserDataObject('0100000242',
    //     'Username', 'User email', 'data.picturePath'));
    // inputState.add(LoadingState(
    //     stateRendererType: StateRendererType.fullScreenLoadingState));
    // (await _profileUseCase.execute(Void)).fold(
    //     (failure) => {
    //           // left -> failure
    //           inputState.add(ErrorState(
    //               StateRendererType.fullScreenErrorState, failure.message))
    //         }, (data) {
    //   // right -> data (success)
    //   // content
    //   inputState.add(ContentState());
    //   _profileObject = _profileObject.copyWith(
    //     profilePicture: data.profilePicture,
    //     mobile: data.user!.mobile,
    //     email: data.user!.accountEmail,
    //     userName: data.user!.arName,
    //   );
    //   profileDataModelStreamController.add(UserDataObject(_profileObject.mobile,
    //       _profileObject.userName, _profileObject.email, data.picturePath));
    // });
    // profileDataModelStreamController.add(UserDataObject(
    //     '0100000242', 'Username', 'User email', 'data.picturePath'));
  }

  updateUserProfile(BuildContext context,
      {bool isEduYearEditable = false, int? eduYearId}) async {
    eduYearId ??= _profileObject.eduYearId;
    if (areAllInputsValid()) {
      inputState.add(
        LoadingState(
          stateRendererType: StateRendererType.popupLoadingState,
        ),
      );
      //  if (isEduYearEditable) {
      if (_pictureObject.base64.isNotEmpty) {
        (await _editProfileUseCase.execute(
          EditProfileRequest(
            accountEmail: _profileObject.email,
            arName: _profileObject.userName,
            mobile: _profileObject.mobile,
            accountPassword: _profileObject.password,
            confirmPassword: _profileObject.confirmNewPassword,
            newPassword: _profileObject.newPassword,
            eduYearId: eduYearId,
            userPictureProfile: UserPictureProfile(
                type: _pictureObject.type,
                name: _pictureObject.name,
                lastModifiedDate: _pictureObject.lastModifiedDate,
                size: _pictureObject.size,
                fileAsBase64: _pictureObject.base64),
          ),
        ))
            .fold((failure) {
          {
            // left -> failure
            Navigator.of(context, rootNavigator: true).pop(true);
            inputState.add(ErrorState(
              StateRendererType.popupErrorState,
              failure.message,
            ));
            // inputState.add(ContentState());
          }
        }, (data) {
          // right -> data (success)

          if (_profileObject.confirmNewPassword.isNotEmpty &&
              _profileObject.newPassword.isNotEmpty) {
            inputPasswordProfileUpdate.add(true);
            Navigator.of(context, rootNavigator: true).pop(true);
            inputState.add(ContentState());
            inputState.add(SuccessState(StateRendererType.popupSuccessState,
                LocaleKeys.dataUpdated.tr()));
          } else {
            Navigator.of(context, rootNavigator: true).pop(true);
            getProfile();
            inputState.add(ContentState());
            inputState.add(SuccessState(StateRendererType.popupSuccessState,
                LocaleKeys.dataUpdated.tr()));
          }
          _saveUserDataLocal(_profileObject);
        });
      } else {
        (await _editProfileUseCase.execute(EditProfileRequest(
          accountEmail: _profileObject.email,
          arName: _profileObject.userName,
          mobile: _profileObject.mobile,
          accountPassword: _profileObject.password,
          confirmPassword: _profileObject.confirmNewPassword,
          newPassword: _profileObject.newPassword,
          eduYearId: eduYearId,
        )))
            .fold((failure) {
          // left -> failure
          Navigator.of(context, rootNavigator: true).pop(true);
          inputState.add(ErrorState(
            StateRendererType.popupErrorState,
            failure.message,
          ));
        }, (data) {
          // right -> data (success)
          if (_profileObject.confirmNewPassword.isNotEmpty &&
              _profileObject.newPassword.isNotEmpty) {
            inputPasswordProfileUpdate.add(true);
            Navigator.of(context, rootNavigator: true).pop(true);
            inputState.add(ContentState());
            inputState.add(
              SuccessState(
                StateRendererType.popupSuccessState,
                LocaleKeys.dataUpdated.tr(),
              ),
            );
          } else {
            Navigator.of(context, rootNavigator: true).pop(true);
            getProfile();
            inputState.add(ContentState());
            inputState.add(SuccessState(StateRendererType.popupSuccessState,
                LocaleKeys.dataUpdated.tr()));
          }
          _saveUserDataLocal(_profileObject);
        });
      }
      // }
      // else {
      //   if (_pictureObject.base64.isNotEmpty) {
      //     (await _editProfileUseCase.execute(
      //       EditProfileRequest(
      //         accountEmail: _profileObject.email,
      //         arName: _profileObject.userName,
      //         mobile: _profileObject.mobile,
      //         accountPassword: _profileObject.password,
      //         confirmPassword: _profileObject.confirmNewPassword,
      //         newPassword: _profileObject.newPassword,
      //         userPictureProfile: UserPictureProfile(
      //           type: _pictureObject.type,
      //           name: _pictureObject.name,
      //           lastModifiedDate: _pictureObject.lastModifiedDate,
      //           size: _pictureObject.size,
      //           fileAsBase64: _pictureObject.base64,
      //         ),
      //       ),
      //     ))
      //         .fold((failure) {
      //       {
      //         // left -> failure
      //         Navigator.of(context, rootNavigator: true).pop(true);
      //         inputState.add(ErrorState(
      //           StateRendererType.popupErrorState,
      //           failure.message,
      //         ));
      //         // inputState.add(ContentState());
      //       }
      //     }, (data) {
      //       // right -> data (success)

      //       if (_profileObject.confirmNewPassword.isNotEmpty &&
      //           _profileObject.newPassword.isNotEmpty) {
      //         inputPasswordProfileUpdate.add(true);
      //         Navigator.of(context, rootNavigator: true).pop(true);
      //         inputState.add(ContentState());
      //         inputState.add(SuccessState(StateRendererType.popupSuccessState,
      //             LocaleKeys.dataUpdated.tr()));
      //       } else {
      //         Navigator.of(context, rootNavigator: true).pop(true);
      //         getProfile();
      //         inputState.add(ContentState());
      //         inputState.add(SuccessState(StateRendererType.popupSuccessState,
      //             LocaleKeys.dataUpdated.tr()));
      //       }
      //     });
      //   } else {
      //     (await _editProfileUseCase.execute(EditProfileRequest(
      //       accountEmail: _profileObject.email,
      //       arName: _profileObject.userName,
      //       mobile: _profileObject.mobile,
      //       accountPassword: _profileObject.password,
      //       confirmPassword: _profileObject.confirmNewPassword,
      //       newPassword: _profileObject.newPassword,
      //     )))
      //         .fold((failure) {
      //       // left -> failure
      //       Navigator.of(context, rootNavigator: true).pop(true);
      //       inputState.add(ErrorState(
      //         StateRendererType.popupErrorState,
      //         failure.message,
      //       ));
      //     }, (data) {
      //       // right -> data (success)
      //       if (_profileObject.confirmNewPassword.isNotEmpty &&
      //           _profileObject.newPassword.isNotEmpty) {
      //         inputPasswordProfileUpdate.add(true);
      //         Navigator.of(context, rootNavigator: true).pop(true);
      //         inputState.add(ContentState());
      //         inputState.add(
      //           SuccessState(
      //             StateRendererType.popupSuccessState,
      //             LocaleKeys.dataUpdated.tr(),
      //           ),
      //         );
      //       } else {
      //         Navigator.of(context, rootNavigator: true).pop(true);
      //         getProfile();
      //         inputState.add(ContentState());
      //         inputState.add(SuccessState(StateRendererType.popupSuccessState,
      //             LocaleKeys.dataUpdated.tr()));
      //       }
      //     });
      //   }
      // }
      
    } else {
      Navigator.of(context, rootNavigator: true).pop(true);
      inputState.add(
        ErrorState(
          StateRendererType.popupErrorState,
          LocaleKeys.passwordError.tr(),
        ),
      );
    }
  }

  _saveUserDataLocal(ProfileObject data) async {
    AppPreferences appPreferences = instance<AppPreferences>();

    appPreferences.setUserArName(data.userName);
    appPreferences.setUserEduYear(data.academicYear);
    appPreferences.setUserStage(data.stage);
    appPreferences.setEmail(data.email);
    appPreferences.setMobileNumber(data.mobile);

    appPreferences.setUserPicture(data.profilePicture);
    log(appPreferences.getUserStage().toString());
  }
  //get stages for editing educational years

  getStages({String? lang}) async {
    // inputState.add(
    //   LoadingState(
    //     stateRendererType: StateRendererType.fullScreenLoadingState,
    //   ),);
    (await allStagesUseCase.execute(lang)).fold(
      (failure) {
        {
          // left -> failure
          inputState.add(
              ErrorState(StateRendererType.popupErrorState, failure.message));
        }
      },
      (data) {
        // right -> data (success)

        // content
        inputState.add(ContentState());
        inputAllStagesID.add(data);
      },
    );
  }

  getEduYears(int stageID) async {
    (await allEduYearsIdUseCase.execute(stageID)).fold(
      (failure) {
        {
          // left -> failure
          inputState.add(
              ErrorState(StateRendererType.popupErrorState, failure.message));
        }
      },
      (data) {
        // right -> data (success)
        // content
        inputAllEduYearsID.add(data);
        eduYaer = data.eduYears[0]!.arName;
        inputState.add(ContentState());
        inputAllEduYearsID.add(data);
      },
    );
  }

  Future pickImage() async {
    File image;

    final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picker != null) {
      image = File(picker.path);
      inputImageProfile.add(image);
      uploadImage(image);
    }
  }

  uploadImage(File image) async {
    File file;
    file = File(image.path);
    // get name
    String basename = file.path.split('/').last;

    // get size with bytes
    //file.lengthSync()

    // get file type
    final mimeType = lookupMimeType(file.path);

    final bytes = File(image.path).readAsBytesSync();
    // get base 64
    String base64Image = "data:image/png;base64,${base64Encode(bytes)}";

    _pictureObject = _pictureObject.copyWith(
      size: file.lengthSync(),
      lastModifiedDate: DateTime.now().millisecondsSinceEpoch.toString(),
      name: basename,
      type: mimeType.toString(),
      base64: base64Image,
    );
  }

  getHelpSupport() async {
    (await _helpSupportUseCase.execute(1)).fold((failure) {
      // left -> failure
      HelpContentModel? helpContent = HelpContentModel([], []);
      List<CommonQuestionsContentModel>? commonQuestionsContent = [];

      HelpSupportModel model = HelpSupportModel(
        helpContent,
        commonQuestionsContent,
        '',
        '',
      );

      inputState.add(ContentState());

      inputHelpSupport.add(model);
    }, (helpSupport) {
      // right -> data (success) --> content

      // save user data in local storage
      inputHelpSupport.add(helpSupport);
      inputState.add(ContentState());
    });
  }

  deleteUserId(int userId, BuildContext context) async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.popupLoadingState),
    );

    (await _deleteUseCase.execute(userId)).fold((failure) {
      inputState.add(
        ErrorState(StateRendererType.popupErrorState, failure.message),
      );
    }, (response) {
      debugPrint('User deleted successfully');

      inputState.add(ContentState());
      inputDeleteUser.add(response);

      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.goStartView,
        (route) => false,
      );
    });
  }
}

abstract class ProfileViewModelInputs {
  setUserName(String userName);

  setUserEmail(String email);

  setUserMobile(String mobile);

  setPassword(String password);

  setNewPassword(String password);

  setNewConfirmPassword(String password);

  Sink get inputUserName;

  Sink get inputUserEmail;

  Sink get inputUserMobile;

  Sink get inputUserPassword;

  Sink get inputUserNewPassword;

  Sink get inputUserConfirmNewPassword;

  Sink get inputAreAllDataValid;

  Sink get inputProfileDataObject;

  Sink get inputPasswordProfileUpdate;

  Sink get inputImageProfile;

  Sink get inputHelpSupport;

  Sink get inputDeleteUser;
}

abstract class ProfileViewModelOutputs {
  Stream<bool> get outIsUserNameValid;

  Stream<bool> get outIsUserEmailValid;

  Stream<bool> get outIsUserMobileValid;

  Stream<bool> get outIsUserPasswordValid;

  Stream<bool> get outIsUserNewPasswordValid;

  Stream<bool> get outIsUserConfirmNewPasswordValid;

  Stream<bool> get outIAreAllDataValid;

  Stream<bool> get outPasswordProfileUpdate;

  Stream<ProfileObject> get outProfileDataObject;

  Stream<File> get outImageProfile;

  Stream<HelpSupportModel> get outputHelpSupport;

  Stream<String> get outputDeleteUser;
}

class UserDataObject {
  String userName;
  String email;
  String mobile;
  String profileImage;

  UserDataObject(this.mobile, this.userName, this.email, this.profileImage);
}
