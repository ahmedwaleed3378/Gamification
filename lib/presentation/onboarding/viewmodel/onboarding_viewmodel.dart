import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/base/base_view_model.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';


class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _pageViewObjectStreamController =
  StreamController<SliderViewObject>();
  final StreamController lastUserOnBoardingViewed = StreamController<bool>();
  final StreamController lastPageViewed = StreamController<int>();
  final StreamController incStream = StreamController<int>();

  late final List<SliderObject> _pageViewList;
  int currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
    lastUserOnBoardingViewed.close();
    _pageViewObjectStreamController.close();
    lastPageViewed.close();
  }

  @override
  void start() {
    _pageViewList = _getSliderData();
    _postDataToView();
  }

  /// inputs

  @override
  Sink get inputPageViewObject => _pageViewObjectStreamController.sink;

  @override
  int goNext() {
    int nextIndex = ++currentIndex;
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --currentIndex;
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    currentIndex = index;
    lastPageViewed.add(index);
    _postDataToView();
  }

  void _postDataToView() {
    inputPageViewObject.add(SliderViewObject(
        _pageViewList[currentIndex], _pageViewList.length, currentIndex));
  }

  /// outputs
  @override
  Stream<SliderViewObject> get outputPageViewObject =>
      _pageViewObjectStreamController.stream
          .map((sliderViewObject) => sliderViewObject);

  List<SliderObject> _getSliderData() {
    return     [
      SliderObject(
          LocaleKeys.onboardingTitle1.tr(), LocaleKeys.onboardingSubtitle1.tr(),
          ImageAssets.rocket),
      SliderObject(
          LocaleKeys.onboardingTitle2.tr(), LocaleKeys.onboardingSubtitle2.tr(),
          ImageAssets.rocket),
      SliderObject(
          LocaleKeys.onboardingTitle3.tr(), LocaleKeys.onboardingSubtitle3.tr(),
          ImageAssets.rocket),
      SliderObject(
          "", "",
          ""),
    ];
  }
}

abstract class OnBoardingViewModelInputs {
  void onPageChanged(int index);

  int goNext();

  int goPrevious();

  Sink get inputPageViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputPageViewObject;
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
