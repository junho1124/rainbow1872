import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rainbow1872/utils/my_drawer.dart';

class LessonReviewPage extends StatelessWidget {
  const LessonReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(name: "최준호"),
      appBar: AppBar(
        title: Text("레슨 리뷰"),
        centerTitle: false,
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Container(
                height: 120,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.5, 0.5),
                        blurRadius: 0.5)
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "나의 레슨 정보",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("• 담당 프로 : ~~~~"),
                            Text("• 남은 이용 기간 : ~~~~"),
                            Text("• 남은 레슨 횟수 : ~~회"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
