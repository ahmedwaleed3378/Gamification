// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginObjectCopyWith(
          _$_LoginObject value, $Res Function(_$_LoginObject) then) =
      __$$_LoginObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_LoginObjectCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$_LoginObject>
    implements _$$_LoginObjectCopyWith<$Res> {
  __$$_LoginObjectCopyWithImpl(
      _$_LoginObject _value, $Res Function(_$_LoginObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_LoginObject(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginObject &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      __$$_LoginObjectCopyWithImpl<_$_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String email, final String password) =
      _$_LoginObject;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterObject {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get passwordConfirm => throw _privateConstructorUsedError;
  String get arname => throw _privateConstructorUsedError;
  String get mobileNumber =>
      throw _privateConstructorUsedError; // String parentMobileNumber,
// String parentName,
  int get userTypeId => throw _privateConstructorUsedError;
  int get stageId => throw _privateConstructorUsedError;
  int get eduYearId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterObjectCopyWith<RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterObjectCopyWith<$Res> {
  factory $RegisterObjectCopyWith(
          RegisterObject value, $Res Function(RegisterObject) then) =
      _$RegisterObjectCopyWithImpl<$Res, RegisterObject>;
  @useResult
  $Res call(
      {String email,
      String password,
      String passwordConfirm,
      String arname,
      String mobileNumber,
      int userTypeId,
      int stageId,
      int eduYearId});
}

/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res, $Val extends RegisterObject>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? passwordConfirm = null,
    Object? arname = null,
    Object? mobileNumber = null,
    Object? userTypeId = null,
    Object? stageId = null,
    Object? eduYearId = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirm: null == passwordConfirm
          ? _value.passwordConfirm
          : passwordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
      arname: null == arname
          ? _value.arname
          : arname // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userTypeId: null == userTypeId
          ? _value.userTypeId
          : userTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      stageId: null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as int,
      eduYearId: null == eduYearId
          ? _value.eduYearId
          : eduYearId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterObjectCopyWith<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  factory _$$_RegisterObjectCopyWith(
          _$_RegisterObject value, $Res Function(_$_RegisterObject) then) =
      __$$_RegisterObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String passwordConfirm,
      String arname,
      String mobileNumber,
      int userTypeId,
      int stageId,
      int eduYearId});
}

/// @nodoc
class __$$_RegisterObjectCopyWithImpl<$Res>
    extends _$RegisterObjectCopyWithImpl<$Res, _$_RegisterObject>
    implements _$$_RegisterObjectCopyWith<$Res> {
  __$$_RegisterObjectCopyWithImpl(
      _$_RegisterObject _value, $Res Function(_$_RegisterObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? passwordConfirm = null,
    Object? arname = null,
    Object? mobileNumber = null,
    Object? userTypeId = null,
    Object? stageId = null,
    Object? eduYearId = null,
  }) {
    return _then(_$_RegisterObject(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == passwordConfirm
          ? _value.passwordConfirm
          : passwordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
      null == arname
          ? _value.arname
          : arname // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == userTypeId
          ? _value.userTypeId
          : userTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as int,
      null == eduYearId
          ? _value.eduYearId
          : eduYearId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RegisterObject implements _RegisterObject {
  _$_RegisterObject(
      this.email,
      this.password,
      this.passwordConfirm,
      this.arname,
      this.mobileNumber,
      this.userTypeId,
      this.stageId,
      this.eduYearId);

  @override
  final String email;
  @override
  final String password;
  @override
  final String passwordConfirm;
  @override
  final String arname;
  @override
  final String mobileNumber;
// String parentMobileNumber,
// String parentName,
  @override
  final int userTypeId;
  @override
  final int stageId;
  @override
  final int eduYearId;

  @override
  String toString() {
    return 'RegisterObject(email: $email, password: $password, passwordConfirm: $passwordConfirm, arname: $arname, mobileNumber: $mobileNumber, userTypeId: $userTypeId, stageId: $stageId, eduYearId: $eduYearId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterObject &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirm, passwordConfirm) ||
                other.passwordConfirm == passwordConfirm) &&
            (identical(other.arname, arname) || other.arname == arname) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.userTypeId, userTypeId) ||
                other.userTypeId == userTypeId) &&
            (identical(other.stageId, stageId) || other.stageId == stageId) &&
            (identical(other.eduYearId, eduYearId) ||
                other.eduYearId == eduYearId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, passwordConfirm,
      arname, mobileNumber, userTypeId, stageId, eduYearId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      __$$_RegisterObjectCopyWithImpl<_$_RegisterObject>(this, _$identity);
}

abstract class _RegisterObject implements RegisterObject {
  factory _RegisterObject(
      final String email,
      final String password,
      final String passwordConfirm,
      final String arname,
      final String mobileNumber,
      final int userTypeId,
      final int stageId,
      final int eduYearId) = _$_RegisterObject;

  @override
  String get email;
  @override
  String get password;
  @override
  String get passwordConfirm;
  @override
  String get arname;
  @override
  String get mobileNumber;
  @override // String parentMobileNumber,
// String parentName,
  int get userTypeId;
  @override
  int get stageId;
  @override
  int get eduYearId;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileObject {
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get confirmNewPassword => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;
  double get totalPoints => throw _privateConstructorUsedError;
  int get loginCounter => throw _privateConstructorUsedError;
  String get stage => throw _privateConstructorUsedError;
  String get academicYear => throw _privateConstructorUsedError;
  bool get isEduYearEditable => throw _privateConstructorUsedError;
  int get eduYearId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileObjectCopyWith<ProfileObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileObjectCopyWith<$Res> {
  factory $ProfileObjectCopyWith(
          ProfileObject value, $Res Function(ProfileObject) then) =
      _$ProfileObjectCopyWithImpl<$Res, ProfileObject>;
  @useResult
  $Res call(
      {String userName,
      String email,
      String mobile,
      String password,
      String newPassword,
      String confirmNewPassword,
      String profilePicture,
      double totalPoints,
      int loginCounter,
      String stage,
      String academicYear,
      bool isEduYearEditable,
      int eduYearId});
}

/// @nodoc
class _$ProfileObjectCopyWithImpl<$Res, $Val extends ProfileObject>
    implements $ProfileObjectCopyWith<$Res> {
  _$ProfileObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? email = null,
    Object? mobile = null,
    Object? password = null,
    Object? newPassword = null,
    Object? confirmNewPassword = null,
    Object? profilePicture = null,
    Object? totalPoints = null,
    Object? loginCounter = null,
    Object? stage = null,
    Object? academicYear = null,
    Object? isEduYearEditable = null,
    Object? eduYearId = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmNewPassword: null == confirmNewPassword
          ? _value.confirmNewPassword
          : confirmNewPassword // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as double,
      loginCounter: null == loginCounter
          ? _value.loginCounter
          : loginCounter // ignore: cast_nullable_to_non_nullable
              as int,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      academicYear: null == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String,
      isEduYearEditable: null == isEduYearEditable
          ? _value.isEduYearEditable
          : isEduYearEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      eduYearId: null == eduYearId
          ? _value.eduYearId
          : eduYearId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileObjectCopyWith<$Res>
    implements $ProfileObjectCopyWith<$Res> {
  factory _$$_ProfileObjectCopyWith(
          _$_ProfileObject value, $Res Function(_$_ProfileObject) then) =
      __$$_ProfileObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String email,
      String mobile,
      String password,
      String newPassword,
      String confirmNewPassword,
      String profilePicture,
      double totalPoints,
      int loginCounter,
      String stage,
      String academicYear,
      bool isEduYearEditable,
      int eduYearId});
}

/// @nodoc
class __$$_ProfileObjectCopyWithImpl<$Res>
    extends _$ProfileObjectCopyWithImpl<$Res, _$_ProfileObject>
    implements _$$_ProfileObjectCopyWith<$Res> {
  __$$_ProfileObjectCopyWithImpl(
      _$_ProfileObject _value, $Res Function(_$_ProfileObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? email = null,
    Object? mobile = null,
    Object? password = null,
    Object? newPassword = null,
    Object? confirmNewPassword = null,
    Object? profilePicture = null,
    Object? totalPoints = null,
    Object? loginCounter = null,
    Object? stage = null,
    Object? academicYear = null,
    Object? isEduYearEditable = null,
    Object? eduYearId = null,
  }) {
    return _then(_$_ProfileObject(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == confirmNewPassword
          ? _value.confirmNewPassword
          : confirmNewPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as double,
      null == loginCounter
          ? _value.loginCounter
          : loginCounter // ignore: cast_nullable_to_non_nullable
              as int,
      null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      null == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String,
      null == isEduYearEditable
          ? _value.isEduYearEditable
          : isEduYearEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      null == eduYearId
          ? _value.eduYearId
          : eduYearId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ProfileObject implements _ProfileObject {
  _$_ProfileObject(
      this.userName,
      this.email,
      this.mobile,
      this.password,
      this.newPassword,
      this.confirmNewPassword,
      this.profilePicture,
      this.totalPoints,
      this.loginCounter,
      this.stage,
      this.academicYear,
      this.isEduYearEditable,
      this.eduYearId);

  @override
  final String userName;
  @override
  final String email;
  @override
  final String mobile;
  @override
  final String password;
  @override
  final String newPassword;
  @override
  final String confirmNewPassword;
  @override
  final String profilePicture;
  @override
  final double totalPoints;
  @override
  final int loginCounter;
  @override
  final String stage;
  @override
  final String academicYear;
  @override
  final bool isEduYearEditable;
  @override
  final int eduYearId;

  @override
  String toString() {
    return 'ProfileObject(userName: $userName, email: $email, mobile: $mobile, password: $password, newPassword: $newPassword, confirmNewPassword: $confirmNewPassword, profilePicture: $profilePicture, totalPoints: $totalPoints, loginCounter: $loginCounter, stage: $stage, academicYear: $academicYear, isEduYearEditable: $isEduYearEditable, eduYearId: $eduYearId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileObject &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmNewPassword, confirmNewPassword) ||
                other.confirmNewPassword == confirmNewPassword) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.loginCounter, loginCounter) ||
                other.loginCounter == loginCounter) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.academicYear, academicYear) ||
                other.academicYear == academicYear) &&
            (identical(other.isEduYearEditable, isEduYearEditable) ||
                other.isEduYearEditable == isEduYearEditable) &&
            (identical(other.eduYearId, eduYearId) ||
                other.eduYearId == eduYearId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userName,
      email,
      mobile,
      password,
      newPassword,
      confirmNewPassword,
      profilePicture,
      totalPoints,
      loginCounter,
      stage,
      academicYear,
      isEduYearEditable,
      eduYearId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileObjectCopyWith<_$_ProfileObject> get copyWith =>
      __$$_ProfileObjectCopyWithImpl<_$_ProfileObject>(this, _$identity);
}

abstract class _ProfileObject implements ProfileObject {
  factory _ProfileObject(
      final String userName,
      final String email,
      final String mobile,
      final String password,
      final String newPassword,
      final String confirmNewPassword,
      final String profilePicture,
      final double totalPoints,
      final int loginCounter,
      final String stage,
      final String academicYear,
      final bool isEduYearEditable,
      final int eduYearId) = _$_ProfileObject;

  @override
  String get userName;
  @override
  String get email;
  @override
  String get mobile;
  @override
  String get password;
  @override
  String get newPassword;
  @override
  String get confirmNewPassword;
  @override
  String get profilePicture;
  @override
  double get totalPoints;
  @override
  int get loginCounter;
  @override
  String get stage;
  @override
  String get academicYear;
  @override
  bool get isEduYearEditable;
  @override
  int get eduYearId;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileObjectCopyWith<_$_ProfileObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PictureObject {
  String get base64 => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get lastModified => throw _privateConstructorUsedError;
  String get lastModifiedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PictureObjectCopyWith<PictureObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureObjectCopyWith<$Res> {
  factory $PictureObjectCopyWith(
          PictureObject value, $Res Function(PictureObject) then) =
      _$PictureObjectCopyWithImpl<$Res, PictureObject>;
  @useResult
  $Res call(
      {String base64,
      String name,
      int size,
      String type,
      int lastModified,
      String lastModifiedDate});
}

/// @nodoc
class _$PictureObjectCopyWithImpl<$Res, $Val extends PictureObject>
    implements $PictureObjectCopyWith<$Res> {
  _$PictureObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64 = null,
    Object? name = null,
    Object? size = null,
    Object? type = null,
    Object? lastModified = null,
    Object? lastModifiedDate = null,
  }) {
    return _then(_value.copyWith(
      base64: null == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as int,
      lastModifiedDate: null == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PictureObjectCopyWith<$Res>
    implements $PictureObjectCopyWith<$Res> {
  factory _$$_PictureObjectCopyWith(
          _$_PictureObject value, $Res Function(_$_PictureObject) then) =
      __$$_PictureObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String base64,
      String name,
      int size,
      String type,
      int lastModified,
      String lastModifiedDate});
}

/// @nodoc
class __$$_PictureObjectCopyWithImpl<$Res>
    extends _$PictureObjectCopyWithImpl<$Res, _$_PictureObject>
    implements _$$_PictureObjectCopyWith<$Res> {
  __$$_PictureObjectCopyWithImpl(
      _$_PictureObject _value, $Res Function(_$_PictureObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64 = null,
    Object? name = null,
    Object? size = null,
    Object? type = null,
    Object? lastModified = null,
    Object? lastModifiedDate = null,
  }) {
    return _then(_$_PictureObject(
      null == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as int,
      null == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PictureObject implements _PictureObject {
  _$_PictureObject(this.base64, this.name, this.size, this.type,
      this.lastModified, this.lastModifiedDate);

  @override
  final String base64;
  @override
  final String name;
  @override
  final int size;
  @override
  final String type;
  @override
  final int lastModified;
  @override
  final String lastModifiedDate;

  @override
  String toString() {
    return 'PictureObject(base64: $base64, name: $name, size: $size, type: $type, lastModified: $lastModified, lastModifiedDate: $lastModifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PictureObject &&
            (identical(other.base64, base64) || other.base64 == base64) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, base64, name, size, type, lastModified, lastModifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PictureObjectCopyWith<_$_PictureObject> get copyWith =>
      __$$_PictureObjectCopyWithImpl<_$_PictureObject>(this, _$identity);
}

abstract class _PictureObject implements PictureObject {
  factory _PictureObject(
      final String base64,
      final String name,
      final int size,
      final String type,
      final int lastModified,
      final String lastModifiedDate) = _$_PictureObject;

  @override
  String get base64;
  @override
  String get name;
  @override
  int get size;
  @override
  String get type;
  @override
  int get lastModified;
  @override
  String get lastModifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$_PictureObjectCopyWith<_$_PictureObject> get copyWith =>
      throw _privateConstructorUsedError;
}
