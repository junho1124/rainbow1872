import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class UserInfoModule extends StatelessWidget {
  const UserInfoModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: context.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("name"),
                        Text("남은레슨 횟수"),
                        Text("남은레슨 기간"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 8,
              child: Row(
                children: [
                  Image.asset("assets/icon_call.png", height: 40),
                  Image.asset("assets/icon_chat.png", height: 40),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

