import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/app/functions.dart';
import 'package:gamification/domain/usecase/check_mobile_email_usecase.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/base/base_view_model.dart';

import 'package:gamification/presentation/common/freezed_data_classes.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rxdart/rxdart.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../../data/network/requests.dart';
import '../../../domain/model/register/register_model.dart';
import '../../../domain/usecase/get_all_eduyears_id.dart';
import '../../../domain/usecase/get_all_stages.dart';
import '../../../domain/usecase/register_usecase.dart';
import '../../common/state_rendrer/state_renderer.dart';
import '../../common/state_rendrer/state_renderer_impl.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInput, RegisterViewModelOutput {
  StreamController userNameStreamController =
      StreamController<String>.broadcast();
  StreamController secondNameStreamController =
      StreamController<String>.broadcast();

  StreamController confirmPassStreamController =
      StreamController<String>.broadcast();

  // StreamController parentMobileNumberStreamController =
  //     StreamController<String>.broadcast();
  final StreamController stagesIDStreamController =
      BehaviorSubject<List<AllStagesModel>>();
  final StreamController eduYearsIDStreamController =
      BehaviorSubject<AllEduYearsModel>();

  // StreamController parentNameStreamController =
  //     StreamController<String>.broadcast();

  StreamController mobileNumberStreamController =
      StreamController<String>.broadcast();

  StreamController emailStreamController = StreamController<String>.broadcast();

  StreamController passwordStreamController =
      StreamController<String>.broadcast();

  StreamController areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  StreamController isUserRegisteredSuccessfullyStreamController =
      StreamController<bool>();
  final RegisterUseCase _registerUseCase;
  final GetAllStagesUseCase allStagesUseCase;
  final GetAllEduYearsIdUseCase allEduYearsIdUseCase;
  final CheckMobileEmailUsecase _checkMobileEmailUsecase;
  var registerObject = RegisterObject(
    '',
    '',
    '',
    '',
    '',
    // '',
    // '',
    2,
    0,
    0,
  );
  int stage = -1;

  bool register1Nav = false;
  bool register2Nav = false;
  bool register3Nav = false;
  bool register4Nav = false;
  bool register5Nav = false;
  bool register6Nav = false;
  bool register7Nav = false;
  bool register8Nav = false;
  bool register9Nav = false;

  RegisterViewModel(this._registerUseCase, this.allStagesUseCase,
      this.allEduYearsIdUseCase, this._checkMobileEmailUsecase);

  // inputs
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    userNameStreamController.close();
    stagesIDStreamController.close();
    eduYearsIDStreamController.close();
    mobileNumberStreamController.close();
    emailStreamController.close();
    // parentMobileNumberStreamController.close();
    // parentNameStreamController.close();
    passwordStreamController.close();
    confirmPassStreamController.close();
    areAllInputsValidStreamController.close();
    isUserRegisteredSuccessfullyStreamController.close();
    super.dispose();
  }

  ///Inputs

  @override
  Sink get inputConfirmPass => confirmPassStreamController.sink;

  @override
  Sink get inputAllStagesID => stagesIDStreamController.sink;

  @override
  Sink get inputAllEduYearsID => eduYearsIDStreamController.sink;

  // @override
  // Sink get inputParentMobileNumber => parentMobileNumberStreamController.sink;

  // @override
  // Sink get inputParentName => parentNameStreamController.sink;

  @override
  Sink get inputEmail => emailStreamController.sink;

  @override
  Sink get inputMobileNumber => mobileNumberStreamController.sink;

  @override
  Sink get inputPassword => passwordStreamController.sink;

  @override
  Sink get inputUserName => userNameStreamController.sink;

  @override
  Sink get inputAllInputsValid => areAllInputsValidStreamController.sink;

  @override
  register(BuildContext context) async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));

    (await _registerUseCase.execute(
      RegisterRequest(
        userTypeId: 2,
        arName: registerObject.arname,
        mobile: registerObject.mobileNumber,
        accountEmail: registerObject.email,
        accountPassword: registerObject.password,
        confirmPassword: registerObject.passwordConfirm,
        stageID: registerObject.stageId,
        eduYearID: registerObject.eduYearId,
        // parentName: registerObject.parentName,
        // parentPhoneNumber: registerObject.parentMobileNumber,
      ),
    ))
        .fold((failure) {
      {
        // left -> failure
        Navigator.of(context, rootNavigator: true).pop(true);
        inputState.add(
          ErrorState(StateRendererType.popupErrorState, failure.message),
        );
      }
    }, (data) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      _saveUserDataLocal(data, context);
    });
  }

  @override
  checkEmailOrPhone(String email, String phone, PageController pageController,
      BuildContext context) async {
    // inputState.add(
    //     LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    String errorMsg = "";

    (await _checkMobileEmailUsecase.execute(
      EmailMobileRequest(emailMobile: email, mobile: phone),
    ))
        .fold(
      (failure) {
        {
          // left -> failure
          inputState.add(
              ErrorState(StateRendererType.popupErrorState, failure.message));
        }
      },
      (data) {
        // right -> data (success)
        log('worksssssssssssssssss');
        // content
        inputState.add(ContentState());

        if (data.isEmailExist && !data.isMobileExist) {
          errorMsg = LocaleKeys.emailExist.tr();
        } else if (!data.isEmailExist && data.isMobileExist) {
          errorMsg = LocaleKeys.phoneExist.tr();
        } else if (data.isEmailExist && data.isMobileExist) {
          errorMsg = LocaleKeys.emailExist.tr() + LocaleKeys.phoneExist.tr();
        } else {
          pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut);
        }
      },
    );

    if (errorMsg.isNotEmpty) {
       log('worksssssssssssssssss2');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMsg,
            style: getMediumDINNextStyle(
                color: ColorManager.white, fontSize: AppSize.s19.sp),
          ),
          backgroundColor: ColorManager.red,
        ),
      );
    }
  }

  getStages(String lang) async {
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
    (await allEduYearsIdUseCase.execute(stageID)).fold((failure) {
      {
        // left -> failure
        inputState.add(
            ErrorState(StateRendererType.popupErrorState, failure.message));
      }
    }, (data) {
      // right -> data (success)
      // content
      inputAllEduYearsID.add(data);
      inputState.add(ContentState());
      inputAllEduYearsID.add(data);
    });
  }

  _saveUserDataLocal(RegisterModel data, BuildContext context) async {
    AppPreferences appPreferences = instance<AppPreferences>();
    appPreferences.setUserLoggedIn(true);
    appPreferences.setUserId(data.userTypeId);
    appPreferences.setUserId(data.userId);
    appPreferences.setUserArName(data.userArName);
    appPreferences.setUserPicture(data.userPicture);
    appPreferences.setUserTypeId(data.userTypeId);
    appPreferences.setUserTypeArName(data.userTypeArName);
    appPreferences.setUserToken(data.token!.token);
    appPreferences.setRoleId(data.token!.roleId);
    appPreferences.setTypeId(data.token!.typeId);
    appPreferences.setUserEduYear(data.userEduYaer);
    appPreferences.setUserStage(data.userStage);
    appPreferences.setUserFlashNum(0);
    appPreferences.setUserGimNum(0);

    resetModules();
    isUserRegisteredSuccessfullyStreamController.add(true);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    if (isValidName(userName)) {
      //  update register view object
      registerObject = registerObject.copyWith(arname: userName);
    } else {
      // reset username value in register view object
      registerObject = registerObject.copyWith(arname: "");
    }
    validate();
  }

  // @override
  // setParentMobileNumber(String parentMobileNumber) {
  //   inputParentMobileNumber.add(parentMobileNumber);
  //   if (parentMobileNumber.isNotEmpty && parentMobileNumber.length > 10) {
  //     //  update register view object
  //     registerObject =
  //         registerObject.copyWith(parentMobileNumber: parentMobileNumber);
  //   } else {
  //     // reset code value in register view object
  //     registerObject = registerObject.copyWith(parentMobileNumber: "");
  //   }
  //   validate();
  // }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if (isEmailValid(email)) {
      //  update register view object
      registerObject = registerObject.copyWith(email: email);
    } else {
      // reset email value in register view object
      registerObject = registerObject.copyWith(email: "");
    }
    validate();
  }

  @override
  setMobileNumber(String mobileNumber) {
    inputMobileNumber.add(mobileNumber);
    if (isMobileNumberValid(mobileNumber)) {
      //  update register view object
      registerObject = registerObject.copyWith(mobileNumber: mobileNumber);
    } else {
      // reset mobileNumber value in register view object
      registerObject = registerObject.copyWith(mobileNumber: "");
    }
    validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if (_isPasswordValid(password)) {
      //  update register view object
      registerObject = registerObject.copyWith(password: password);
    } else {
      // reset password value in register view object
      registerObject = registerObject.copyWith(password: "");
    }
    validate();
  }

  // @override
  // setParentName(String parentname) {
  //   if (isValidName(parentname)) {
  //     inputParentName.add(parentname);
  //     registerObject = registerObject.copyWith(parentName: parentname);
  //     inputAllInputsValid.add(null);
  //   }
  //   validate();
  // }

  @override
  setConfirmPassword(String passwordConfirm) {
    if (isPassMatched(passwordConfirm)) {
      inputConfirmPass.add(passwordConfirm);
      registerObject =
          registerObject.copyWith(passwordConfirm: passwordConfirm);
      inputAllInputsValid.add(null);
    }
    validate();
  }

  ///Outputs

  ///username

  @override
  Stream<bool> get outputIsUserNameValid =>
      userNameStreamController.stream.map((userName) => isValidName(userName));

  @override
  Stream<String?> get outputErrorUserName => outputIsUserNameValid.map(
        (isUserName) => isUserName ? null : LocaleKeys.userNameInvalid.tr(),
      );

