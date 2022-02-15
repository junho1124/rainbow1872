import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class BannerModule extends StatelessWidget {
  const BannerModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List.generate(
            3, (index) => buildBanner(context, index)),
        options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: 2.5 / 1));
  }

  Container buildBanner(BuildContext context, int index) {
    return Container(
      width: context.width,
      height: 150,
      color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
      child: Center(
        child: Text(index.toString()),
      ),
    );
  }
}
