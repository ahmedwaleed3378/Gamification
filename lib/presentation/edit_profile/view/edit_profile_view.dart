import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/freezed_data_classes.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/profile/viewmodel/profile_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/profile_photo_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/functions.dart';
import '../../../domain/model/register/register_model.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../widget/custom_button.dart';
import 'edit_pass.dart';

class EditProfileView extends StatefulWidget {
  final Function logoutFunc;

  const EditProfileView({Key? key, required this.logoutFunc}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  bool showPassword = true;
  bool isStageSelected = false;

  final ProfileViewModel _profileViewModel = instance<ProfileViewModel>();
  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() async {
    _profileViewModel.start();
    //  String lang = await _appPreferences.getAppLanguage();
    _profileViewModel.getStages(
        // lang
        );

    _nameController
        .addListener(() => _profileViewModel.setUserName(_nameController.text));

    _mobileController.addListener(
        () => _profileViewModel.setUserMobile(_mobileController.text));

    _passwordController.addListener(
        () => _profileViewModel.setPassword(_passwordController.text));

    _emailController.addListener(
        () => _profileViewModel.setUserEmail(_emailController.text));

    _profileViewModel.profileDataModelStreamController.stream.listen((data) {
      _nameController.text = data.userName;
      _mobileController.text = data.mobile;
      _emailController.text = data.email;
    });
  }

  @override
  void dispose() {
    //  _profileViewModel.dispose();
    super.dispose();
  }

  bool visibleNewPassword = false;
  bool visibleEditPassword = true;
  EduYearModel? examEduModel;
  late String stage;
  String? academicYear;
  int eduYearID = -1;
  int stageID = -1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamed(Routes.profileRoute);
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorManager.dark,
        body: StreamBuilder<FlowState>(
          stream: _profileViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                  context,
                  _getContentWidget(),
                  () {
                    _profileViewModel.getProfile();
                  },
                ) ??
                _getContentWidget();
          },
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<ProfileObject>(
      stream: _profileViewModel.outProfileDataObject,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p3.w,
                  vertical: AppPadding.p2.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: AppSize.s1_5.h),
                    Row(
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: AppSize.s3.h,
                            color: ColorManager.terracota,
                          ),
                          onTap: () => Navigator.of(context)
                              .pushNamed(Routes.profileRoute),
                        ),
                        Expanded(
                          child: Text(
                            LocaleKeys.editProfile.tr(),
                            textAlign: TextAlign.center,
                            style: getRegularDINNextStyle(
                              color: ColorManager.terracota,
                              fontSize: AppSize.s20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.s1_5.h),
                    Center(
                      child: Stack(
                        children: [
                          StreamBuilder<File>(
                            stream: _profileViewModel.outImageProfile,
                            builder: (context, snapshotImage) {
                              if (snapshot.hasData) {
                                return ProfileWidget(
                                  photoSize: AppSize.s15.h,
                                  onTap: () {
                                    _profileViewModel.pickImage();
                                  },
                                  imageFileProfile: snapshotImage.data,
                                  networkImage: snapshot.data!.profilePicture,
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Padding(
                              padding: EdgeInsets.all(AppPadding.p1.h),
                              child: SvgPicture.asset(
                                ImageAssets.penIcons,
                                width: AppSize.s6.w,
                                height: AppSize.s6.w,
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSize.s1_5.h),
                    Card(
                      color: ColorManager.dark,
                      elevation: AppSize.s5,
                      shadowColor: ColorManager.dark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(
                          bottom:AppSize.s1_2.h
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p5.w,
                                  vertical: AppPadding.p1.h,
                                ),
                                child: Text(
                                  LocaleKeys.name.tr(),
                                  style: getRegularDINNextStyle(
                                    color: ColorManager.lightBlue,
                                    fontSize: AppSize.s18.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: StreamBuilder<bool>(
                                stream: _profileViewModel.outIsUserNameValid,
                                builder: (context, snapshot) {
                                  return TextField(
                                    keyboardType: TextInputType.name,
                                    controller: _nameController,
                                    textInputAction: TextInputAction.next,
                                    style: getRegularDINNextStyle(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s18.sp,
                                    ),
                                    cursorColor: ColorManager.orange,
                                    autofillHints: const [AutofillHints.name],
                                    decoration: InputDecoration(
                                      hintText: '',
                                      labelText:'',
                                      fillColor: ColorManager.charcoalGrey80,
                                      labelStyle: getRegularDINNextStyle(
                                        color: ColorManager.white,
                                        fontSize: AppSize.s18.sp,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s10,
                                        ),
                                        borderSide: BorderSide(
                                          color: ColorManager.charcoalGrey80,
                                        ),
                                      ),
                                      hintStyle: getRegularDINNextStyle(
                                        color: ColorManager.gray,
                                        fontSize: AppSize.s16.sp,
                                      ),
                                      suffixIcon: (snapshot.data ??
                                              false ||
                                                  _nameController.text.isNotEmpty)
                                          ? Icon(
                                              Icons.check,
                                              color: ColorManager.orange,
                                              size: AppSize.s2_5.h,
                                            )
                                          : null,
                                      errorText: (snapshot.data ?? true)
                                          ? null
                                          : LocaleKeys.userNameError.tr(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.s1.h),
                    Card(
                      color: ColorManager.dark,
                      elevation: AppSize.s5,
                      shadowColor: ColorManager.dark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                          bottom:AppSize.s09.h
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p5.w,
                                  vertical: AppPadding.p1.h,
                                ),
                                child: Text(
                                  LocaleKeys.mobile.tr(),
                                  style: getRegularDINNextStyle(
                                    color: ColorManager.lightBlue,
                                    fontSize: AppSize.s18.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: StreamBuilder<bool>(
                                stream: _profileViewModel.outIsUserMobileValid,
                                builder: (context, snapshot) {
                                  return TextField(
                                    keyboardType: TextInputType.phone,
                                    controller: _mobileController,
                                    textInputAction: TextInputAction.next,
                                    style: getRegularDINNextStyle(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s18.sp,
                                    ),
                                    cursorColor: ColorManager.orange,
                                    autofillHints: const [
                                      AutofillHints.telephoneNumber
                                    ],
                                    decoration: InputDecoration(
                                      hintText:'',
                                      labelText:'',
                                      fillColor: ColorManager.charcoalGrey80,
                                      labelStyle: getRegularDINNextStyle(
                                        color: ColorManager.white,
                                        fontSize: AppSize.s18.sp,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s10,
                                        ),
                                        borderSide: BorderSide(
                                          color: ColorManager.charcoalGrey80,
                                        ),
                                      ),
                                      hintStyle: getRegularDINNextStyle(
                                        color: ColorManager.gray,
                                        fontSize: AppSize.s16.sp,
                                      ),
                                      suffixIcon: (snapshot.data ??
                                              false ||
                                                  _mobileController
                                                      .text.isNotEmpty)
                                          ? Icon(
                                              Icons.check,
                                              color: ColorManager.orange,
                                              size: AppSize.s2_5.h,
                                            )
                                          : null,
                                      errorText: (snapshot.data ?? true)
                                          ? null
                                          : LocaleKeys.mobileError.tr(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.s1_5.h),
                    Card(
                      color: ColorManager.dark,
                      elevation: AppSize.s5,
                      shadowColor: ColorManager.dark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(
                          bottom:AppSize.s1_2.h
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p5.w,
                                  vertical: AppPadding.p1.h,
                                ),
                                child: Text(
                                  LocaleKeys.stage.tr(),
                                  style: getRegularDINNextStyle(
                                    color: ColorManager.lightBlue,
                                    fontSize: AppSize.s18.sp,
                                  ),
                                ),
                              ),
                            ),
                            snapshot.data!.isEduYearEditable
                                ? Container(
                                    width: AppSize.s55.w,
                                    alignment: Alignment.center,
                                    // padding: EdgeInsets.symmetric(
                                    //   horizontal: AppSize.s2.w,
                                    // ),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: AppSize.s2.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorManager.charcoalGrey80,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          offset: const Offset(0, 4),
                                          color: ColorManager.black
                                              .withOpacity(0.25),
                                          spreadRadius: 0.25,
                                          blurStyle: BlurStyle.inner,
                                        ),
                                      ],
                                    ),
                                    child: StreamBuilder<List<AllStagesModel>>(
                                      stream:
                                          _profileViewModel.outStagesDataStream,
                                      builder: (context, eduSnapshot) {
                                        if (eduSnapshot.hasData) {
                                          Set<AllStagesModel?> stages =
                                              eduSnapshot.data!.toSet();
                                          // stage = stages.any(
                                          //   (element) {
                                          //     return element!.stages!.arName ==
                                          //         stage;
                                          //   },
                                          // )
                                          //     ? stage
                                          //     : stages.first!.stages!.arName;
                                          return 
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              dropdownColor:
                                                  ColorManager.charcoalGrey80,
                                              elevation: AppSize.s3.toInt(),
                                              // hint: Container(
                                              //   alignment: Alignment.center,
                                              //   padding:
                                              //       EdgeInsets.all(AppSize.s05.h),
                                              //   margin:
                                              //       EdgeInsets.all(AppSize.s05.h),
                                              //   width: AppSize.s40.w,
                                              //   decoration: BoxDecoration(
                                              //     color:
                                              //         ColorManager.charcoalGrey,
                                              //     borderRadius:
                                              //         BorderRadius.circular(10),
                                              //   ),
                                              //   child: Text(
                                              //     snapshot.data!.stage,
                                              //     textAlign: TextAlign.start,
                                              //     style: getRegularDINNextStyle(
                                              //       color: ColorManager.white,
                                              //       fontSize: FontSize.s18.sp,
                                              //     ),
                                              //   ),
                                              // ),
                                              borderRadius: BorderRadius.circular(
                                                  AppSize.s10),
                                              onChanged: (String? data) {
                                                setState(() {
                                                  _profileViewModel.stage = data!;
                                                });
                                              },
                                              value: _profileViewModel.stage ??
                                                  snapshot.data!.stage,
                                              padding: const EdgeInsets.all(0),
                                              items: stages.map(
                                                (e) {
                                                  return DropdownMenuItem<String>(
                                                    value: e!.stages!.arName,
                                                    alignment: Alignment.center,
                                                    onTap: () {
                                                      _profileViewModel
                                                          .getEduYears(
                                                              e.stages!.id);
                                                      setState(() {
                                                        isStageSelected = true;
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      padding: EdgeInsets.all(
                                                          AppSize.s05.h),
                                                      margin: EdgeInsets.all(
                                                          AppSize.s05.h),
                                                      width: AppSize.s45.w,
                                                      decoration: BoxDecoration(
                                                        color: ColorManager
                                                            .charcoalGrey80,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                      ),
                                                      child: Text(
                                                        e.stages!.arName,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            getRegularDINNextStyle(
                                                          color:
                                                              ColorManager.white,
                                                          fontSize:
                                                              FontSize.s18.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          )
                                          ;
                                        } else {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: AppSize.s2.w,
                                              vertical: AppSize.s07.h,
                                            ),
                                            margin: EdgeInsets.symmetric(
                                              horizontal: AppSize.s2.w,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ColorManager.charcoalGrey80,
                                            ),
                                            child: Text(
                                              LocaleKeys.year.tr(),
                                              style: getRegularDINNextStyle(
                                                color: ColorManager.white,
                                                fontSize: FontSize.s18.sp,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  )
                                : Expanded(
                                    flex: 5,
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      readOnly: true,
                                      textInputAction: TextInputAction.none,
                                      style: getRegularDINNextStyle(
                                        color: ColorManager.white,
                                        fontSize: AppSize.s18.sp,
                                      ),
                                      cursorColor: ColorManager.orange,
                                      autofillHints: const [AutofillHints.email],
                                      decoration: InputDecoration(
                                        hintText: snapshot.data?.stage ?? '',
                                        //   labelText: LocaleKeys.stage.tr(),
                                        fillColor: ColorManager.charcoalGrey80,
                                        labelStyle: getRegularDINNextStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s18.sp,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            AppSize.s10,
                                          ),
                                          borderSide: BorderSide(
                                            color: ColorManager.charcoalGrey80,
                                          ),
                                        ),
                                        hintStyle: getRegularDINNextStyle(
                                          color: ColorManager.gray,
                                          fontSize: AppSize.s16.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                   
                    Card(
                      color: ColorManager.dark,
                      elevation: AppSize.s5,
                      shadowColor: ColorManager.dark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p5.w,
                                vertical: AppPadding.p1.h,
                              ),
                              child: Text(
                                LocaleKeys.academicYear.tr(),
                                style: getRegularDINNextStyle(
                                  color: ColorManager.lightBlue,
                                  fontSize: AppSize.s18.sp,
                                ),
                              ),
                            ),
                          ),
                          snapshot.data!.isEduYearEditable && isStageSelected
                              ? Container(
                                  width: AppSize.s57.w,
                                  // padding: EdgeInsets.symmetric(
                                  //   horizontal: AppSize.s2.w,
                                  // ),
                                  // margin: EdgeInsets.symmetric(
                                  //   horizontal: AppSize.s2.w,
                                  // ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorManager.charcoalGrey80,
                                    border: Border.all(
                                        color: ColorManager.charcoalGrey80),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                        color: ColorManager.black
                                            .withOpacity(0.25),
                                        spreadRadius: 0.25,
                                        blurStyle: BlurStyle.inner,
                                      ),
                                    ],
                                  ),
                                  child: StreamBuilder<AllEduYearsModel>(
                                    stream:
                                        _profileViewModel.outEduYearsDataStream,
                                    builder: (context, eduYearsnapshot) {
                                      if (eduYearsnapshot.hasData) {
                                        Set<EduYearModel?> eduYearset =
                                            eduYearsnapshot.data!.eduYears
                                                .toSet();
                      
                                        return DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            dropdownColor:
                                                ColorManager.charcoalGrey80,
                                            elevation: AppSize.s3.toInt(),
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s10),
                                            value: _profileViewModel.eduYaer
                      
                                            // _profileViewModel.eduYaer ??
                                            //     snapshot.data!.academicYear
                      
                                            ,
                                            onChanged: (String? data) {
                                              setState(() {
                                                _profileViewModel.eduYaer =
                                                    data!;
                                              });
                                            },
                                            padding: const EdgeInsets.all(0),
                                            items: eduYearset.map(
                                              (e) {
                                                return DropdownMenuItem<String>(
                                                  value: e!.arName,
                                                  alignment: Alignment.center,
                                                  onTap: () {
                                                    eduYearID = e.id;
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding: EdgeInsets.all(
                                                        AppSize.s05.h),
                                                    margin: EdgeInsets.all(
                                                        AppSize.s05.h),
                                                    width: AppSize.s47.w,
                                                    decoration: BoxDecoration(
                                                      color: ColorManager
                                                          .charcoalGrey80,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Text(
                                                      e.arName,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          getRegularDINNextStyle(
                                                        color:
                                                            ColorManager.white,
                                                        fontSize:
                                                            FontSize.s16.sp,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: AppSize.s2.w,
                                            vertical: AppSize.s05.h,
                                          ),
                      
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: ColorManager.charcoalGrey80,
                                          ),
                                          child: Text(
                                            LocaleKeys.year.tr(),
                                            style: getRegularDINNextStyle(
                                              color: ColorManager.white,
                                              fontSize: FontSize.s18.sp,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                )
                              : Expanded(
                                  flex: 5,
                                  child: TextField(
                                    keyboardType: TextInputType.none,
                                    textInputAction: TextInputAction.none,
                                    readOnly: true,
                                    style: getRegularDINNextStyle(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s18.sp,
                                    ),
                                    cursorColor: ColorManager.orange,
                                    autofillHints: const [AutofillHints.email],
                                    decoration: InputDecoration(
                                      hintText:
                                          snapshot.data?.academicYear ?? '',
                                      fillColor: ColorManager.charcoalGrey80,
                                      labelStyle: getRegularDINNextStyle(
                                        color: ColorManager.white,
                                        fontSize: AppSize.s18.sp,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s10,
                                        ),
                                        borderSide: BorderSide(
                                          color: ColorManager.charcoalGrey80,
                                        ),
                                      ),
                                      hintStyle: getRegularDINNextStyle(
                                        color: ColorManager.gray,
                                        fontSize: AppSize.s16.sp,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    
                    Card(
                      color: ColorManager.dark,
                      elevation: AppSize.s5,
                      shadowColor: ColorManager.dark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: Container(
                  padding:EdgeInsets.only(bottom: AppSize.s07.h,),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p5.w,
                                  vertical: AppPadding.p1.h,
                                ),
                                child: Text(
                                  LocaleKeys.eMail.tr(),
                                  style: getRegularDINNextStyle(
                                    color: ColorManager.lightBlue,
                                    fontSize: AppSize.s18.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: StreamBuilder<bool>(
                                stream: _profileViewModel.outIsUserEmailValid,
                                builder: (context, snapshot) {
                                  return TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _emailController,
                                    textInputAction: TextInputAction.next,
                                    style: getRegularDINNextStyle(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s18.sp,
                                    ),
                                    cursorColor: ColorManager.orange,
                                    autofillHints: const [AutofillHints.email],
                                    decoration: InputDecoration(
                                      hintText: '',
                                      labelText: '',
                                      fillColor: ColorManager.charcoalGrey80,
                                      labelStyle: getRegularDINNextStyle(
                                        color: ColorManager.white,
                                        fontSize: AppSize.s18.sp,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s10,
                                        ),
                                        borderSide: BorderSide(
                                          color: ColorManager.charcoalGrey80,
                                        ),
                                      ),
                                      hintStyle: getRegularDINNextStyle(
                                        color: ColorManager.gray,
                                        fontSize: AppSize.s16.sp,
                                      ),
                                      suffixIcon: (snapshot.data ??
                                              false ||
                                                  _emailController
                                                      .text.isNotEmpty)
                                          ? Icon(
                                              Icons.check,
                                              color: ColorManager.orange,
                                              size: AppSize.s2_5.h,
                                            )
                                          : null,
                                      errorText: (snapshot.data ?? true)
                                          ? null
                                          : LocaleKeys.emailError.tr(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.s1_5.h),
                    Card(
                      color: ColorManager.dark,
                      elevation: AppSize.s5,
                      shadowColor: ColorManager.dark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: Container(
                         padding:EdgeInsets.only(bottom: AppSize.s1_2.h,),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p5.w,
                                  vertical: AppPadding.p1.h,
                                ),
                                child: Text(
                                  LocaleKeys.password.tr(),
                                  style: getRegularDINNextStyle(
                                    color: ColorManager.lightBlue,
                                    fontSize: AppSize.s18.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Stack(
                                children: [
                                  StreamBuilder<bool>(
                                    stream:
                                        _profileViewModel.outIsUserPasswordValid,
                                    builder: (context, snapshot) {
                                      return TextField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        controller: _passwordController,
                                        obscureText: showPassword,
                                        textInputAction: TextInputAction.next,
                                        style: getRegularDINNextStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s18.sp,
                                        ),
                                        cursorColor: ColorManager.orange,
                                        autofillHints: const [
                                          AutofillHints.password
                                        ],
                                        decoration: InputDecoration(
                                          hintText:'',
                                          labelText:'',
                                          fillColor: ColorManager.charcoalGrey80,
                                          labelStyle: getRegularDINNextStyle(
                                            color: ColorManager.white,
                                            fontSize: AppSize.s18.sp,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              AppSize.s10,
                                            ),
                                            borderSide: BorderSide(
                                              color: ColorManager.charcoalGrey80,
                                            ),
                                          ),
                                          hintStyle: getRegularDINNextStyle(
                                            color: ColorManager.gray,
                                            fontSize: AppSize.s16.sp,
                                          ),
                                          // suffixIcon: (snapshot.data ??
                                          //         false ||
                                          //             _passwordController
                                          //                 .text.isNotEmpty)
                                          //     ? Icon(
                                          //         Icons.check,
                                          //         color: ColorManager.orange,
                                          //         size: AppSize.s2_5.h,
                                          //       )
                                          //     : null,
                                          errorText: (snapshot.data ?? true)
                                              ? null
                                              : LocaleKeys.passwordError.tr(),
                                        ),
                                      );
                                    },
                                  ),
                                  Positioned(
                                    left: isCurrentLanguageEn(context)
                                        ? AppSize.s40.w
                                        : AppSize.s1.w,
                                    child: Padding(
                                      padding: EdgeInsets.all(AppPadding.p3.w),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditPassView(
                                                  viewModel: _profileViewModel,
                                                  logoutFunc: widget.logoutFunc,
                                                ),
                                              ));
                                        },
                                        child: Visibility(
                                          visible: visibleEditPassword,
                                          child: Text(
                                            LocaleKeys.edit.tr(),
                                            style: getMediumInterStyle(
                                              color: ColorManager.liliac,
                                              fontSize: AppSize.s16.sp,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.s1.h),
                    SizedBox(
                      height: AppSize.s2.h,
                    ),
                    StreamBuilder<bool>(
                        stream: _profileViewModel.outIsUserPasswordValid,
                        builder: (context, buttonSnapshot) {
                          return CustomButtonWidget(
                            backGroundColor: ColorManager.terracota,
                            borderColor: ColorManager.transparent,
                            title: LocaleKeys.save.tr(),
                            shadowColor: ColorManager.orange11,
                            textColor: ColorManager.white,
                            onTap: (buttonSnapshot.data ?? false)
                                ? () {
                                    if (snapshot.data!.isEduYearEditable &&
                                        eduYearID != -1) {
                                      _profileViewModel.updateUserProfile(
                                        context,
                                        isEduYearEditable: true,
                                        eduYearId: eduYearID,
                                      );
                                    } else {
                                      _profileViewModel.updateUserProfile(
                                        context,
                                      );
                                    }
                                    _profileViewModel.getProfile();
                                  }
                                : null,
                          );
                        },)
                  ],
                ),
              ),
            ),
          );
        } else {
          return StateRenderer(
            stateRendererType: StateRendererType.fullScreenLoadingState,
            retryActionFunction: () {
              _profileViewModel.getProfile();
            },
          );
        }
      },
    );
  }
}
