import 'dart:async';
import 'dart:ffi';

import 'package:gamification/domain/model/subject_progress/subjects_progress.dart';
import 'package:gamification/domain/usecase/get_all_subjects_progress.dart';
import 'package:gamification/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/model/subject_progress/subject_progress_details.dart';
import '../../../domain/usecase/subject_progress_details.dart';
import '../../common/state_rendrer/state_renderer.dart';
import '../../common/state_rendrer/state_renderer_impl.dart';

class SubjectsProgressViewModel extends BaseViewModel
    with SubjectsProgressViewModelInputs, SubjectsProgressViewModelOutputs {
  final StreamController _subjectsProgressDataStreamController =
      BehaviorSubject<SubjectsProgressModel>();
  final StreamController _subjectProgressDetailsDataStreamController =
      BehaviorSubject<SubjectProgressIdModel>();
  final StreamController _subjectIdDataStreamController =
      BehaviorSubject<int>();

  final SubjectsProgressUseCase _subjectsProgressUseCase;
  final SubjectProgressDetailsUseCase _subjectProgressDetailsUseCase;

  SubjectsProgressViewModel(
      this._subjectsProgressUseCase, this._subjectProgressDetailsUseCase);

  @override
  void dispose() {
    _subjectsProgressDataStreamController.close();

    _subjectProgressDetailsDataStreamController.close();
    super.dispose();
  }

  @override
  void start() {
    getSubjectsProgressData();
  }

  getSubjectProgressDetailsData(int num) async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _subjectProgressDetailsUseCase.execute(num)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (data) {
      inputSubjectDetailsProgressDataSink.add(data);

      inputState.add(ContentState());
    });
  }

  void getSubjectId(int num ) {
    inputSubjectIdsDataSink.add(num);
  }

  getSubjectsProgressData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _subjectsProgressUseCase.execute(Void)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (data) {
      inputSubjectsProgressDataSink.add(data);

      inputState.add(ContentState());
    });
  }

  //inputs
  @override
  Sink get inputSubjectsProgressDataSink =>
      _subjectsProgressDataStreamController.sink;
  @override
  Sink get inputSubjectDetailsProgressDataSink =>
      _subjectProgressDetailsDataStreamController.sink;

  //outputs
  @override
  Stream<SubjectProgressIdModel> get outSubjectDetailsProgressDataStream =>
      _subjectProgressDetailsDataStreamController.stream.map((event) => event);
  @override
  Stream<SubjectsProgressModel> get outSubjectsProgressDataStream =>
      _subjectsProgressDataStreamController.stream.map((event) => event);

  @override
  Sink get inputSubjectIdsDataSink => _subjectIdDataStreamController.sink;

  @override
  Stream<int> get outSubjectIdDataStream => _subjectIdDataStreamController.stream.map((event) => event);
}

abstract class SubjectsProgressViewModelInputs {
  Sink get inputSubjectsProgressDataSink;
  Sink get inputSubjectDetailsProgressDataSink;
  Sink get inputSubjectIdsDataSink;
}

abstract class SubjectsProgressViewModelOutputs {
  Stream<SubjectsProgressModel> get outSubjectsProgressDataStream;
  Stream<int> get outSubjectIdDataStream;
  Stream<SubjectProgressIdModel> get outSubjectDetailsProgressDataStream;
}