//email

  @override
  Stream<bool> get outputIsEmailValid => emailStreamController.stream.map(
        (email) => isEmailValid(email),
      );

  @override
  Stream<String?> get outputErrorEmail => outputIsEmailValid.map(
        (isEmailValid) => isEmailValid ? null : LocaleKeys.emailNotValid.tr(),
      );

  //mobile

  @override
  Stream<bool> get outputIsMobileNumberValid =>
      mobileNumberStreamController.stream
          .map((mobileNumber) => isMobileNumberValid(mobileNumber));

  @override
  Stream<String?> get outputErrorMobileNumber => outputIsMobileNumberValid.map(
        (isMobileNumberValid) =>
            isMobileNumberValid ? null : LocaleKeys.mobileNumNotValid.tr(),
      );

  //parent phone

  // @override
  // Stream<bool> get outputIsParentMobileNumberValid =>
  //     parentMobileNumberStreamController.stream
  //         .map((mobileNumber) => isMobileNumberValid(mobileNumber));

  // @override
  // Stream<String?> get outputErrorParentMobileNumber =>
  //     outputIsParentMobileNumberValid.map(
  //       (isMobileNumberValid) =>
  //           isMobileNumberValid ? null : LocaleKeys.mobileNumNotValid.tr(),
  //     );

  //pass

  @override
  Stream<bool> get outputIsPasswordValid => passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword => outputIsPasswordValid.map(
        (isPasswordValid) =>
            isPasswordValid ? null : LocaleKeys.passIsNotValid.tr(),
      );

