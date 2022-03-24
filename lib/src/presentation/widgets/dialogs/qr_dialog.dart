import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void showQRImage(String uid, BuildContext context, VoidCallback onTap) {
  showDialog(context: context, builder: (_) => AlertDialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 20),
    content: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              '담당 프로님에게 보여주세요',
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
          InkWell(
            onTap: () {
              onTap.call();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.lightBlueAccent
              ),
              height: 40,
              width: double.infinity,
              child: Center(child: Text("완료", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
            ),
          )
        ],
      ),
    ),
  ));
}