import 'package:adv_basics/questions_summary/question_identifier.dart';
import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['selected_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemData['question'] as String,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              itemData['selected_answer'] as String,
              style: const TextStyle(
                color: Color.fromARGB(255, 202, 171, 252),
              ),
            ),
            Text(
              itemData['correct_answer'] as String,
              style: const TextStyle(
                color: Color.fromARGB(255, 181, 254, 264),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ))
      ],
    );
  }
}