//confirm pass

  @override
  Stream<bool> get outputIsConfirmPasswordValid =>
      confirmPassStreamController.stream
          .map((password) => isPassMatched(password));

  @override
  Stream<String?> get outputErrorConfirmPassword =>
      outputIsConfirmPasswordValid.map(
        (isPasswordValid) =>
            isPasswordValid ? null : LocaleKeys.passIsNotValid.tr(),
      );

  //parent name

  // @override
  // Stream<bool> get outputIsParentNameValid =>
  //     parentNameStreamController.stream.map((event) => isValidName(event));

  // @override
  // Stream<String?> get outputErrorParentName => outputIsParentNameValid.map(
  //       (event) => event ? null : LocaleKeys.parentNameCannt.tr(),
  //     );

  @override
  Stream<List<AllStagesModel>> get outStagesDataStream =>
      stagesIDStreamController.stream.map((event) => event);

  @override
  Stream<AllEduYearsModel> get outEduYearsDataStream =>
      eduYearsIDStreamController.stream.map((event) => event);

//all inputs

  @override
  Stream<bool> get outputAreAllInputsValid =>
      areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  // --  private functions

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }

  bool isPassMatched(String passwordConfirm) {
    return //passwordConfirm.isNotEmpty &&
        registerObject.password == passwordConfirm;
  }

  bool _areAllInputsValid() {
    return //registerObject.parentMobileNumber.isNotEmpty &&
        registerObject.mobileNumber.isNotEmpty &&
            //  registerObject.parentName.isNotEmpty &&/
            registerObject.arname.isNotEmpty &&
            registerObject.passwordConfirm.isNotEmpty &&
            registerObject.email.isNotEmpty &&
            registerObject.password.isNotEmpty &&
            registerObject.stageId != 0 &&
            registerObject.eduYearId != 0;
  }

  validate() {
    inputAllInputsValid.add(null);
  }

  @override
  setEduYearId(int eduYearId) {
    registerObject = registerObject.copyWith(eduYearId: eduYearId);
    inputAllInputsValid.add(null);
  }

  @override
  setStageId(int stageId) {
    registerObject = registerObject.copyWith(stageId: stageId);
    inputAllInputsValid.add(null);
  }
}

