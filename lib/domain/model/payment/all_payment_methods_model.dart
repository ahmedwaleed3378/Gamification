class AllPaymentMethodsModel {
  List<PaymentMethodsModel> paymentMethods;

  AllPaymentMethodsModel(
    this.paymentMethods,
  );
}

class PaymentMethodsModel {
  int id;
  String arName;
  String enName;
  String attachPath;
  bool isFawry;
  bool isVisa;
  bool isVFCash;
  PaymentMethodsModel(this.id, this.arName, this.enName, this.attachPath , this.isFawry , this.isVisa , this.isVFCash);
}
