import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

// loading state (POPUP, FULL SCREEN)
class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String? message;

  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? LocaleKeys.loading.tr();

  @override
  String getMessage() => message ?? LocaleKeys.loading.tr();

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// error state (POPUP, FULL SCREEN)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// success state (POPUP, FULL SCREEN)
class SuccessState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  SuccessState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// content state
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

// empty state
class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            // show popup loading
            showPopup(context, getStateRendererType(), getMessage());
            // show content ui of the screen
            return contentScreenWidget;
          } else {
            // full screen loading state
            return StateRenderer(
                message: getMessage(),
                stateRendererType: getStateRendererType(),
                retryActionFunction: retryActionFunction);
          }
        }
      case ErrorState:
        {
          dismissDialog(context);
          // Navigator.of(context, rootNavigator: true).pop(true);
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            // show popup error
            showPopup(context, getStateRendererType(), getMessage());
            // show content ui of the screen
            return contentScreenWidget;
          } else {
            // full screen error state
            return StateRenderer(
              message: getMessage(),
              stateRendererType: getStateRendererType(),
              retryActionFunction: retryActionFunction,
            );
          }
        }
      case SuccessState:
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupSuccessState) {
            // show popup success
            customShowPopup(context, getStateRendererType(), getMessage(),
                retryActionFunction);
            // show content ui of the screen
            return contentScreenWidget;
          } else {
            // full screen error state
            return StateRenderer(
                message: getMessage(),
                stateRendererType: getStateRendererType(),
                retryActionFunction: retryActionFunction);
          }
        }
      case EmptyState:
        {
          return StateRenderer(
              message: getMessage(),
              stateRendererType: getStateRendererType(),
              retryActionFunction: () {});
        }
      case ContentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      default:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
    }
  }

  // check if any another dialog is showing
  _isCurrentDialogIsShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogIsShowing(context)) {
      //   /Removed by Shrouk, due to full screen issue in lecture video

      //   Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  showPopup(BuildContext context, StateRendererType stateRendererType,
      String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
            stateRendererType: stateRendererType,
            message: message,
            retryActionFunction: () {})));
  }

  customShowPopup(BuildContext context, StateRendererType stateRendererType,
      String message, Function func) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => StateRenderer(
            stateRendererType: stateRendererType,
            message: message,
            retryActionFunction: func)));
  }
}
