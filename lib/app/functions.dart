import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/presentation/exam/components/letters_collections.dart';

import '../presentation/exam/view/exam_view.dart';
import '../presentation/exam/viewmodel/exam_viewmodel.dart';
import '../presentation/widget/custom_dialog.dart';

bool isCurrentLanguageEn(context) {
  return EasyLocalization.of(context)!.locale.languageCode == 'en'
      ? true
      : false;
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isMobileNumberValid(String mobileNumber) {
  RegExp regex = RegExp(r'^01[0-2]\d{8}$');
  return regex.hasMatch(mobileNumber);
}

bool isValidName(String name) {
  RegExp nameRegex = RegExp(r"^[a-zA-Z\u0600-\u06FF\s]{4,}$");
  return nameRegex.hasMatch(name);
}

validateName(String value, String msgIfEmpty, String msgNotValid) {
  if (value.isEmpty) {
    return msgIfEmpty; // Please enter your name
  } else if (!isValidName(value)) {
    return msgNotValid; // Please enter a valid name
  }
  return null;
}

bool containsArabic(List<String>? strings) {
  if (strings == null) {
    return false;
  }

  for (final string in strings) {
    for (final char in string.runes) {
      if ((char >= 0x0600 && char <= 0x06FF) ||
          (char >= 0xFB50 && char <= 0xFDFF) ||
          (char >= 0xFE70 && char <= 0xFEFF)) {
        return true;
      }
    }
  }
  return false;
}

bool containsEnglish(List<String>? strings) {
  if (strings == null) {
    return false;
  }

  for (final string in strings) {
    for (final char in string.runes) {
      if ((char >= 0x0041 && char <= 0x007A) ||
          (char >= 0x00C0 && char <= 0x024F)) {
        return true;
      }
    }
  }
  return false;
}

bool containsArabicLetterCollection(List<LettersCollectionDragModel>? strings) {
  if (strings == null) {
    return false;
  }

  for (final string in strings) {
    for (final char in string.letter.runes) {
      if ((char >= 0x0600 && char <= 0x06FF) ||
          (char >= 0xFB50 && char <= 0xFDFF) ||
          (char >= 0xFE70 && char <= 0xFEFF)) {
        return true;
      }
    }
  }
  return false;
}
bool containsArabicLetter(List<String>? strings) {
  if (strings == null) {
    return false;
  }

  for (final string in strings) {
    for (final char in string.runes) {
      if ((char >= 0x0600 && char <= 0x06FF) ||
          (char >= 0xFB50 && char <= 0xFDFF) ||
          (char >= 0xFE70 && char <= 0xFEFF)) {
        return true;
      }
    }
  }
  return false;
}

submitExam(
  bool isSolved,
  BuildContext context,
  VoidCallback dialog,
  List<int> leftQuestions,
  bool notTimeOut,
  ExamViewModel examViewModel,
  PageController pageController,
) {
  if (isSolved) {
    dialog;
  } else {
    leftQuestions = [];

    for (int i = 0; i < ExamView.allQuestAnswers.length; i++) {
      if (ExamView.allQuestAnswers[i] == false) {
        leftQuestions.add(i);
      }
    }
    print(leftQuestions.length);
    if (ExamView.allQuestAnswers.contains(false)
     && notTimeOut
    ) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            examViewModel: examViewModel,
            timesUp: false,
            leftQuestions: true,
            numLeftQuestions: leftQuestions,
            pageController: pageController,
          );
        },
      );
      print('yessssssssss');
     
    } else {
      examViewModel.submitExam();
    }
  }
}
