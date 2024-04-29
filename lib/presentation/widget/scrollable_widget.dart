import 'package:flutter/material.dart';

class ScrollableWidget extends StatelessWidget {
  final controller = ScrollController();
  final controller2 = ScrollController();
  final Widget child;

  ScrollableWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scrollbar(
    controller: controller2,
    thumbVisibility: true,
    child: SingleChildScrollView(
      controller: controller2,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: child,
      ),
    ),
  );
}