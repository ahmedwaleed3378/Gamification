import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InstructionsView extends StatelessWidget {
  const InstructionsView({Key? key, required this.instructions})
      : super(key: key);
  final List<String> instructions;

  @override
  Widget build(BuildContext context) {
    return _getContentWidget(context);
  }

  Widget _getContentWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
            child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SvgPicture.asset(
                  ImageAssets.backgroundCube,
                  fit: BoxFit.fill,
                )),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p4.w,
                vertical: AppPadding.p2.h,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: AppPadding.p6.h,
                        bottom: AppPadding.p1.h,
                        left: AppPadding.p2.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.close,
                              size: AppSize.s8.w,
                              color: ColorManager.terracota,
                            ),),

                        Expanded(
                          child: Text(
                            LocaleKeys.instruction.tr(),
                            style: getRegularDINNextStyle(
                              color: ColorManager.terracota,
                              fontSize: AppSize.s20.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: AppSize.s05.w,
                    color: ColorManager.steel50,
                  ),
                  SizedBox(
                    height: AppSize.s2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.s4.w, vertical: AppSize.s1.h),
                    child: Row(
                      children: [
                        Expanded(child: Center(
                          child: SvgPicture.asset(ImageAssets.instructionsShape1),
                        )),
                        Expanded(child: Center(child: SvgPicture.asset(ImageAssets.instructionsShape3))),
                        Expanded(child: Center(child: SvgPicture.asset(ImageAssets.instructionsShape2))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: instructions.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return _instructionItem(
                          instructions[index],
                          index == 0
                              ? ColorManager.maize
                              : index == 1
                                  ? ColorManager.babyBlue
                                  : index == 2
                                      ? ColorManager.periwinkle80
                                      : index == 3
                                          ? ColorManager.green
                                          : ColorManager.white,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: AppSize.s2.h);
                      },
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _instructionItem(String instruction, Color color) {
    return Card(
      elevation: AppSize.s10,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            vertical: AppSize.s2.h, horizontal: AppSize.s5.w),
        decoration: BoxDecoration(
          color: ColorManager.dark,
          borderRadius: BorderRadius.circular(AppSize.s15),
          boxShadow: [
            BoxShadow(
                color: ColorManager.white.withOpacity(AppSize.s01),
                spreadRadius: AppSize.s1,
                blurRadius: AppSize.s05,
                offset: const Offset(AppSize.s1, AppSize.s0)),
          ],
        ),
        child: Text(
          instruction,
          style: getRegularDINNextStyle(color: color, fontSize: AppSize.s18.sp)
              .copyWith(height: 1.3),
        ),
      ),
    );
  }
}
