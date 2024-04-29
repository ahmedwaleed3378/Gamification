// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gamification/presentation/resources/color_manager.dart';
// import 'package:gamification/presentation/resources/styles_manager.dart';
// import 'package:gamification/presentation/resources/values_manager.dart';
//
// class CustomCollectionLettersItem extends StatelessWidget {
//   const CustomCollectionLettersItem({Key? key}) : super(key: key);
// final String text;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: double.infinity,
//         //height: AppSize.s27.h,
//         padding: EdgeInsets.symmetric(
//             vertical: AppPadding.p1.h,
//             horizontal: AppPadding.p2.w),
//         decoration: BoxDecoration(
//           color: ColorManager.newWidget,
//           borderRadius: BorderRadius.circular(AppSize.s14),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 SizedBox(
//                   width: AppSize.s14.h,
//                   height: AppSize.s14.h,
//                   child: riveArtboard != null
//                       ? Rive(
//                     artboard: riveArtboard!,
//                   )
//                       : SizedBox.shrink(
//                     child: Container(
//                         color: ColorManager.dark),
//                   ),
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       setState(() => voicePlay = true);
//                       playAudio(
//                           Constants.baseUrl
//                               .substring(0, Constants.baseUrl.length - 1) +
//                               widget.qVoiceModel.questionAudio[0].voiceQuestion[0]);
//                     },
//                     child: SvgPicture.asset(
//                       voicePlay
//                           ? ImageAssets.soundWaveThree
//                           : ImageAssets.soundWaveOne,
//                       width: AppSize.s3.h,
//                       height: AppSize.s3.h,
//                     )),
//                 const Spacer(),
//                 Container(
//                     width: AppSize.s34.w,
//                     height: AppSize.s13.h,
//                     padding: EdgeInsets.symmetric(
//                         vertical: AppPadding.p1.h,
//                         horizontal: AppPadding.p2.h),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: ColorManager.charcoalGrey,
//                       borderRadius:
//                       BorderRadius.circular(AppSize.s20),
//                     ),
//                     child: Image.network(
//                       Constants.baseUrl
//                           .substring(0, Constants.baseUrl.length - 1) +
//                           widget.qVoiceModel.questionAudio[0].imageQuestion[0],
//                       errorBuilder: (context, error, stackTrace) => Image.asset(
//                         ImageAssets.errorImage,
//                       ),
//                     )
//                 )
//               ],
//             ),
//             SizedBox(
//               height: AppSize.s1.h,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: AppSize.s1.w),
//               child: SizedBox(
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Wrap(
//                     children: List<Widget>.generate(
//                         selectedLetters.length,
//                             (index) => widget.isSolved
//                             ? EmptyTextContainer(
//                           text:
//                           selectedLetters[index],
//                           backgroundColor: correction
//                               ? ColorManager
//                               .correctGreen
//                               : ColorManager.red,
//                           textColor:
//                           ColorManager.white,
//                         )
//                             : Draggable<String>(
//                           data:
//                           selectedLetters[index],
//                           feedback:
//                           CustomAnswerWidget(
//                               color: ColorManager
//                                   .skyBlue
//                                   .withOpacity(
//                                   .5),
//                               text:
//                               selectedLetters[
//                               index]),
//                           childWhenDragging:
//                           Container(),
//                           child: Container(
//                             width: AppSize.s6.h,
//                             height: AppSize.s6.h,
//                             alignment:
//                             Alignment.center,
//                             margin:
//                             EdgeInsets.symmetric(
//                                 horizontal:
//                                 AppSize.s1.w,
//                                 vertical:
//                                 AppSize.s1.h),
//                             decoration: BoxDecoration(
//                               color: ColorManager
//                                   .skyBlue,
//                               borderRadius:
//                               BorderRadius
//                                   .circular(
//                                   AppSize
//                                       .s20),
//                             ),
//                             child: Text(
//                               selectedLetters[index],
//                               style:
//                               getRegularDINNextStyle(
//                                   color:
//                                   ColorManager
//                                       .white,
//                                   fontSize:
//                                   AppSize.s18
//                                       .sp),
//                             ),
//                           ),
//                         )),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
