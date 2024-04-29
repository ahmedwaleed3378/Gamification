import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/constants.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'custom_home_endedSubscription_dialogue.dart';

class CustomSubjectsGridView extends StatelessWidget {
  const CustomSubjectsGridView({
    super.key,
    required this.subjectImages,
    required this.subjectNames,
    required this.subjectIds,
    required this.connected,
    required this.isOpen,
  });

  final bool connected;
  final bool isOpen;
  final List<String> subjectImages;
  final List<String> subjectNames;
  final List<int> subjectIds;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding:
          EdgeInsets.only(top: AppPadding.p1_5.h, bottom: AppPadding.p1_5.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: AppSize.s1.h,
        childAspectRatio: 12 / 15,
        crossAxisSpacing: 7,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: connected ? subjectNames.length : 1,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s15),
          ),
          onTap: () {
            if (isOpen) {
              Navigator.pushNamed(context, Routes.mapView, arguments: {
                'subjectId': subjectIds[index],
                'subjectName': subjectNames[index]
              });
            } else {
              showEndedSubscription(context);
            }
          },
          child: Container(
            padding: EdgeInsets.only(
              left: AppPadding.p05.w,
              right: AppPadding.p05.w,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s15
                    // .h
                    ),
                border: Border.all(color: ColorManager.greyIsh)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.s12.w,
                  width: AppSize.s12.w,
                  child: connected
                      ? CachedNetworkImage(
                          imageUrl: Constants.baseUrl
                                  .substring(0, Constants.baseUrl.length - 1) +
                              subjectImages[index],
                          // placeholder: (context, url) => Image.asset(ImageAssets.noImageCourse),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              SvgPicture.asset(
                            ImageAssets.noSubjectImage,
                          ),
                          height: AppSize.s6.h,
                        )
                      : SvgPicture.asset(ImageAssets.noImageCourse),
                ),
                SizedBox(
                  height: AppSize.s1_5.h,
                ),
                Text(
                  connected ? subjectNames[index] : 'No Data',
                  style: getMediumDINNextStyle(
                    color: ColorManager.white
                    //
                    ,
                    fontSize: subjectNames[index].length > 13
                        ? AppSize.s14.sp
                        : AppSize.s16.sp,
                    // .h
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showEndedSubscription(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const EndedSubsCriptionDialogue(),
    );
  }
}
