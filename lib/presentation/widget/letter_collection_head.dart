import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/presentation/common/functions.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class LetterCollectionHead extends StatelessWidget {
  const LetterCollectionHead({
    Key? key,
    required this.imageUrl,
    required this.voicePlay,
    required this.onTap,
    this.riveArtboard,
  }) : super(key: key);
  final String imageUrl;
  final bool voicePlay;
  final VoidCallback onTap;
  final Artboard? riveArtboard;

  @override
  Widget build(BuildContext context) {
    return Row(
    //  mainAxisAlignment:Functions.isRTL(context) ? MainAxisAlignment.start :MainAxisAlignment.end ,
      children: [
      if(!Functions.isRTL(context))...[
        SizedBox(
          width: AppSize.s14.h,
          height: AppSize.s14.h,
          child: riveArtboard != null
              ? Rive(
            artboard: riveArtboard!,
          )
              : SizedBox.shrink(
            child: Container(color: ColorManager.dark),
          ),
        ),
        GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              voicePlay ? ImageAssets.soundWaveThree : ImageAssets.soundWaveOne,
              width: AppSize.s3.h,
              height: AppSize.s3.h,
            )),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s4.w , vertical: AppSize.s3.h),
          decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(AppSize.s20),
              color: ColorManager.charcoalGrey
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s20),
            child: Image.network(
              imageUrl,
              width: AppSize.s28.w,
              height: AppSize.s7.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                ImageAssets.errorImage,
                width: AppSize.s28.w,
                height: AppSize.s7.h,
              ),
            ),
          ),
        ),
      ],

        if(Functions.isRTL(context))...[
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSize.s4.w , vertical: AppSize.s3.h),
            decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(AppSize.s20),
                color: ColorManager.charcoalGrey
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s20),
              child: Image.network(
                imageUrl,
                width: AppSize.s28.w,
                height: AppSize.s7.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  ImageAssets.errorImage,
                  width: AppSize.s28.w,
                  height: AppSize.s7.h,
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(
                voicePlay ? ImageAssets.soundWaveThree : ImageAssets.soundWaveOne,
                width: AppSize.s3.h,
                height: AppSize.s3.h,
              )),
          SizedBox(
            width: AppSize.s14.h,
            height: AppSize.s14.h,
            child: riveArtboard != null
                ? Rive(
              artboard: riveArtboard!,
            )
                : SizedBox.shrink(
              child: Container(color: ColorManager.dark),
            ),
          ),
        ]




      ],
    );
  }
}
