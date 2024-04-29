import 'dart:async';
import 'dart:ffi';

import 'package:gamification/domain/model/student_rank/student_rank_model.dart';
import 'package:gamification/domain/usecase/student_rank_usecase.dart';
import 'package:gamification/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/state_rendrer/state_renderer.dart';
import '../../common/state_rendrer/state_renderer_impl.dart';

class ScoreBoardViewModel extends BaseViewModel
    with ScoreBoardViewModelInputs, ScoreBoardViewModelOutputs {
  final StreamController _scoreBoardDataStreamController =
      BehaviorSubject<StudentRankModel>();

  final StudentRankUseCase _studentRankUseCase;

  ScoreBoardViewModel(this._studentRankUseCase );

  @override
  void dispose() {
    _scoreBoardDataStreamController.close();
    super.dispose();
  }

  @override
  void start() {
    getScoreBoardData();
  }

  getScoreBoardData() async {
    // inputState.add(LoadingState(
    //     stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _studentRankUseCase.execute(Void)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (data) {
      scoreBoardDataSink.add(data);

      inputState.add(ContentState());
    });
  }



  //inputs
  @override
  Sink get scoreBoardDataSink => _scoreBoardDataStreamController.sink;


  //outputs
  @override
  Stream<StudentRankModel> get outScoreBoardDataStream =>
      _scoreBoardDataStreamController.stream.map((event) => event);


}

abstract class ScoreBoardViewModelInputs {
  Sink get scoreBoardDataSink;
}

abstract class ScoreBoardViewModelOutputs {
  Stream<StudentRankModel> get outScoreBoardDataStream;
}
