import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void showQRImage(String uid, BuildContext context) {
  showDialog(context: context, builder: (_) => AlertDialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 20),
    content: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              'QR',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            width: 200.0,
            height: 200.0,
            child: QrImage(
              errorStateBuilder: (context, error) =>
                  Text(error.toString()),
              data: uid,
            ),
          ),
        ],
      ),
    ),
  ));
}