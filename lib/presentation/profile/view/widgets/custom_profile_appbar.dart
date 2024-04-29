import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/profile/viewmodel/profile_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/transform_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomProfileAppBar extends StatelessWidget {
  final ProfileViewModel profileViewModel;

  const CustomProfileAppBar({Key? key, required this.profileViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSize.s4.w,
        right: AppSize.s4.w,
        bottom: AppSize.s2.h,
        top: AppSize.s2.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: true,
            child: TransformWidget(
              buildContext: context,
              child: InkWell(
                child: SizedBox(
                  height: AppSize.s4.h,
                  width: AppSize.s4.h,
                  child: SvgPicture.asset(ImageAssets.arrowIc),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
                },
              ),
            ),
          ),
          Text(
            LocaleKeys.editProfile.tr(),
            style: getRegularOxygenStyle(
              color: ColorManager.black,
              fontSize: AppSize.s18.sp,
            ),
          ),
          StreamBuilder<bool>(
            stream: profileViewModel.outIAreAllDataValid,
            builder: (context, snapshot) => SizedBox(
              width: AppSize.s10.w,
              height: AppSize.s4.h,
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero, // Set this
                  padding: EdgeInsets.zero, // and this
                ),
                onPressed: (snapshot.data ?? false)
                    ? () {
                        profileViewModel.updateUserProfile(context);
                      }
                    : null,
                child: Text(
                  LocaleKeys.save.tr(),
                  style: getRegularOxygenStyle(
                      color: (snapshot.data ?? false)
                          ? ColorManager.orange
                          : ColorManager.darkGrey,
                      fontSize: AppSize.s16.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
