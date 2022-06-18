import 'package:flutter/material.dart';
import 'package:quiz/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorkeeper = [];

  int i = 0;

  sayTrue() {
    scorkeeper.add(const Icon(
      Icons.check,
      color: Colors.green,
    ));
  }

  sayFalse() {
    scorkeeper.add(const Icon(
      Icons.close,
      color: Colors.red,
    ));
  }

  void checkAnswer(bool userPickAnswer) {
    if (quizBrain.questionLeft() == 0) {
      Alert(
        context: context,
        title: "U do a nice job",
        desc: "retry ?",
        buttons: [
          DialogButton(
              child: const Text('oui'),
              color: Colors.green,
              onPressed: () => {
                    setState(() {
                      scorkeeper = [];
                      quizBrain.reset();
                    }),
                    Navigator.pop(context)
                  }),
          DialogButton(
              child: const Text('non'),
              color: Colors.red,
              onPressed: () => Navigator.pop(context)),
        ],
      ).show();
    } else {
      setState(() {
        quizBrain.getQuestionAnswer() == userPickAnswer
            ? sayTrue()
            : sayFalse();
        quizBrain.next();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.green,
              child: TextButton(
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              child: TextButton(
                child: const Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            ),
          ),
        ),
        Row(
          children: scorkeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
