import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/domain/model/exam/exam_result_model.dart';
import 'package:gamification/domain/model/exam/submit_exam_model.dart';
import 'package:gamification/domain/model/exam/submit_single_question_model.dart';
import 'package:gamification/domain/usecase/single_question_complete_usecase.dart';
import 'package:gamification/domain/usecase/single_question_container_history_usecase.dart';
import 'package:gamification/domain/usecase/single_question_container_usecase.dart';
import 'package:gamification/domain/usecase/single_question_translate_usecase.dart';
import 'package:gamification/domain/usecase/submit_mcq_single_question_history.dart';
import 'package:gamification/domain/usecase/exam_details_usecase.dart';
import 'package:gamification/domain/usecase/exam_result_usecase.dart';
import 'package:gamification/domain/usecase/submit_exam_usecase.dart';
import 'package:gamification/domain/usecase/submit_single_matching_history_usecase.dart';
import 'package:gamification/domain/usecase/submit_single_matching_question_usecase.dart';
import 'package:gamification/domain/usecase/submit_single_question_usecase.dart';
import 'package:gamification/presentation/base/base_view_model.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/resources/constants_manager.dart';
import 'package:rxdart/subjects.dart';

import '../../../domain/usecase/submit_mcq_single_question_usecase.dart';
import '../../../domain/usecase/submit_qvoice_question_usecase.dart';
import '../../../domain/usecase/submit_single_question_history.dart';

