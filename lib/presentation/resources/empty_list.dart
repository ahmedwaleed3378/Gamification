import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamification/presentation/resources/values_manager.dart';

class EmptyListWidget extends StatelessWidget {
  final String imagePath;

  const EmptyListWidget({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          SvgPicture.asset(
            imagePath,
            width: AppSize.s200,
          ),
        ],
      ),
    );
  }
}
