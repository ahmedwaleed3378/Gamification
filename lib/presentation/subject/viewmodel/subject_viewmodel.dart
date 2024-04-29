import 'dart:async';

import 'package:gamification/domain/model/courses/subject_model.dart';
import 'package:gamification/domain/model/searched_unit/searched_unit_model.dart';
import 'package:gamification/domain/model/sub_course/sub_course_model.dart';
import 'package:gamification/domain/model/unit_data/unit_data_model.dart';
import 'package:gamification/domain/model/unit_files/unit_files_model.dart';
import 'package:gamification/domain/usecase/searched_unit_usecase.dart';
import 'package:gamification/domain/usecase/sub_course_usecase.dart';
import 'package:gamification/domain/usecase/subject_unit_usecase.dart';
import 'package:gamification/domain/usecase/unit_data_usecase.dart';
import 'package:gamification/domain/usecase/unit_file_usecase.dart';
import 'package:gamification/presentation/base/base_view_model.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';

class SubjectViewModel extends BaseViewModel
    implements SubjectViewModelInputs, SubjectViewModelOutputs {
  final StreamController unitStreamController =
      StreamController<List<SearchedUnitModel>>.broadcast();

  final StreamController unitDataStreamController =
      StreamController<UnitDataModel>.broadcast();
  final StreamController subCoursesStreamController =
      StreamController<SubCourseModel>.broadcast();

  final StreamController unitFileStreamController =
      StreamController<UnitFileModel>.broadcast();

  final StreamController subjectUnitStreamController =
      StreamController<List<SubjectUnitModel>>.broadcast();

  final SearchedUnitUseCase _searchedUnitUseCase;
  final UnitDataUseCase _unitDataUseCase;
  final SubCourseUseCase _subCourseUseCase;
  final UnitFileUseCase _unitFileUseCase;
  final SubjectUnitUseCase _subjectUnitUseCase;

  SubjectViewModel(
    this._searchedUnitUseCase,
    this._unitDataUseCase,
    this._subCourseUseCase,
    this._unitFileUseCase,
    this._subjectUnitUseCase,
  );

  @override
  void start() {
    getAllData();
  }

  @override
  void dispose() {
    unitStreamController.close();
    unitDataStreamController.close();
    subCoursesStreamController.close();
    unitFileStreamController.close();
  }

  getAllData() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.popupLoadingState),
    );
  }

  getSearchedUnit(int subjectId) async {
    (await _searchedUnitUseCase.execute(subjectId)).fold((failure) {
      inputState.add(
        ErrorState(
          StateRendererType.popupErrorState,
          failure.message,
        ),
      );
    }, (unit) {
      inputState.add(ContentState());
      getUnitData(unit[0].id);
      inputUnit.add(unit);
    });
  }

  getSubjectUnits(int subjectId) async {
    (await _subjectUnitUseCase.execute(subjectId)).fold((failure) {
      inputState.add(
        ErrorState(
          StateRendererType.popupErrorState,
          failure.message,
        ),
      );
    }, (unit) {
      inputState.add(ContentState());
      inputSubjectUnit.add(unit);
    });
  }

  getUnitData(int unitId) async {
    (await _unitDataUseCase.execute(unitId)).fold((failure) {
      inputState.add(
        ErrorState(
          StateRendererType.popupErrorState,
          failure.message,
        ),
      );
    }, (data) {
      inputState.add(ContentState());
      inputUnitData.add(data);
    });
  }

  getSubCourses(int courseId) async {
    (await _subCourseUseCase.execute(courseId)).fold((failure) {
      inputState.add(
        ErrorState(
          StateRendererType.popupErrorState,
          failure.message,
        ),
      );
    }, (course) {
      inputState.add(ContentState());
      inputSubCourses.add(course);
    });
  }

  getUnitFile(int unitId) async {
    (await _unitFileUseCase.execute(unitId)).fold((failure) {
      inputState.add(
        ErrorState(
          StateRendererType.popupErrorState,
          failure.message,
        ),
      );
    }, (file) {
      inputState.add(ContentState());
      inputUnitFile.add(file);
    });
  }

  ///Inputs /////
  @override
  Sink get inputSubCourses => subCoursesStreamController.sink;

  @override
  Sink get inputUnit => unitStreamController.sink;

  @override
  Sink get inputUnitData => unitDataStreamController.sink;

  @override
  Sink get inputUnitFile => unitFileStreamController.sink;

  @override
  Sink get inputSubjectUnit => subjectUnitStreamController.sink;

  /// Outputs ///
  @override
  Stream<SubCourseModel> get outputSubCourses =>
      subCoursesStreamController.stream.map((course) => course);

  @override
  Stream<List<SearchedUnitModel>> get outputUnit =>
      unitStreamController.stream.map((unit) => unit);

  @override
  Stream<UnitDataModel> get outputUnitData =>
      unitDataStreamController.stream.map((data) => data);

  @override
  Stream<UnitFileModel> get outputUnitFile =>
      unitFileStreamController.stream.map((file) => file);

  @override
  Stream<List<SubjectUnitModel>> get outputSubjectUnit =>
      subjectUnitStreamController.stream.map((file) => file);
}

abstract class SubjectViewModelInputs {
  Sink get inputUnit;

  Sink get inputSubjectUnit;

  Sink get inputUnitData;

  Sink get inputSubCourses;

  Sink get inputUnitFile;
}

abstract class SubjectViewModelOutputs {
  Stream<List<SearchedUnitModel>> get outputUnit;

  Stream<List<SubjectUnitModel>> get outputSubjectUnit;

  Stream<UnitDataModel> get outputUnitData;

  Stream<SubCourseModel> get outputSubCourses;

  Stream<UnitFileModel> get outputUnitFile;
}
