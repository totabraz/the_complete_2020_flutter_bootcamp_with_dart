import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
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
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List of answers
  List<Icon> scoreKeeper = [];

  void pressBtnHolder(bool answer) {
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'You\' done!',
          desc: 'Good job man, let\'s play more one time?',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        generateIcon(answer);
        quizBrain.nextQuestion();
      }
    });
  }

  void generateIcon(bool answered) {
    bool _answered = (quizBrain.checkAnswer(answered));
    IconData icon = (_answered) ? Icons.check : Icons.close;
    Color color = (_answered) ? Colors.green : Colors.red;
    setState(() {
      this.scoreKeeper.add(Icon(
            icon,
            color: color,
          ));
    });
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
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                this.pressBtnHolder(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                this.pressBtnHolder(false);
                //The user picked false.
              },
            ),
          ),
        ),
        Wrap(
          children: scoreKeeper,
        ),
      ],
    );
  }
}