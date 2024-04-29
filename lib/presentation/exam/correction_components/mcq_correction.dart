// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gamification/generated/locale_keys.g.dart';
// import 'package:gamification/presentation/resources/assets_manager.dart';
// import 'package:gamification/presentation/resources/color_manager.dart';
// import 'package:gamification/presentation/resources/styles_manager.dart';
// import 'package:gamification/presentation/resources/values_manager.dart';
// import 'package:gamification/presentation/widget/custom_button.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class McqCorrectionView extends StatefulWidget {
//   const McqCorrectionView({Key? key}) : super(key: key);

//   @override
//   State<McqCorrectionView> createState() => _McqCorrectionViewState();
// }

// class _McqCorrectionViewState extends State<McqCorrectionView> {





//   @override
//   Widget build(BuildContext context) {
//     return _getContentWidget();
//   }

//   Widget _getContentWidget() {
//     return Scaffold(
//       backgroundColor: ColorManager.dark,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: AppPadding.p4.w,
//               vertical: AppPadding.p2.h,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: AppSize.s5.w,
//                   ),
//                   child: Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'English',
//                             style: getSemiBoldSFProDisplayCStyle(
//                               color: ColorManager.terracota,
//                               fontSize: AppSize.s23.sp,
//                             ),
//                           ),
//                           SizedBox(height: AppSize.s1.h),
//                           Text(
//                             'Unit 1 lesson 3',
//                             style: getSemiBoldSFProDisplayCStyle(
//                               color: ColorManager.greenishTeal,
//                               fontSize: AppSize.s19.sp,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Spacer(),
//                       SvgPicture.asset(
//                         ImageAssets.chem,
//                       ),
//                     ],
//                   ),
//                 ),
//                 //ToDo: Adding stepper
//                 SizedBox(height: AppSize.s4.h),

//                 Container(
//                   height: AppSize.s23.h,
//                   padding: EdgeInsets.symmetric(
//                     horizontal: AppPadding.p4.w,
//                     vertical: AppPadding.p1.h
//                   ),
//                   decoration: BoxDecoration(
//                     color: ColorManager.newWidget,
//                     borderRadius: BorderRadius.circular(AppSize.s14),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Center(
//                         child: Text(
//                           'At room temperature, what is the only metal that is in liquid form?',
//                           style: getMediumDINNextStyle(
//                             color: ColorManager.lightBlue,
//                             fontSize: AppSize.s20,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       SizedBox(height: AppSize.s2.h),
//                      Container(
//                        color: Colors.red,
//                        child: Image.asset(ImageAssets.board,
//                          width: AppSize.s21.h,
//                          height: AppSize.s12.h,
//                          fit: BoxFit.fill,
//                        ),
//                      )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: AppSize.s4.h),
//                 ListView.separated(
//                   shrinkWrap: true,
//                   itemCount: textAnswers.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       color: ColorManager.darkSkyBlue
//                       ////selectedAnswer == index
//  //
//                         ////  ? 
//                          // 
                          
                          
//                          // : ColorManager.white30
//                  ,     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                           AppSize.s14,
//                         ),
//                       ),
//                       child: Card(
//                         margin: EdgeInsets.only(
//                           top: AppPadding.p02.h,
//                           bottom: AppPadding.p07.h,
//                           right: AppPadding.p05.w,
//                           left: AppPadding.p05.w,
//                         ),
//                         color: ColorManager.dark.withOpacity(0.8),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(
//                             AppSize.s14,
//                           ),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                             vertical: AppPadding.p2.h,
//                           ),
//                           child: Text(
//                             textAnswers[index],
//                             style: getRegularDINNextStyle(
//                               color: ColorManager.white,
//                               fontSize: AppSize.s21,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   separatorBuilder: (context, index) {
//                     return SizedBox(height: AppSize.s2.h);
//                   },
//                 ),
//                 SizedBox(height: AppSize.s4.h),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: AppPadding.p6.w,
//                   ),
//                   child: CustomButtonWidget(
//                     onTap: () {},
//                     height: AppSize.s7.h,
//                     shadowColor:// selectedAnswer != -1
//                         //?
//                         // ColorManager.terracota
//                        // :
                        
//                          ColorManager.white30,
//                     borderColor:// selectedAnswer != -1
//                         //?
//                         // ColorManager.terracota
//                        // :
                        
//                          ColorManager.white30,
//                     backGroundColor:// selectedAnswer != -1
//                         //?
//                         // ColorManager.terracota
//                        // :
                        
//                          ColorManager.white30,
//                     title: LocaleKeys.check.tr(),
//                     style: getMediumDINNextStyle(
//                       color:// selectedAnswer != -1
//                           //?
//                           // ColorManager.white
//                          // :
                          
//                            ColorManager.dark,
//                       fontSize: AppSize.s26,
//                     ),
//                     textColor: ColorManager.dark,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }

// List textAnswers = [
//   'Books are the windows of the house',
//   'Books are windows of knowledge',
//   'Books are windows of information',
//   'Books is the window to the world'
// ];
