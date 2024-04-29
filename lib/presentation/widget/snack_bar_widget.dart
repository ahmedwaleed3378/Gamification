import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SnackBarPage extends StatelessWidget {
  final String msg;

  const SnackBarPage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(backgroundColor: ColorManager.red,
              content: Text(
                LocaleKeys.solveAllQuestion.tr(),
                style: getBoldOxygenStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s14.sp,
                ),
              ),
              action: SnackBarAction(
                label: LocaleKeys.hide.tr(),
                onPressed: () {},
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text(
            LocaleKeys.questions.tr(),
            style: getBoldOxygenStyle(
              color: ColorManager.white,
              fontSize: AppSize.s14.sp,
            ),
          ),
      ),
    );
  }
}
