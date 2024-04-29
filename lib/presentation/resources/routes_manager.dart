import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/course/view/course_view.dart';
import 'package:gamification/presentation/enter_test/view/enter_test_view.dart';
import 'package:gamification/presentation/exam/view/exam_view.dart';
import 'package:gamification/presentation/forget_password/view/forget_password_view.dart';
import 'package:gamification/presentation/home/view/home_view.dart';
import 'package:gamification/presentation/language/view/language_view.dart';
import 'package:gamification/presentation/lecture_video/view/lecture_video_view.dart';
import 'package:gamification/presentation/login/view/login_view.dart';
import 'package:gamification/presentation/map/view/maps_types/map_vertical_example.dart';
import 'package:gamification/presentation/notification/view/notification_view.dart';
import 'package:gamification/presentation/onboarding/view/onboarding_view.dart';
import 'package:gamification/presentation/payment/view/payment_methods_view.dart';
import 'package:gamification/presentation/profile/view/profile_view.dart';
import 'package:gamification/presentation/register/view/register_pag_view.dart';
import 'package:gamification/presentation/scoreboard/view/scoreboard_view.dart';
import 'package:gamification/presentation/splash/view/splash_view.dart';
import 'package:gamification/presentation/start/view/start_view.dart';
import 'package:gamification/presentation/start_view.dart';
import 'package:gamification/presentation/subject/view/subject_view.dart';

import '../progress/view/progress1.dart';
import '../subscription/view/subscription_view.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String profileRoute = "/profile";
  static const String onboardingRoute = "/onboarding";
  static const String courseRoute = "/course";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String enterTestRoute = "/enterTest";
  static const String languageRoute = "/language";
  static const String startRoute = "/start";
  static const String subjectRoute = "/subject";
  static const String examRoute = "/exam";
  static const String finalResultRoute = "/finalResult";
  static const String lectureVideoRoute = "/lectureVideoRoute";
  static const String goStartView = "/goStartView";
  static const String scoreBoard = "/scoreBoardView";
  static const String notificationRoute = "/notificationRoute";
  static const String mapView = "/mapView";
  static const String subjectsProgressRoute = "/subjectProgressRoute";
  static const String subjectDetailsProgressRoute =
      "/subjectDetailsProgressRoute";
  static const String paymentRoute = "/paymentRoute";
  static const String register = "/register";
  static const String passTest = "/passTest";
  static const String subiscription = "/subiscription";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.subiscription:
        initSubscriptionModule();
        return MaterialPageRoute(builder: (_) => const SubscriptionView());
      case Routes.homeRoute:
        initHomeModule();
        initProfileModule();
        initExamModule();
        initSubjectModule();
        initLectureVideoModule();
        initScoreBoardModule();
        initSubjectsProgressModule();
        initPaymentModule();

        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.scoreBoard:
        initScoreBoardModule();

        return MaterialPageRoute(builder: (_) => const ScoreBoardView());
      case Routes.subjectsProgressRoute:
        initSubjectsProgressModule();
        return MaterialPageRoute(
          builder: (_) => const ProgressAllSubjectsView(),
        );
      case Routes.register:
        initRegisterModule();
        return MaterialPageRoute(
          builder: (_) => const RegisterPageView(),
        );
      case Routes.profileRoute:
        initProfileModule();
        return MaterialPageRoute(
          builder: (_) => const ProfileView(),
        );
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.notificationRoute:
        return MaterialPageRoute(builder: (_) => const NotificationView());
      case Routes.courseRoute:
        return MaterialPageRoute(builder: (_) => CourseView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.enterTestRoute:
        final arguments = (settings.arguments ?? <String, dynamic>{}) as Map;

        return MaterialPageRoute(
            builder: (_) => EnterTestView(
                examId: arguments['examId'],
                subjectId: arguments['subjectId']));
      case Routes.languageRoute:
        return MaterialPageRoute(builder: (_) => const LanguageView());
      case Routes.startRoute:
        return MaterialPageRoute(builder: (_) => const StartView());
      case Routes.subjectRoute:
        final int subjectId = int.parse(settings.arguments.toString());
        initSubjectModule();
        return MaterialPageRoute(
            builder: (_) => SubjectView(subjectId: subjectId));
      // case Routes.examRoute:
      //   final int examId = int.parse(settings.arguments.toString());
      //   initExamModule();
      //   return MaterialPageRoute(builder: (_) => ExamView(examId: examId));
      // case Routes.finalResultRoute:
      //   return MaterialPageRoute(builder: (_) => const FinalResultView());
      case Routes.lectureVideoRoute:
        final int lessonId = int.parse(settings.arguments.toString());

        return MaterialPageRoute(
            builder: (_) => LectureVideoView(lessonId: lessonId));

      case Routes.goStartView:
        return MaterialPageRoute(builder: (_) => const GoStartView());

      case Routes.mapView:
        initMapModule();
        final arguments = settings.arguments as Map<String, dynamic>?;

        final int subjectId = arguments?['subjectId'];
        final String subjectName = arguments?['subjectName'];
        return MaterialPageRoute(
            builder: (_) => MapVerticalExample(
                  subjectId: subjectId,
                  subjectName: subjectName,
                ));

      case Routes.examRoute:
        initMapModule();
        final arguments = settings.arguments as Map<String, dynamic>?;

        final int examId = arguments?['examId'];
        final String subjectName = arguments?['subjectName'];

        return MaterialPageRoute(
            builder: (_) => ExamView(
                  examId: examId,
                  subjectName: subjectName,
                ));

      case Routes.paymentRoute:
        initPaymentModule();
        return MaterialPageRoute(builder: (_) => const PaymentMethods());
      case Routes.passTest:
      // final Object? passed = settings.arguments;

      // return MaterialPageRoute(
      //     builder: (_) => PassTestView(
      //           passed: passed,
      //         ),);
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.noRouteFound.tr()),
        ),
        body: Center(child: Text(LocaleKeys.noRouteFound.tr())),
      ),
    );
  }
}
