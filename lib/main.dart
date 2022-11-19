import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  List<Quiz> quizBank = [
    Quiz(
      question: "You can lead a cow down stairs but not up stairs.",
      answer: false,
    ),
    Quiz(
      question: "Approximately one quarter of human bones are in the feet.",
      answer: true,
    ),
    Quiz(
      question: "A slug's blood is green.",
      answer: true,
    ),
  ];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    quizBrain.getQuestion(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  onPressed: () => {
                    setState(() {
                      if (quizBrain.getAnswer()) {
                        scoreKeeper.add(
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      } else {
                        scoreKeeper.add(
                          const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      }

                      quizBrain.nextQuiz();
                    }),
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("TRUE"),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  onPressed: () => {
                    setState(() {
                      if (quizBrain.getAnswer()) {
                        scoreKeeper.add(
                          const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      } else {
                        scoreKeeper.add(
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      }

                      quizBrain.nextQuiz();
                    }),
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  child: const Text("FALSE"),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: scoreKeeper,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/