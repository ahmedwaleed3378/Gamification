import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//ignore: must_be_immutable
class ProfileWidget extends StatelessWidget {
  final String networkImage;
  File? imageFileProfile;
  final VoidCallback onTap;
  final double photoSize;

  ProfileWidget({
    super.key,
    required this.networkImage,
    this.imageFileProfile,
    required this.onTap,
    required this.photoSize,
  });

  @override
  Widget build(BuildContext context) {
    return buildImage();
  }

  Widget buildImage() {
    double imageSize = (photoSize - AppSize.s05.h);

    return SizedBox(
      height: photoSize,
      width: photoSize,
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s360)),
          clipBehavior: Clip.hardEdge,
          child: CircleAvatar(
            radius: imageSize,
            backgroundColor: ColorManager.dark,
            child: (imageFileProfile != null)
                ? ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s360)),
                    child: Image.file(imageFileProfile!,
                        fit: BoxFit.cover, width: imageSize, height: imageSize))
                : ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s360)),
                    child: Image.network(
                      Constants.baseUrl
                              .substring(0, Constants.baseUrl.length - 1) +
                          networkImage,
                      fit: BoxFit.cover,
                      width: imageSize,
                      height: imageSize,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        ImageAssets.user,
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

// Widget buildImage() {
//   return Container(
//     margin: const EdgeInsets.only(top: AppMargin.m20),
//     decoration: BoxDecoration(
//         color: ColorManager.profileGrey,
//         border: Border.all(color: ColorManager.blue,width: AppSize.s2),
//         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s50))),
//     child: Material(
//       color: Colors.transparent,
//       child: Ink.image(
//         image: const AssetImage(ImageAssets.user),
//         fit: BoxFit.cover,
//         width: AppSize.s110,
//         height: AppSize.s110,
//         child: InkWell(
//             onTap: onTap,
//             child:  CircleAvatar(
//               radius: AppSize.s50,
//               backgroundColor: Colors.transparent,
//               backgroundImage:  (imageFileProfile != null)
//                   ? FileImage(imageFileProfile!)
//                   : (networkImage.isNotEmpty) ?NetworkImage("https://schoolsystem.cloudiax.com"+networkImage) : AssetImage(ImageAssets.user) as ImageProvider,
//
//               // foregroundImage:
//               // NetworkImage("$imagePath"),
//             )),
//       ),
//     ),
//   );
// }

// Widget buildEditIcon() => buildCircle(
//       color: AppTheme.colors.white,
//       all: 3,
//       child: buildCircle(
//         color: Colors.lightBlue,
//         all: 8,
//         child: Icon(
//           Icons.edit,
//           color: AppTheme.colors.white,
//           size: 20,
//         ),
//       ),
//     );

// Widget buildCircle({Widget child, double all, Color color}) => ClipOval(
//       child: Container(
//         child: child,
//         color: color,
//         padding: EdgeInsets.all(all),
//       ),
//     );
}
