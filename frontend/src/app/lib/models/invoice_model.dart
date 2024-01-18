class InvoiceModels {
  int invoiceId;
  int tableId;
  int userId;
  DateTime createDate;
  int totalAmount;
  String paymentStatus;

  InvoiceModels(
      {required this.invoiceId,
      required this.tableId,
      required this.userId,
      required this.createDate,
      required this.totalAmount,
      required this.paymentStatus});

  factory InvoiceModels.fromJson(Map<String, dynamic> json) {
    return InvoiceModels(
        invoiceId: json['invoiceId'],
        tableId: json['tableId'],
        userId: json['userId'],
        createDate: DateTime.parse(json['createDate']),
        totalAmount: json['totalAmount'],
        paymentStatus: json['paymentStatus']);
  }
}
