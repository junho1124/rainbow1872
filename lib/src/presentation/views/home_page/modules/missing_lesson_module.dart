import 'package:flutter/material.dart';

class MissingLessonModule extends StatelessWidget {
  const MissingLessonModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.sticky_note_2_outlined, size: 50),
          SizedBox(width: 8),
          Text("~~개의 미확인 레슨 노트가 있습니다.")
        ],
      ),
    );
  }
}
