import 'dart:async';
import 'dart:ffi';

import 'package:gamification/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/model/check_balance/check_balance.dart';
import '../../../domain/usecase/check_balance.dart';
import '../../common/state_rendrer/state_renderer.dart';
import '../../common/state_rendrer/state_renderer_impl.dart';

class CheckBalanceViewModel extends BaseViewModel
    with CheckBalanceViewModelInputs, CheckBalanceViewModelOutputs {
  final StreamController _checkBalanceDataStreamController =
      BehaviorSubject<CheckBalanceModel>();

  final CheckBalanceUseCase _checkBalanceUseCase;

  CheckBalanceViewModel(this._checkBalanceUseCase);

  @override
  void dispose() {
    _checkBalanceDataStreamController.close();
    super.dispose();
  }

  @override
  void start() {
    getCheckBalanceData();
  }

  getCheckBalanceData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _checkBalanceUseCase.execute(Void)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (data) {
      checkBalanceDataSink.add(data);

      inputState.add(ContentState());
    });
  }



  //inputs
  @override
  Sink get checkBalanceDataSink => _checkBalanceDataStreamController.sink;


  //outputs
  @override
  Stream<CheckBalanceModel> get outCheckBalanceDataStream =>
      _checkBalanceDataStreamController.stream.map((event) => event);


}

abstract class CheckBalanceViewModelInputs {
  Sink get checkBalanceDataSink;
}

abstract class CheckBalanceViewModelOutputs {
  Stream<CheckBalanceModel> get outCheckBalanceDataStream;
}
