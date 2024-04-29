class CheckBalanceModel {
  List<BalanceModel?> userBalanceList;

  CheckBalanceModel(
    this.userBalanceList,
  );
}

class BalanceModel {
  String paymentType;
  bool isExpired;
  bool isCurrent;
  String ends;
  String begins;
  String paymentMonth;
  double amount;
  BalanceModel({
    required this.paymentType,
    required this.isExpired,
    required this.isCurrent,
    required this.ends,
    required this.begins,
    required this.amount,
    required this.paymentMonth
  });
}
