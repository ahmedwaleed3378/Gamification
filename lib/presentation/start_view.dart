import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';

class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 10), _goNext);
  }

  _goNext() {
    _appPreferences.getOnBoardingViewed().then((isLanguageSelected) => {
          // check if the first time open app
          if (!isLanguageSelected)
            Navigator.pushReplacementNamed(context, Routes.languageRoute)
          else
            Navigator.pushReplacementNamed(context, Routes.splashRoute)
        });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
