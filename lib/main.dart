import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
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
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];


  List<Question> questionBank = [
    Question(q: 'Human can go in speed of light', a: false),
    Question(q: 'There are trillions of black holes in our universe', a: true),
    Question(q: 'Einstein talk about physics', a: true),
    Question(q: 'There are trillions of morons in our universe', a: false),
    Question(q: 'Earth is flat', a: true),
  ];

  int quizNumber = 0;

  void checkAnswer(userInput) {
    print(questionBank[quizNumber].questionText);
    if (questionBank[quizNumber].questionAnswer == userInput) {
      scoreKeeper.add(
        const Icon(Icons.check, color: Colors.green),
      );
    } else {
      print('User is fucking wrong');
      scoreKeeper.add(
        const Icon(Icons.close, color: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                questionBank[quizNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white, backgroundColor: Colors.green),
            onPressed: () {
              setState(() {
                checkAnswer(true);
                quizNumber += 1;
              });
            },
            child: const Text(
              'True',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white, backgroundColor: Colors.red),
            onPressed: () {
              setState(() {
                checkAnswer(false);
                quizNumber += 1;
              });
            },
            child: const Text(
              'False',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