abstract class RegisterViewModelInput {
  Sink get inputUserName;

  Sink get inputAllStagesID;

  Sink get inputAllEduYearsID;

  Sink get inputMobileNumber;

  Sink get inputEmail;

  Sink get inputPassword;

  // Sink get inputParentMobileNumber;

  // Sink get inputParentName;

  Sink get inputConfirmPass;

  Sink get inputAllInputsValid;

  register(BuildContext contex);

  setUserName(String userName);

  setMobileNumber(String mobileNumber);

  // setParentMobileNumber(String parentMobileNumber);

  // setParentName(String parentname);

  setEmail(String email);

  setPassword(String password);

  setConfirmPassword(String passwordConfirm);

  setStageId(int stageId);

  setEduYearId(int eduYearId);

  checkEmailOrPhone(String email, String phone, PageController pageController,
      BuildContext context);
}

abstract class RegisterViewModelOutput {
  Stream<bool> get outputIsUserNameValid;

  Stream<String?> get outputErrorUserName;

  Stream<bool> get outputIsMobileNumberValid;

  Stream<String?> get outputErrorMobileNumber;

  // Stream<bool> get outputIsParentMobileNumberValid;

  // Stream<String?> get outputErrorParentMobileNumber;

  // Stream<bool> get outputIsParentNameValid;

  // Stream<String?> get outputErrorParentName;

  Stream<bool> get outputIsEmailValid;

  Stream<String?> get outputErrorEmail;

  Stream<bool> get outputIsPasswordValid;

  Stream<String?> get outputErrorPassword;

  Stream<bool> get outputIsConfirmPasswordValid;

  Stream<String?> get outputErrorConfirmPassword;

  Stream<bool> get outputAreAllInputsValid;

  Stream<List<AllStagesModel>> get outStagesDataStream;

  Stream<AllEduYearsModel> get outEduYearsDataStream;
}
