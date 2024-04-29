import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:gamification/domain/model/map_model/map_model.dart';
import 'package:gamification/domain/usecase/get_subject_map_usecase.dart';
import 'package:gamification/presentation/base/base_view_model.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';

class MapViewModel extends BaseViewModel
    implements MapViewModelInputs, MapViewModelOutputs {
  final StreamController _mapModelStreamController =
      StreamController<MapModel>();
  final GetSubjectMapByIdUseCase _getSubjectMapByIdUseCase;

  List<SubjectExamsModel> subjectExamsList = [];

  MapViewModel(this._getSubjectMapByIdUseCase);

  @override
  void dispose() {
    super.dispose();
    _mapModelStreamController.close();
  }

  @override
  void start() {
    getSubjectMapById(123);
  }

  /// inputs
  @override
  Sink get inputMapModel => _mapModelStreamController.sink;

  /// outputs

  @override
  Stream<MapModel> get outputsMapModel =>
      _mapModelStreamController.stream.map((mapModel) => mapModel);

  Future<List<SubjectExamsModel>> getSubjectMapById(int id) async {

    (await _getSubjectMapByIdUseCase.execute(id)).fold((failure) {
      // left -> failure

      inputState.add(
        ErrorState(StateRendererType.fullScreenErrorState, failure.message),
      );

      return subjectExamsList;
    }, (submitDetails) {

      for (int i = 0; i < submitDetails.subjectMapModel.eduUnitModel.length; i++) {
        for(int j = 0; j < submitDetails.subjectMapModel.eduUnitModel[i].unitExams.length; j++) {
          subjectExamsList.add(submitDetails.subjectMapModel.eduUnitModel[i].unitExams[j]);
        }
      }

      for (int i = 0; i < submitDetails.subjectMapModel.examsModel.length; i++) {
        subjectExamsList.add(submitDetails.subjectMapModel.examsModel[i]);
      }

      for (var a in subjectExamsList) {
        debugPrint('${a.examId}');
      }

      inputState.add(ContentState());
      inputMapModel.add(submitDetails);

      print(subjectExamsList.length);
      return subjectExamsList;
    });

    return subjectExamsList;
  }
}

abstract class MapViewModelInputs {
  Sink get inputMapModel;
}

abstract class MapViewModelOutputs {
  Stream<MapModel> get outputsMapModel;
}
