import 'package:flutter/material.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/presentation/map/viewmodel/map_viewmodel.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final MapViewModel _mapViewModel = instance<MapViewModel>();

  _bind() {
    _mapViewModel.start();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  Future loadList() async {
    _mapViewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: loadList,
      widgetChild: Scaffold(
        appBar: AppBar(
          title: const Text('Map'),
        ),
        body: const Center(
          child: Text('Map View'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _mapViewModel.dispose();
  }
}
