import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/login/login_model.dart';
import 'package:gamification/domain/usecase/login_usecase.dart';
import 'package:gamification/presentation/base/base_view_model.dart';
import 'package:gamification/presentation/common/freezed_data_classes.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelOutputs, LoginViewModelInputs {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _arAllInputsValidStreamController =
      StreamController<void>.broadcast();
  StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController();
  var loginObject = LoginObject("", "");
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
    _passwordStreamController.close();
    _arAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  /// inputs
  @override
  Sink get inputAreAllDataValid => _arAllInputsValidStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserEmail => _emailStreamController.sink;

  /// outputs
  @override
  Stream<bool> get outIAreAllDataValid =>
      _arAllInputsValidStreamController.stream.map((_) => areAllInputsValid());

  @override
  Stream<bool> get outIsUserEmailValid =>
      _emailStreamController.stream.map((email) => _isUserEmailValid(email));

  @override
  Stream<bool> get outIsUserPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  login(BuildContext context) async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.popupLoadingState),
    );

    (await _loginUseCase.execute(
      LoginRequest(
        accountEmail: loginObject.email,
        accountPassword: loginObject.password,
      ),
    ))
        .fold(
            (failure) => {
                  // left -> failure
                  Navigator.of(context, rootNavigator: true).pop(true),

                  inputState.add(
                    ErrorState(
                      StateRendererType.popupErrorState,
                      failure.message,
                    ),
                  )
                }, (data) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      // save user data in local storage
      _saveUserDataLocal(data);
    });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllDataValid.add(null);
  }

  @override
  setUserEmail(String email) {
    inputUserEmail.add(email);
    loginObject = loginObject.copyWith(email: email);
    inputAreAllDataValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserEmailValid(String code) {
    return code.isNotEmpty;
  }

  bool areAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserEmailValid(loginObject.email);
  }

  _saveUserDataLocal(LoginModel data) {
    AppPreferences appPreferences = instance<AppPreferences>();
    appPreferences.setUserLoggedIn(true);
    appPreferences.setUserId(data.yearId);
    appPreferences.setStudentId(data.studentId);
    appPreferences.setUserId(data.userId);
    appPreferences.setUserArName(data.userArName);
    appPreferences.setUserEduYear(data.userEduYear);
    appPreferences.setUserStage(data.userStage);
    appPreferences.setUserPicture(data.userPicture);
    appPreferences.setUserTypeId(data.userTypeId);
    appPreferences.setUserTypeArName(data.userTypeArName);
    appPreferences.setUserToken(data.authToken!.token);
    appPreferences.setRoleId(data.authToken!.roleId);
    appPreferences.setTypeId(data.authToken!.typeId);
    appPreferences.setUserFlashNum(data.loginCounter);
    appPreferences.setUserGimNum(data.totallPoints.toInt());
    log(appPreferences.getUserEduYear().toString());
    resetModules();
    // make user logged before in local data
    isUserLoggedInSuccessfullyStreamController.add(true);
  }
}

abstract class LoginViewModelInputs {
  setUserEmail(String email);

  setPassword(String password);

  login(BuildContext context);

  Sink get inputUserEmail;

  Sink get inputPassword;

  Sink get inputAreAllDataValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsUserEmailValid;

  Stream<bool> get outIsUserPasswordValid;

  Stream<bool> get outIAreAllDataValid;
}
