import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/presentation/common/freezed_data_classes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../profile/viewmodel/profile_viewmodel.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class CustomHomeHeaderWidget extends StatefulWidget {
  const CustomHomeHeaderWidget({
    super.key,
    required this.userGimNum,
    required this.userFlashNum,
    required this.userImage,
  });

  final int userGimNum;
  final int userFlashNum;
  final String userImage;

  @override
  State<CustomHomeHeaderWidget> createState() => _CustomHomeHeaderWidgetState();
}

class _CustomHomeHeaderWidgetState extends State<CustomHomeHeaderWidget> {
  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    profileViewModel.start();
  }

  @override
  void dispose() {
    profileViewModel.dispose();
    super.dispose();
  }

  ProfileViewModel profileViewModel = instance<ProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProfileObject>(
      stream: profileViewModel.outProfileDataObject,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            children: [
              SizedBox(
                width: AppSize.s9.w,
                height: AppSize.s9.h,
                child: SvgPicture.asset(ImageAssets.gemBlue),
              ),
              SizedBox(
                width: AppSize.s1.w,
              ),
              Text(
         widget.userGimNum.toString()
            //    snapshot.data!.totalPoints.toString()
                ,
                style: getBoldOpenSansStyle(
                    fontSize: AppSize.s16.sp, color: ColorManager.white),
              ),
              SizedBox(
                width: AppSize.s4.w,
              ),
              SizedBox(
                width: AppSize.s9.w,
                height: AppSize.s9.h,
                child: SvgPicture.asset(ImageAssets.flashPirple),
              ),
              SizedBox(
                width: AppSize.s1.w,
              ),
              Text(
                //     widget.userFlashNum.toString(),
                snapshot.data!.loginCounter.toString(),
                style: getBoldOpenSansStyle(
                    fontSize: AppSize.s16.sp, color: ColorManager.white),
              ),
              const Spacer(),
              // Container(
              //   width: AppSize.s9.w,
              //   height: AppSize.s9.w,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(AppSize.s30),
              //       boxShadow: [
              //         BoxShadow(
              //           color: ColorManager.orange.withOpacity(0.2),
              //           blurRadius: 15,
              //           blurStyle: BlurStyle.normal,
              //           spreadRadius: 0.2,
              //         )
              //       ]),
              //   child: InkWell(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const NotificationView(),
              //         ),
              //       );
              //     },
              //     child: SizedBox(
              //       child: SvgPicture.asset(
              //         ImageAssets.iconColorNotification,
              //         color: ColorManager.maize,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                width: AppSize.s8.w,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.profileRoute);
                },
                child: CachedNetworkImage(
                  imageUrl: Constants.baseUrl.substring(
                        0,
                        Constants.baseUrl.length - 1,
                      ) +
                      snapshot.data!.profilePicture,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  width: AppSize.s11.w,
                  height: AppSize.s11.w,
                  errorWidget: (context, url, error) => SizedBox(
                    width: AppSize.s11.w,
                    height: AppSize.s11.w,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s100),
                        image: const DecorationImage(
                          image: AssetImage(
                            ImageAssets.user,
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: AppSize.s5.w,
              ),
            ],
          );
        } else {
          return Row(
            children: [
              SizedBox(
                width: AppSize.s9.w,
                height: AppSize.s9.h,
                child: SvgPicture.asset(ImageAssets.gemBlue),
              ),
              SizedBox(
                width: AppSize.s1.w,
              ),
              Text(
                '${widget.userGimNum}',
                style: getBoldOpenSansStyle(
                    fontSize: AppSize.s16.sp, color: ColorManager.white),
              ),
              SizedBox(
                width: AppSize.s4.w,
              ),
              SizedBox(
                width: AppSize.s9.w,
                height: AppSize.s9.h,
                child: SvgPicture.asset(ImageAssets.flashPirple),
              ),
              SizedBox(
                width: AppSize.s1.w,
              ),
              Text(
                '${widget.userFlashNum}',
                style: getBoldOpenSansStyle(
                    fontSize: AppSize.s16.sp, color: ColorManager.white),
              ),
              const Spacer(),
              // Container(
              //   width: AppSize.s9.w,
              //   height: AppSize.s9.w,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(AppSize.s30),
              //       boxShadow: [
              //         BoxShadow(
              //           color: ColorManager.orange.withOpacity(0.2),
              //           blurRadius: 15,
              //           blurStyle: BlurStyle.normal,
              //           spreadRadius: 0.2,
              //         )
              //       ]),
              //   child: InkWell(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const NotificationView(),
              //         ),
              //       );
              //     },
              //     child: SizedBox(
              //       child: SvgPicture.asset(
              //         ImageAssets.iconColorNotification,
              //         color: ColorManager.maize,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                width: AppSize.s8.w,
              ),
              CachedNetworkImage(
                imageUrl: Constants.baseUrl.substring(
                  0,
                  Constants.baseUrl.length - 1,
                ),
                width: AppSize.s11.w,
                height: AppSize.s11.w,
                errorWidget: (context, url, error) => SizedBox(
                  width: AppSize.s11.w,
                  height: AppSize.s11.w,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s100),
                      image: const DecorationImage(
                        image: AssetImage(
                          ImageAssets.user,
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: AppSize.s5.w,
              ),
            ],
          );
        }
      },
    );
  }
}