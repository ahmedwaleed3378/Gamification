import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gamification/presentation/common/functions.dart';

class TransformWidget extends StatelessWidget {
  final Widget child;
  final BuildContext buildContext;

  const TransformWidget({Key? key, required this.child,required this.buildContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(Functions.isRTL(buildContext) ? math.pi : 0),
      child: child,
    );
  }
}
