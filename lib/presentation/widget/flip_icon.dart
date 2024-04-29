import 'package:flutter/material.dart';
import 'package:gamification/presentation/common/functions.dart';

class FlipIcon extends StatelessWidget {
  final Widget child;
  final BuildContext buildContext;

  const FlipIcon({Key? key, required this.child, required this.buildContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
        flipX: Functions.isRTL(buildContext) ? false : true, child: child);
  }
}
