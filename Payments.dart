import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_navigation_bloc/navigation_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class Payments extends StatefulWidget with NavigationStates {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout(){
    var options = {
      "key" : "rzp_test_KeDKZlTiqsX5ij",
      "amount" : num.parse(textEditingController.text)*100,
      "name" : "The Network App",
      "description" : "Payment for the some random product",
      "prefill" : {
        "contact" : "2323232323",
        "email" : "shd@gmail.com"
      },
      "external" : {
        "wallets" : ["paytm"]
      }
    };

    try{
      razorpay.open(options);

    }catch(e){
      print(e.toString());
    }

  }

  void handlerPaymentSuccess(){
    print("Pament success");
    Toast.show("Pament success", context);
  }

  void handlerErrorFailure(){
    print("Pament error");
    Toast.show("Pament error", context);
  }

  void handlerExternalWallet(){
    print("External Wallet");
    Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              backgroundColor: Colors.white70,
              elevation: 0,
              title: Center(
                child: Text(
                  "The Network",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                        keyboardType : TextInputType.numberWithOptions(),
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: " 3000 ",

                        ),
                      ),
            ),
          ),
            SizedBox(height: 12,),
            RaisedButton(
              color: Colors.deepPurple,
              child: Text(" PAY ", style: TextStyle(
                  color: Colors.white,
                  fontWeight :  FontWeight.w900,
              ),),
              onPressed: (){
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }


  //Razorpay razorpay;
  //TextEditingController textEditingController = new TextEditingController();
  //
  //@override
  //void initSate(){
  //  super.initState();
  //  razorpay = new Razorpay();
  //  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,handlerPaymentSuccess);
  //  razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,handlerPaymentError);
  //  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,handlerExternalWallet);
  //
  //}
  //
  //@override
  //void dispose() {
  //  // TODO: implement dispose
  //  super.dispose();
  //  razorpay.clear();
  //}
  //
  ////void openCheckout(){
  ////  var options = {
  ////    "key" : "rzp_test_KeDKZlTiqsX5ij",  //qXUBX6Te8uDAgZwug4qHOT5y
  ////    "amount" : num.parse(textEditingController.text)*100,
  ////    "name" : "Razor pay",
  ////    "prefill" : {
  ////      "contacts" : "1234567",
  ////      "email" : "ssads@gmail.com"
  ////    },
  ////    "external" : {
  ////      "wallets" : ["paytm"]
  ////    }
  ////  };
  ////
  ////  try{
  ////    razorpay.open(options);
  ////  }catch(e){
  ////    print(e.toString());
  ////  }
  ////}
  //
  //void openCheckout(){
  //  var options = {
  //    "key" : "rzp_test_KeDKZlTiqsX5ij",
  //    "amount" : num.parse(textEditingController.text)*100,
  //    "name" : "Sample App",
  //    "description" : "Payment for the some random product",
  //    "prefill" : {
  //      "contact" : "2323232323",
  //      "email" : "shdjsdh@gmail.com"
  //    },
  //    "external" : {
  //      "wallets" : ["paytm"]
  //    }
  //  };
  //
  //  try{
  //    razorpay.open(options);
  //
  //  }catch(e){
  //    print(e.toString());
  //  }
  //
  //}
  //
  //void handlerPaymentSuccess() {
  //  print('payment success');
  //}
  //
  //void handlerPaymentError() {
  //  print('payment failure');
  //}
  //
  //void handlerExternalWallet() {
  //  print('External wallet');
  //}
  //
  //Widget build(BuildContext context) {
  //  return Scaffold(
  //    appBar: AppBar(
  //      backgroundColor: Colors.white70,
  //      elevation: 0,
  //      title: Center(
  //        child: Text(
  //          "The Network",
  //          style: TextStyle(
  //            fontSize: 30,
  //            color: Colors.blue,
  //          ),
  //        ),
  //      ),
  //    ),
  //    body: Column(
  //      children: <Widget>[
  //        SizedBox(height: 40,),
  //        Padding(
  //          padding: const EdgeInsets.all(8.0),
  //          child: Container(
  //
  //            decoration: BoxDecoration(
  //              borderRadius: BorderRadius.circular(40),
  //              color: Colors.white,
  //            ),
  //            child: Padding(
  //              padding: const EdgeInsets.all(10.0),
  //              child: TextField(
  //                keyboardType : TextInputType.numberWithOptions(),
  //                controller: textEditingController,
  //                decoration: InputDecoration(
  //                  hintText: " 3000 ",
  //
  //                ),
  //
  //              ),
  //            ),
  //          ),
  //        ),
  //        SizedBox(height: 20,),
  //        RaisedButton(
  //          //shape: ,
  //          color: Colors.deepPurple,
  //          child: Text('PAY',
  //              style: TextStyle(
  //                color: Colors.white,
  //                fontWeight: FontWeight.w900,
  //              )),
  //          onPressed: (){
  //            openCheckout();
  //
  //        },
  //        )
  //      ],
  //    )
  //  );
  //}


}
