import 'package:flutter/cupertino.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';

class LogoText extends StatelessWidget {
  const LogoText({Key? key, required this.width, required this.height}) : super(key: key);
final double width;
final double height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.textEduLogo,
      width:width ,
      height:height ,
    );
  }
}
