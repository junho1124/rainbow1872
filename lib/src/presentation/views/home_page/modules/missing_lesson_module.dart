import 'package:flutter/material.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';

class MissingLessonModule extends StatelessWidget {
  const MissingLessonModule({
    required this.missingLessons,
    Key? key,
  }) : super(key: key);

  final List<Lesson> missingLessons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.sticky_note_2_outlined, size: 50),
          SizedBox(width: 8),
          Text("${missingLessons.length}개의 미확인 레슨 노트가 있습니다.")
        ],
      ),
    );
  }
}
