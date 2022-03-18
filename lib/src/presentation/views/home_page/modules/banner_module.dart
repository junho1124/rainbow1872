import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:rainbow1872/src/data/models/banner.dart' as bn;
import 'package:url_launcher/url_launcher.dart';

class BannerModule extends StatelessWidget {
  const BannerModule({
    required this.banners,
    Key? key,
  }) : super(key: key);

  final List<bn.Banner> banners;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
      ),
      child: CarouselSlider(
          items: List.generate(
              banners.length, (index) => buildBanner(context, index)),
          options: CarouselOptions(
              autoPlay: true, viewportFraction: 1, aspectRatio: 6)),
    );
  }

  Widget buildBanner(BuildContext context, int index) {
    return InkWell(
      onTap: () async {
        if (await canLaunch(banners[index].redirectUrl)) {
          Get.defaultDialog(
            title: "${banners[index].dialogTitle}로 이동",
            middleText: "${banners[index].description}의 정보를 확인하러\n이동 하시겠습니까?",
            textConfirm: "이동하기",
            onConfirm: () async {
              await launch(banners[index].redirectUrl);
              Get.back();
            },
            textCancel: "취소",
            buttonColor: Colors.transparent,
            cancelTextColor: Colors.blueGrey,
            confirmTextColor: Colors.blueGrey
          );
        }
      },
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(banners[index].imageUrl)),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
        ),
        height: 150,
        // child: Image.network(banners[index].imageUrl),
      ),
    );
  }
}
