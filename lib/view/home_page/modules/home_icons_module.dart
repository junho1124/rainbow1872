import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeIconsModule extends StatelessWidget {
  const HomeIconsModule({
    Key? key,
    required this.assets,
    required this.titles
  }) : super(key: key);

  final List<String> assets;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              4,
                  (index) => buildHomeCard(
                  context,
                  assets[index],
                  titles[index]))),
    );
  }
  Widget buildHomeCard(BuildContext context, String asset, String title) {
    return Column(
      children: [
        Container(
          height: context.width * 0.2,
          width: context.width * 0.2,
          decoration: BoxDecoration(
              color: Color(0xFF89E5FC),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Image.asset(asset),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
