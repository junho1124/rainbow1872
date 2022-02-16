import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class LoginBottomBannerModule extends StatelessWidget {
  const LoginBottomBannerModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xFF0036DC),
        width: context.width,
        padding: const EdgeInsets.all(16),
        child: const Align(
            alignment: Alignment.topCenter,
            child: Text("레인보우 1872 접속을 환영합니다.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400))),
      ),
    );
  }
}
