import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];

  addScore(bool answer) {
    setState(() {
      if (quizBrain.isFinished()) {
        quizFinishedAlert(scoreKeeper
            .where((element) => element.icon == Icons.check_rounded)
            .length);
        scoreKeeper.clear();
        quizBrain.resetIfFinished();
      } else if (quizBrain.quizAnswer() == answer) {
        scoreKeeper.add(const Icon(
          Icons.check_rounded,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.close_rounded,
          color: Colors.red,
        ));
      }

      quizBrain.nextQuestion();
    });
  }

  quizFinishedAlert(int totalScore) => Alert(
        context: context,
        type: AlertType.warning,
        title: "Finished",
        desc: "You have reached the end of the quiz.",
        content: Text(
          'Total Score is $totalScore from ${quizBrain.questionsLength}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              Navigator.pop(context);
            },
            width: 120,
            child: const Text(
              "Retake the quiz",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.quizQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: MaterialButton(
            onPressed: () => addScore(true),
            color: Colors.green,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'True',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: MaterialButton(
            onPressed: () => addScore(false),
            color: Colors.red,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'False',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
