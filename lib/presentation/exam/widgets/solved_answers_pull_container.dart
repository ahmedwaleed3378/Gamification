import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/model/exam/exam_details_model.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class SlovedContainerItem extends StatelessWidget {
  const SlovedContainerItem({
    super.key,
    required this.selectAnswers,
    required this.title,
  });
  final String title;
  final List<QContainerAnswerModel> selectAnswers;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s41.w,
      height: AppSize.s35.h,

      padding: EdgeInsets.symmetric(
          vertical: AppSize.s2.h, horizontal: AppSize.s1.w),
      decoration: BoxDecoration(
        color: ColorManager.newWidget,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              title,
              style: getMediumDINNextStyle(
                  color: ColorManager.maize, fontSize: AppSize.s20),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: AppSize.s1.h,
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: selectAnswers.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: AppSize.s1.h),
                      padding: EdgeInsets.symmetric(
                          vertical: AppSize.s1.h, horizontal: AppSize.s2.w),
                      decoration: BoxDecoration(
                        color: selectAnswers[index].isCorrect!
                            ? ColorManager.correctGreen
                            : ColorManager.red,
                        borderRadius: BorderRadius.circular(AppSize.s15),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Text(
                            selectAnswers[index].answer,
                            style: getMediumDINNextStyle(
                                color: ColorManager.white,
                                fontSize: AppSize.s15.sp),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Positioned(
                            bottom: -AppSize.s1.h,
                            right: -AppSize.s1_7.h,
                            child: CircleAvatar(
                              backgroundColor:ColorManager.white,
                              radius: AppSize.s09.h,
                              child: Icon(
                                selectAnswers[index].isCorrect!
                                    ? Icons.check_circle
                                    : Icons.close,
                                color: selectAnswers[index].isCorrect!?ColorManager.correctGreen : ColorManager.red,
                                size: AppSize.s1_5.h,
                              ),
                            ),
                          ),
                        ],
                      )),
                );
              },
            ), SizedBox(
              height: 7.h,
            )
          ],
        ),
      ),
    );
  }
}
