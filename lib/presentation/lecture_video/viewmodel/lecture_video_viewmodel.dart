import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/lecture_parts/lecture_parts_model.dart';
import 'package:gamification/domain/usecase/create_viewrow_usecase.dart';
import 'package:gamification/domain/usecase/increment_row_usecase.dart';
import 'package:gamification/domain/usecase/lecture_parts_usecase.dart';
import 'package:gamification/presentation/base/base_view_model.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';

class LectureVideoViewModel extends BaseViewModel
    implements LectureVideoViewModelInputs, LectureVideoViewModelOutputs {
  final StreamController lectureVideoStreamController =
      StreamController<LecturePartsModel>.broadcast();

  final LecturePartsUseCase _lecturePartsUseCase;
  final CreateViewRowUseCase _createViewRowUseCase;
  final IncrementViewRowUseCase _incrementViewRowUseCase;
  String partVideo = '';

  LectureVideoViewModel(
    this._lecturePartsUseCase,
    this._createViewRowUseCase,
    this._incrementViewRowUseCase,
  );

  @override
  void start() {
    getAllData();
  }

  @override
  void dispose() {
    lectureVideoStreamController.close();
  }

  getAllData() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.popupLoadingState),
    );
  }

  getLectureParts(int lessonId) async {
    (await _lecturePartsUseCase.execute(lessonId)).fold((failure) {
      inputState.add(
        ErrorState(
          StateRendererType.popupErrorState,
          failure.message,
        ),
      );
    }, (lecture) {
      inputState.add(ContentState());
      partVideo = lecture.model!.parts![0].path;
      inputLectureParts.add(lecture);
    });
  }

  createViewRow(int materialId, int partId) async {
    LectureRowRequest lectureRowRequest = LectureRowRequest(materialId, partId);

    (await _createViewRowUseCase.execute(lectureRowRequest)).fold((failure) {
      inputState.add(
        ErrorState(
          StateRendererType.popupErrorState,
          failure.message,
        ),
      );
    }, (message) {
      debugPrint('success');
      inputState.add(ContentState());
    });
  }

  incrementView(int materialId, int partId) async {
    LectureRowRequest lectureRowRequest = LectureRowRequest(materialId, partId);

    (await _incrementViewRowUseCase.execute(lectureRowRequest)).fold((failure) {
      inputState.add(
        ErrorState(
          StateRendererType.popupErrorState,
          failure.message,
        ),
      );
    }, (message) {
      inputState.add(ContentState());
    });
  }

  @override
  Sink get inputLectureParts => lectureVideoStreamController.sink;

  @override
  Stream<LecturePartsModel> get outputLectureParts =>
      lectureVideoStreamController.stream.map((lecture) => lecture);
}

abstract class LectureVideoViewModelInputs {
  Sink get inputLectureParts;
}

abstract class LectureVideoViewModelOutputs {
  Stream<LecturePartsModel> get outputLectureParts;
}
