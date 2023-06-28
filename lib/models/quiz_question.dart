class QuizQuestion {
  const QuizQuestion({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  final String question;
  final List<String> answers;
  final String correctAnswer;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = answers.toList();
    shuffledAnswers.shuffle(); // using shuffle on a list that is final does not
    // violate the rule because we are not assigning a new value to the list, just
    // shuffling the same values in the memory.

    // Also, Shuffle will shuffle the list in the memory permanently. So, if we
    // access the shuffled list again, it will not be the same as before.
    return shuffledAnswers;
  }
}
