import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/map/view/map_library/game_levels_scrolling_map.dart';
import 'package:gamification/presentation/map/view/map_library/model/point_model.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/font_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MapHorizontalExample extends StatefulWidget {
  const MapHorizontalExample({Key? key}) : super(key: key);

  @override
  State<MapHorizontalExample> createState() => _MapHorizontalExampleState();
}

class _MapHorizontalExampleState extends State<MapHorizontalExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: GameLevelsScrollingMap.scrollable(
        imageUrl: ImageAssets.mapHorizontal,
        svgUrl: ImageAssets.mapHorizontalSVG,
        points: points,
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    fillTestData();
    super.initState();
  }

  List<PointModel> points = [];

  void fillTestData() {
    for (int i = 0; i < 50; i++) {
      points.add(PointModel(100, testWidget(i)));
    }
  }

  Widget testWidget(int order) {
    return InkWell(
      hoverColor: Colors.blue,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            ImageAssets.mapHorizontalPoints,
            fit: BoxFit.fitWidth,
            width: AppSize.s100,
          ),
          Text("$order",
              style:  TextStyle(
                  color: Colors.black, fontSize: FontSize.s40.sp))
        ],
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("${LocaleKeys.points} $order"),
              actions: <Widget>[
                ElevatedButton(
                  child: Text(LocaleKeys.ok.tr()),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
