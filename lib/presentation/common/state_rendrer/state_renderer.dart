import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

enum StateRendererType {
  // popup states (Dialog)
  popupLoadingState,
  popupErrorState,
  popupSuccessState,

  // full screen states (full screen)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  // general
  contentState,
}

//ignore: must_be_immutable
class StateRenderer extends StatefulWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  Function retryActionFunction;

  StateRenderer(
      {Key? key,
      required this.stateRendererType,
      String? message,
      String? title = "",
      required this.retryActionFunction})
      : message = message ?? LocaleKeys.loading.tr(),
        title = title ?? "",
        super(key: key);

  @override
  State<StateRenderer> createState() => _StateRendererState();
}

class _StateRendererState extends State<StateRenderer> {
  Artboard? riveArtboard;
  Artboard? riveArtboardPopUp;
  late RiveAnimationController? controllerRobotLogin;
  late RiveAnimationController? controllerRobotLoginPopUp;

  @override
  void initState() {
    var controllerRobotLogin = SimpleAnimation('Die 3');
    var controllerRobotLoginPopUp = SimpleAnimation('Sad 2');

    rootBundle.load(RiveAssets.daeadRobot).then((data) {
      try {
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        art.addController(controllerRobotLogin);
        setState(() => riveArtboard = art);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    rootBundle.load(RiveAssets.newSad).then((data) {
      try {
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        art.addController(controllerRobotLoginPopUp);
        setState(() => riveArtboardPopUp = art);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (widget.stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopupDialog(
            context, [_getAnimatedImage(JsonAssets.loading)]);
      case StateRendererType.popupErrorState:
        return _getPopupDialog(context, [
          _getMessage(widget.message),
          _getAnimatedImage(JsonAssets.error, isRive: true, isPopUp: true),
          _getRetryButton(LocaleKeys.ok.tr(), context)
        ]);
      case StateRendererType.popupSuccessState:
        return _getPopupDialog(context, [
          _getAnimatedImage(JsonAssets.success),
          _getMessage(widget.message),
          _getRetryButton(LocaleKeys.ok.tr(), context)
        ]);
      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn([
          _getMessage(widget.message),
          _getAnimatedImage(JsonAssets.loading)
        ]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getMessage(widget.message),
          _getAnimatedImage(JsonAssets.error, isRive: true),
          _getRetryButton(LocaleKeys.retryAgain.tr(), context)
        ]);
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn(
            [_getMessage(widget.message), _getAnimatedImage(JsonAssets.empty)]);
      case StateRendererType.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getPopupDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        width: AppSize.s60.w,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ColorManager.dark,
          border: Border.all(
            width: AppSize.s2,
            color: ColorManager.white,
          ),
          borderRadius: BorderRadius.circular(AppSize.s20),
          boxShadow: [
            BoxShadow(
              color: ColorManager.white,
              blurRadius: AppSize.s10,
            ),
          ],
        ),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getItemsColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName,
      {bool isRive = false, bool isPopUp = false}) {
    if (isRive && !isPopUp) {
      return SizedBox(
        height: AppSize.s40.w,
        width: AppSize.s40.w,
        child: riveArtboard != null
            ? Rive(
                artboard: riveArtboard!,
              )
            : SizedBox.shrink(
                child: Container(color: ColorManager.dark),
              ),
      );
    } else if (isRive && isPopUp) {
      return SizedBox(
        height: AppSize.s40.w,
        width: AppSize.s55.w,
        child: riveArtboardPopUp != null
            ? 
               
               Rive(
                  artboard: riveArtboardPopUp!,
                )
             
            : SizedBox.shrink(
                child: Container(color: ColorManager.dark),
              ),
      );
    } else {
      return SizedBox(
        height: AppSize.s100,
        width: AppSize.s100,
        child: Lottie.asset(animationName), // todo add json image
      );
    }
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p8.w,
          vertical: AppPadding.p2.h,
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: getSemiBoldInterStyle(
            color: ColorManager.white,
            fontSize: AppSize.s18.sp,
          ),
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p3.w),
        child: SizedBox(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.terracota,
            ),
            onPressed: () {
              if (widget.stateRendererType ==
                      StateRendererType.fullScreenErrorState ||
                  widget.stateRendererType ==
                      StateRendererType.popupSuccessState) {
                // call retry function
                if (widget.stateRendererType ==
                    StateRendererType.popupSuccessState) {
                  Navigator.of(context).pop();
                }
                widget.retryActionFunction.call();
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p6.w,
                vertical: AppPadding.p05.h,
              ),
              child: Text(
                buttonTitle,
                style: getBoldSegoeStyle(
                  color: ColorManager.whiteTwo,
                  fontSize: AppSize.s24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
