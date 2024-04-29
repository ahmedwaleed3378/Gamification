// import 'package:bubble/bubble.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:gamification/presentation/register/view/widgets/custom_register_stepper.dart';
// import 'package:gamification/presentation/resources/color_manager.dart';
// import 'package:gamification/presentation/resources/styles_manager.dart';
// import 'package:gamification/presentation/resources/values_manager.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'dart:ui' as ui;
// import 'package:rive/rive.dart';

// import '../../../app/functions.dart';
// import '../../../generated/locale_keys.g.dart';
// import '../../resources/assets_manager.dart';
// import '../../resources/font_manager.dart';
// import '../../widget/custom_button.dart';
// import '../../widget/custom_text_field.dart';
// import '../viewmodel/register_viewmodel.dart';

// class RegisterView5 extends StatefulWidget {
//   const RegisterView5(
//       {super.key,
//       required this.viewModel,
//       required this.pageController,
//       required this.parentNameController,
//       required this.parentNumberController});
//   final PageController pageController;
//   final RegisterViewModel viewModel;

//   final TextEditingController parentNameController;
//   final TextEditingController parentNumberController;
//   @override
//   State<RegisterView5> createState() => _RegisterView5State();
// }

// class _RegisterView5State extends State<RegisterView5> {
//   Artboard? riveArtboard;
//   late RiveAnimationController? controllerRobotLogin;
//   bool navigationValid = false;
//   bool navigationValid2 = false;

//   _bind() {
//     widget.viewModel.start();
//     navigationValid = widget.viewModel.register6Nav;
//     navigationValid2 = widget.viewModel.register7Nav;
//     widget.parentNameController.addListener(() {
//       widget.viewModel.setParentName(widget.parentNameController.text);
//     });
//     widget.parentNumberController.addListener(() {
//       widget.viewModel
//           .setParentMobileNumber(widget.parentNumberController.text);
//     });
//   }

//   @override
//   void initState() {
//     _bind();
//     var controllerRobotLogin = SimpleAnimation('Writing');

//     rootBundle.load(RiveAssets.writingRobot).then((data) {
//       try {
//         final file = RiveFile.import(data);
//         final art = file.mainArtboard;
//         art.addController(controllerRobotLogin);
//         setState(() => riveArtboard = art);
//       } catch (e) {
//         debugPrint(e.toString());
//       }
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _getContentWidget(context);
//   }

//   Scaffold _getContentWidget(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.backGroundColor,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.only(
//             top: AppSize.s0.h,
//             left: AppSize.s2.w,
//             right: AppSize.s2.w,
//             bottom: AppSize.s2.h,
//           ),
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: SizedBox(
//               height: AppSize.s94.h,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: AppSize.s8.h,
//                   ),
//                   const RegisterStepper(score: 5),
//                   SizedBox(
//                     height: AppSize.s7.h,
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: AppSize.s15.h,
//                         height: AppSize.s20.h,
//                         child: riveArtboard != null
//                             ? Rive(
//                                 artboard: riveArtboard!,
//                               )
//                             : SizedBox.shrink(
//                                 child: Container(color: ColorManager.dark),
//                               ),
//                       ),
//                       SizedBox(
//                         width: AppSize.s60.w,
//                         child: Bubble(
//                           borderColor: ColorManager.secondaryText,
//                           radius: const Radius.circular(AppSize.s10),
//                           color: ColorManager.transparent,
//                           margin: const BubbleEdges.only(top: AppSize.s10),
//                           nip: isCurrentLanguageEn(context)
//                               ? BubbleNip.leftBottom
//                               : BubbleNip.rightBottom,
//                           child: Text(
//                             LocaleKeys.oneStepToGo.tr(),
//                             style: getRegularDINNextStyle(
//                                 color: ColorManager.white,
//                                 fontSize: FontSize.s19.sp),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: AppSize.s7.h,
//                   ),
//                   StreamBuilder<String?>(
//                       stream: widget.viewModel.outputErrorParentName,
//                       builder: (context, snapshot) {
//                         return CustomAuthFormFiled(
//                           onChanged: (p0) {
//                             setState(() {
//                               navigationValid = p0.isNotEmpty;
//                               widget.viewModel.register6Nav = navigationValid;
//                             });
//                           },
//                           textDirection: isCurrentLanguageEn(context)
//                               ? ui.TextDirection.ltr
//                               : ui.TextDirection.rtl,
//                           errorText: widget.parentNameController.text.length >= 5 ?null :LocaleKeys.parentNameCannt.tr() ,
//                           controller: widget.parentNameController,
//                           keyboardType: TextInputType.emailAddress,
//                           cursorColor: ColorManager.orange,
//                           textInputAction: TextInputAction.next,
//                           hintText: LocaleKeys.parentName.tr(),
//                           labelText: LocaleKeys.parentName.tr(),
//                         );
//                       }),
//                   SizedBox(
//                     height: AppSize.s4.h,
//                   ),
//                   StreamBuilder<String?>(
//                       stream: widget.viewModel.outputErrorParentMobileNumber,
//                       builder: (context, snapshot) {
//                         return CustomAuthFormFiled(
//                           controller: widget.parentNumberController,
//                           textDirection: isCurrentLanguageEn(context)
//                               ? ui.TextDirection.ltr
//                               : ui.TextDirection.rtl,
//                           keyboardType: TextInputType.phone,
//                           inputFormatters: <TextInputFormatter>[
//                             FilteringTextInputFormatter.digitsOnly
//                           ],
//                           errorText: snapshot.data,
//                           onChanged: (p0) {
//                             setState(() {
//                               navigationValid2 =p0.length==11;
//                               widget.viewModel.register7Nav = navigationValid2;
//                             });
//                           },
//                           cursorColor: ColorManager.orange,
//                           textInputAction: TextInputAction.next,
//                           hintText: LocaleKeys.parentNum.tr(),
//                           labelText: LocaleKeys.parentNum.tr(),
//                         );
//                       }),
//                   const Spacer(),
//                   StreamBuilder<bool?>(
//                       stream: widget.viewModel.outputAreAllInputsValid,
//                       builder: (context, snapshot) {
//                         return CustomButtonWidget(
//                           onTap: (snapshot.data ??
//                                   false || (
//                                     widget.viewModel.register9Nav&&
//                                     widget.viewModel.register8Nav&&
//                                     widget.viewModel.register7Nav&&
//                                     widget.viewModel.register6Nav&&
//                                    widget.parentNameController.text.length>3&&
//                                     widget.viewModel.register5Nav&&
//                                     widget.viewModel.register4Nav&&
//                                     widget.viewModel.register3Nav&&
//                                     widget.viewModel.register2Nav&&
//                                     widget.viewModel.register1Nav
                                  
//                                   ))
//                               ? () {
//                                   widget.viewModel.register(context);
//                                   widget.viewModel.register9Nav = true;
//                                 }
//                               : null,
//                           backGroundColor: ColorManager.primaryColor,
//                           borderColor: ColorManager.transparent,
//                           shadowColor: ColorManager.orange11,
//                           textColor: ColorManager.white,
//                           title: LocaleKeys.continu.tr(),
//                         );
//                       }),
//                   SizedBox(
//                     height: AppSize.s1.h,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
