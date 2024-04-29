import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/language_manager.dart';

class Functions {
  static bool isRTL(BuildContext context) {
    return context.locale == ARABIC_LOCAL;
  }
}
