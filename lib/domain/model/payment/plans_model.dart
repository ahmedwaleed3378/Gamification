class PlansModel {
  List<PaymentPlansModel> paymentPlans;

  PlansModel(this.paymentPlans);
}

class PaymentPlansModel {
  int id;
  String planName;
  double price;
  int duration;

  PaymentPlansModel(
    this.id,
    this.planName,
    this.price,
    this.duration,
  );
}
