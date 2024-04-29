import 'dart:async';
import 'dart:ffi';

import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/payment/all_payment_methods_model.dart';
import 'package:gamification/domain/model/payment/charge_amount_model.dart';
import 'package:gamification/domain/model/payment/plans_model.dart';
import 'package:gamification/domain/usecase/charge_amount_usecase.dart';
import 'package:gamification/domain/usecase/get_all_payment_methods.dart';
import 'package:gamification/domain/usecase/get_all_payment_plans.dart';
import 'package:gamification/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/state_rendrer/state_renderer.dart';
import '../../common/state_rendrer/state_renderer_impl.dart';

class PaymentMethodsViewModel extends BaseViewModel
    with PaymentMethodsViewModelInputs, PaymentMethodsViewModelOutputs {
  final StreamController _allPaymentMethodsStreamController =
      BehaviorSubject<AllPaymentMethodsModel>();
  final StreamController _allPaymentPlansStreamController =
      BehaviorSubject<PlansModel>();

  final StreamController _chargeAmountStreamController =
      BehaviorSubject<ChargeAmountModel>();

  final GetAllPaymentMethodsUseCase _allPaymentMethodsUseCase;
  final GetAllPaymentPlansUseCase _allPaymentPlansUseCase;
  final ChargeAmountUseCase _chargeAmountUseCase;

  PaymentMethodsViewModel(this._allPaymentMethodsUseCase,
      this._allPaymentPlansUseCase, this._chargeAmountUseCase);

  @override
  void dispose() {
    super.dispose();
    _allPaymentMethodsStreamController.close();
    _allPaymentPlansStreamController.close();
    _chargeAmountStreamController.close();
  }

  @override
  void start() {
    getAllPaymentMethods();
  }

  //inputs
  @override
  Sink get inPutAllPaymentMethods => _allPaymentMethodsStreamController.sink;

  @override
  Sink get inPutAllPaymentPlans => _allPaymentPlansStreamController.sink;

  @override
  Sink get inPutChargeAmount => _chargeAmountStreamController.sink;

  //outputs

  @override
  Stream<AllPaymentMethodsModel> get outPutAllPaymentMethods =>
      _allPaymentMethodsStreamController.stream
          .map((paymentMethod) => paymentMethod);

  @override
  Stream<PlansModel> get outPutAllPaymentPlans =>
      _allPaymentPlansStreamController.stream.map((plan) => plan);

  @override
  Stream<ChargeAmountModel> get outPutChargeAmount =>
      _chargeAmountStreamController.stream.map((event) => event);

  @override
  getAllPaymentMethods() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _allPaymentMethodsUseCase.execute(Void)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (data) {
      inPutAllPaymentMethods.add(data);
      inputState.add(ContentState());
    });
  }


  @override
  getAllPaymentPlans() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _allPaymentPlansUseCase.execute(Void)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (data) {
      inPutAllPaymentPlans.add(data);
      inputState.add(ContentState());
    });
  }

  @override
  chargeAmount(int amount, int paymentMethodId, int paymentPlanId) async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _chargeAmountUseCase.execute(ChargeAmountRequest(50, 2, 1, 3))).fold(
        (failure) {
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (data) {
      inPutChargeAmount.add(data);
      inputState.add(ContentState());
    });
  }
}

abstract class PaymentMethodsViewModelInputs {
  getAllPaymentMethods();

  getAllPaymentPlans();

  chargeAmount(int amount, int paymentMethodId, int paymentPlanId);

  Sink get inPutAllPaymentMethods;

  Sink get inPutAllPaymentPlans;

  Sink get inPutChargeAmount;
}

abstract class PaymentMethodsViewModelOutputs {
  Stream<AllPaymentMethodsModel> get outPutAllPaymentMethods;

  Stream<PlansModel> get outPutAllPaymentPlans;

  Stream<ChargeAmountModel> get outPutChargeAmount;
}
