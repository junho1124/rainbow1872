import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class LocationStateModule extends StatelessWidget {
  const LocationStateModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: context.width * 0.5,
          decoration: BoxDecoration(color: Colors.blueAccent),
          child: Center(
              child: Text(
                "여의도",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
        ),
        Container(
          height: 50,
          width: context.width * 0.5,
          child: Center(
              child: Text("쾌적",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500))),
        ),
      ],
    );
  }
}
