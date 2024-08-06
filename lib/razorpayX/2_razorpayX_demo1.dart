import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Razorpaydemo1 extends StatefulWidget {
  const Razorpaydemo1({super.key});

  @override
  State<Razorpaydemo1> createState() => _Razorpaydemo1State();
}

class _Razorpaydemo1State extends State<Razorpaydemo1> {
  Razorpay? _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();

    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay!.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      "Payment Successfully ${response.paymentId}",
      style: TextStyle(color: Colors.black, fontSize: 20),
    )));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      "Payment Error ${response.code} - ${response.error}",
      style: TextStyle(color: Colors.black, fontSize: 20),
    )));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      "Payment Wallet ${response.walletName}",
      style: TextStyle(color: Colors.black, fontSize: 20),
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RAZORPAY_X DEMO1",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                var options = {
                  'key': 'rzp_test_G3pty910OjAR1P',
                  'amount': 10000,
                  'name': 'Pradip Payment Demo1',
                  'description': 'Application Payment',
                  'prefill': {
                    'contact': '7016452294',
                    'email': 'test@razorpay.com'
                  }
                };
                _razorpay!.open(options);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Center(
                      child: Text(
                    "Open Razorpay Payment",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