class ExamViewModel extends BaseViewModel
    implements ExamViewModelOutputs, ExamViewModelInputs {
  final ExamDetailsUseCase _examDetailsUseCase;
  final ExamResultUseCase _examResultUseCase;
  final SubmitSingleQuestionExamUseCase _singleQuestionExamUseCase;
  final SubmitExamCase _submitExamCase;
  final SingleQuestionTranslateUseCase _singleQuestionTranslateUseCase;
  final SingleQuestionCompleteUseCase _singleQuestionCompleteUseCase;
  final SubmitSingleQuestionExamHistoryUseCase
  _singleQuestionExamHistoryUseCase;
  final SubmitMCQSingleQuestionExamHistoryUseCase
  _singleMCQQuestionExamHistoryUseCase;
  final SubmitMCQSingleQuestionExamUseCase _submitMCQSingleQuestionExamUseCase;
  final SingleQuestionContainerUseCase _singleQuestionContainerUseCase;
  final SubmitSingleMatchingQuestionExamUseCase _matchingQuestionExamUseCase;
  final SubmitSingleMatchingQuestionExamHistoryUseCase
  _matchingQuestionExamHistoryUseCase;
  final SubmitSingleQVoiceQuestionUseCase _singleQVoiceQuestionUseCase;
  final SingleQuestionContainerHistoryUseCase _containerHistoryUseCase;
  final StreamController _examDetailsController =
  BehaviorSubject<ExamDetailsModel>();
  final StreamController examResultController =
  BehaviorSubject<ExamResultModel>();
  final StreamController _submitSingleQuestController =
  BehaviorSubject<SubmitSingleQuestionModel>();
  final StreamController _submitExamController =
  BehaviorSubject<SubmitExamModel>();
  final StreamController _examDetailsAndResultModelController =
  BehaviorSubject<ExamDetailsAndResultModel>();

  final StreamController submitQuestionController =
  BehaviorSubject<bool>();

  final AppPreferences _appPreferences = instance<AppPreferences>();
  int userId = 0;
  int totalMark = 0;
  int result = 0;
  List<int> list = [];
  bool isMarked = false;
  List<int> selectedChoices = [];
  SubmitExamModel examResult = SubmitExamModel('', 0, 0, '', false, 0, 0, '');
  int examId = 0;
  ExamDetailsAndResultModel? examDetailsAndResultModel;
  List<bool> allQuestAnswers = List<bool>.generate(0, (i) => false);

  ExamViewModel(
      this._examDetailsUseCase,
      this._examResultUseCase,
      this._singleQuestionExamUseCase,
      this._submitExamCase,
      this._singleQuestionExamHistoryUseCase,
      this._submitMCQSingleQuestionExamUseCase,
      this._singleMCQQuestionExamHistoryUseCase,
      this._singleQuestionContainerUseCase,
      this._matchingQuestionExamUseCase,
      this._matchingQuestionExamHistoryUseCase,
      this._singleQVoiceQuestionUseCase,
      this._containerHistoryUseCase,
      this._singleQuestionTranslateUseCase,
      this._singleQuestionCompleteUseCase,
      );

  @override
  void start() {
    getData();
  }

  getData() {
    getUserId();
    examDetails();
    // examResults();
  }

  getUserId() {
    userId = _appPreferences.getUserId();
  }

  setIsMarke(bool isSolved) {
    isMarked = isSolved;
  }

  setExamId(int id) {
    examId = id;
  }

  @override
  void dispose() {
    list = [];
    _examDetailsController.close();
    examResultController.close();
    _submitSingleQuestController.close();
    _submitExamController.close();
    submitQuestionController.close();
    super.dispose();
  }

  /// outputs
  @override
  Stream<ExamDetailsModel> get outputExamDetails =>
      _examDetailsController.stream.map((details) => details);

  @override
  Stream<ExamResultModel> get outputExamResult =>
      examResultController.stream.map((result) => result);

  @override
  Stream<SubmitSingleQuestionModel> get outputExamSingleQuestSubmit =>
      _submitSingleQuestController.stream.map((event) => event);

  @override
  Stream<SubmitExamModel> get outputExamSubmit =>
      _submitExamController.stream.map((submit) => submit);

  @override
  Stream<ExamDetailsAndResultModel> get outputExamDetailsAndResultData =>
      _examDetailsAndResultModelController.stream.map((event) => event);

  @override
  Stream<bool> get outputIsSubmittedSuccessfullty => submitQuestionController.stream.map((event) => event);

  /// inputs
  @override
  Sink get inputExamSingleQuestSubmit => _submitSingleQuestController.sink;

  @override
  Sink get inputExamDetails => _examDetailsController.sink;

  @override
  Sink get inputExamResult => examResultController.sink;

  @override
  Sink get inputExamSubmit => _submitExamController.sink;

  @override
  Sink get inputExamDetailsAndResultData =>
      _examDetailsAndResultModelController.sink;

  @override
  Sink get inputIsSubmittedSuccessfullty => submitQuestionController.sink;



  examDetails({int? id}) async {
    ///
    (await _examDetailsUseCase.execute(id ?? examId)).fold((failure) {
      // left -> failure
      if (failure.code == -5) {
        /// add return -5 to show exam result
        ExamDetailsModel examDetailsModel =
        ExamDetailsModel(-5, null, null, '');
        inputExamDetails.add(examDetailsModel);

        examResults();
      } else {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      }
    }, (examDetails) {
      // right -> data (success)
      //   collect all questions of multi groups in one header
      for (int i = 1; i < examDetails.exam!.groups!.length; i++) {
        for (int j = 0; j < examDetails.exam!.groups![i].heads!.length; j++) {
          examDetails.exam!.groups![0].heads!
              .add(examDetails.exam!.groups![i].heads![j]);
        }
      }

      for (int j = 1; j < examDetails.exam!.groups![0].heads!.length; j++) {
        examDetails.exam!.groups![0].heads![0].questions!
            .add(examDetails.exam!.groups![0].heads![j].questions![j]);
      }


      inputState.add(ContentState());
      inputExamDetails.add(examDetails);
    });
  }

  examResults() async {
    (await _examResultUseCase.execute(examId)).fold((failure) {
      // left -> failure
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (examResults) {
      // right -> data (success)
      // content
      for (int i = 1; i < examResults.item!.groups!.length; i++) {
        for (int j = 0; j < examResults.item!.groups![i].heads!.length; j++) {
          examResults.item!.groups![0].heads!
              .add(examResults.item!.groups![i].heads![j]);
        }
      }

      for (int j = 1; j < examResults.item!.groups![0].heads!.length; j++) {
        examResults.item!.groups![0].heads![0].questions!
            .add(examResults.item!.groups![0].heads![j].questions![j]);
      }
      inputState.add(ContentState());
      inputExamResult.add(examResults);
    });
  }

  submitSingleQuestion(int examId, int pickedChoiceId, int questionId,
      int pageIndex, PageController pageController, int selectedAnswer) async {
    (await _singleQuestionExamUseCase.execute(
      SubmitSingleQuestionRequest(
        examId: examId,
        studentUserId: userId,
        // pickedChoiceId: pickedChoiceId,
        questionId: questionId,
      ),
    ))
        .fold((failure) {
      // left -> failure
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (singleSubmitDetails) {
      // right -> data (success)
      // content
      /// save previous choices
      selectedChoices[pageIndex] = selectedAnswer;
      inputState.add(ContentState());
      inputExamSingleQuestSubmit.add(singleSubmitDetails);
      pageController.animateToPage(++pageIndex,
          duration:
          const Duration(milliseconds: AppConstants.sliderAnimationTime),
          curve: Curves.bounceInOut);
    });
  }

  submitMCQSingleQuestion(int examMcqId, int pickedChoiceId, int questionId,
      int pageIndex, PageController pageController, int selectedAnswer) async {
    log(examMcqId.toString() + ' in mcq view');
    log(
      _appPreferences.getUserId().toString(),
    );
    (await _submitMCQSingleQuestionExamUseCase.execute(
      SubmitMCQSingleQuestionRequest(
        examId: examMcqId,
        studentUserId: _appPreferences.getUserId(), // userId,
        pickedChoiceId: pickedChoiceId,
        questionId: questionId,
      ),
    ))
        .fold((failure) {
      // left -> failure
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (singleSubmitDetails) {
      // right -> data (success)
      // content
      /// save previous choices
      inputState.add(ContentState());
      inputExamSingleQuestSubmit.add(singleSubmitDetails);
    });
  }

  submitExam() async {
    DateTime now = DateTime.now();

    String formattedTime = DateFormat('kk:mm:ss').format(now);

    (await _submitExamCase.execute(SubmitExamRequest(
        examId: examId,
        studentUserId: userId,
        solvedExamStudentID: 0,
        examStarTime: formattedTime)))
        .fold((failure) {
      // left -> failure
      inputState.add(
        ErrorState(StateRendererType.fullScreenErrorState, failure.message),
      );
    }, (submitDetails) {
      // right -> data (success)
      // content
      examResult = submitDetails;
      inputState.add(ContentState());
      inputExamSubmit.add(submitDetails);
      inputIsSubmittedSuccessfullty.add(true);
      // inputState.add(SuccessState(StateRendererType.popupSuccessState,
      //     ' ${examDetails.message} grade = ${examDetails.result}'));
    });
  }

  submitSingleQuestionHistory(
      int examIdSingleSubmit, int pickedChoiceId, int questionId) async {
    (await _singleQuestionExamHistoryUseCase
        .execute(SubmitSingleQuestionRequest(
        examId: examIdSingleSubmit,
        studentUserId: _appPreferences.getUserId(),
        // pickedChoiceId: pickedChoiceId,
        questionId: questionId)))
        .fold((failure) {
      // left -> failure
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (singleSubmitDetails) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      inputExamSingleQuestSubmit.add(singleSubmitDetails);
    });
  }

  submitMCQSingleQuestionHistory(
      int examMcqId, int pickedChoiceId, int questionId) async {
    log(examMcqId.toString() + ' in mcq view');
    (await _singleMCQQuestionExamHistoryUseCase.execute(
      SubmitMCQSingleQuestionRequest(
          examId: examMcqId,
          studentUserId: userId, // userId,
          pickedChoiceId: pickedChoiceId,
          questionId: questionId),
    ))
        .fold((failure) {
      // left -> failure
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (singleSubmitDetails) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      inputExamSingleQuestSubmit.add(singleSubmitDetails);
    });
  }

  submitSingleQuestionMatching(
      int questionId, List<MatchingAnswers> matchingAnswers, int examId) async {
    print('sssssss$examId');
    print('====');
    for (MatchingAnswers d in matchingAnswers) {
      print("left ${d.leftSideId}");
      print("right ${d.rightSideId}");
    }
    print('====');
    (await _matchingQuestionExamUseCase.execute(SubmitMatchingQuestionRequest(
        examId: examId,
        questionId: questionId,
        studentUserId: userId,
        matchingAnswers: matchingAnswers)))
        .fold((failure) {
      // left -> failure
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
      print('not doneeeeeeeeee');
    }, (singleSubmitDetails) {
      // right -> data (success)
      // content
      print('doneeeeeeeeee');
      inputState.add(ContentState());
    });
  }

  submitSingleQuestionMatchingHistory(
      int questionId, int leftSideId, int rightSideId, int exmaId) async {
    (await _matchingQuestionExamHistoryUseCase.execute(
        SubmitMatchingQuestionRequestHistory(
            examId: exmaId,
            questionId: questionId,
            studentUserId: userId,
            leftSideId: leftSideId,
            rightSideId: rightSideId)))
        .fold((failure) {
      // left -> failure
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (singleSubmitDetails) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
    });
  }

  submitSingleCVoiceQuestionHistory(
      int questionId, String answer, int examId) async {
    (await _singleQVoiceQuestionUseCase.execute(
        SubmitSingleVoiceQuestionRequest(
            examId: examId,
            questionId: questionId,
            studentUserId: userId,
            answerText: answer)))
        .fold((failure) {
      // left -> failure
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (singleSubmitDetails) {
      // right -> data (success)
      // content
      examDetails();

      inputState.add(ContentState());
    });
  }

  submitSingleContainerQuestion(int questionId,
      List<ContainerQuestionDetails> questionDetails, int examId) async {
    log(_appPreferences.getUserId().toString() + ' in quuuuu');
    log(questionId.toString() + ' in quuuuu');
    (await _singleQuestionContainerUseCase.execute(
        ContainerSubmitSingleQuestionRequest(
            examId: examId,
            studentUserId: _appPreferences.getUserId(),
            questionId: questionId,
            questionDetails: questionDetails)))
        .fold((failure) {
      // left -> failure
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (singleSubmitDetails) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
    });
  }

  submitSingleContainerQuestionHistory(int questionId, int questionSentenceId,
      int questionAnswerId, int examId) async {
    (await _containerHistoryUseCase.execute(SubmitSingleQuestionRequest(
        examId: examId,
        studentUserId: userId,
        questionId: questionId,
        questionSentenceId: questionSentenceId,
        questionAnswerId: questionAnswerId)))
        .fold((failure) {
      // left -> failure
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (singleSubmitDetails) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
    });
  }

  submitTranslateSingleQuestion(
      int questionId, String answer, int examId) async {
    (await _singleQuestionTranslateUseCase.execute(
      SubmitTranslateSingleQuestionRequest(
        examId: examId,
        questionId: questionId,
        studentUserId: _appPreferences.getUserId(),
        answerText: answer,
      ),
    ))
        .fold((failure) {
      // left -> failure
      inputState.add(
        ErrorState(StateRendererType.fullScreenErrorState, failure.message),
      );
    }, (singleSubmitDetails) {
      inputState.add(ContentState());
    });
  }

  submitCompleteSingleQuestion({
    required int questionId,
    required int examId,
    List<CompleteQuestionDetails>? questionDetails,
  }) async {
    (await _singleQuestionCompleteUseCase.execute(
      CompleteSubmitSingleQuestionRequest(
        examId: examId,
        questionId: questionId,
        studentUserId: _appPreferences.getUserId(),
        questionDetails: questionDetails,
      ),
    ))
        .fold((failure) {
      // left -> failure
      inputState.add(
        ErrorState(StateRendererType.fullScreenErrorState, failure.message),
      );
    }, (singleSubmitDetails) {
      inputState.add(ContentState());
    });
  }


}

abstract class ExamViewModelInputs {
  Sink get inputExamDetails;

  Sink get inputExamResult;

  Sink get inputExamSingleQuestSubmit;

  Sink get inputExamSubmit;

  Sink get inputExamDetailsAndResultData;

  Sink get inputIsSubmittedSuccessfullty;
}

abstract class ExamViewModelOutputs {
  Stream<ExamDetailsModel> get outputExamDetails;

  Stream<ExamResultModel> get outputExamResult;

  Stream<SubmitSingleQuestionModel> get outputExamSingleQuestSubmit;

  Stream<SubmitExamModel> get outputExamSubmit;

  Stream<ExamDetailsAndResultModel> get outputExamDetailsAndResultData;

  Stream<bool> get outputIsSubmittedSuccessfullty;
}

class ExamDetailsAndResultModel {
  final List<QuestionsModel> questions;
  final String subjectArName;
  final String subjectEnName;

  ExamDetailsAndResultModel(
      this.questions, this.subjectArName, this.subjectEnName);
}