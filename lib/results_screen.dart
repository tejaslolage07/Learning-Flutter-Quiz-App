import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {Key? key, required this.selectedAnswers, required this.onRestart})
      : super(key: key);

  final List<String> selectedAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].correctAnswer,
        'selected_answer': selectedAnswers[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where((data) => data['correct_answer'] == data['selected_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
