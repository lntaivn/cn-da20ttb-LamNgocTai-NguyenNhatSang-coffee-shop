import 'package:app/controllers/invoice_controller.dart';
import 'package:app/models/invoice_model.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/botton_nav_bar.dart';

class InvoiceList extends StatefulWidget {
  const InvoiceList({Key? key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<InvoiceList> with TickerProviderStateMixin {
  List<InvoiceModels> invoices = [];

  @override
  void initState() {
    super.initState();
    fetchInvoices();
  }

  fetchInvoices() async {
    InvoiceController controller = InvoiceController();
    invoices = await controller.getInvoices();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:
              const Text('Invoice List', style: TextStyle(color: Colors.black)),
        ),
        bottomNavigationBar: BottonNavBar(),
        body: invoices.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: invoices.length,
                itemBuilder: (context, index) {
                  return InvoiceItem(invoice: invoices[index]);
                }));
  }
}

class InvoiceItem extends StatelessWidget {
  final InvoiceModels invoice;

  InvoiceItem({required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      // Hiển thị thông tin invoice
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bàn ${invoice.tableId}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  // Text(DateFormat('dd/MM/yyyy HH:mm').format(invoice.createDate)),
                  SizedBox(height: 5),
                  Text("Tổng tiền: \$${invoice.totalAmount}"),
                  SizedBox(height: 5),
                  Text(
                    invoice.paymentStatus,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: invoice.paymentStatus == "Paid"
                          ? Colors.green
                          : Colors.red,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.white70,
                      size: 30,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.check_circle,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
