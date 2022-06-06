import 'package:flutter/material.dart';

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

  List<String> questions = [
    "You are a Human",
    "You are an alien",
    "Earth is gonna be destroyed",
    "Most of the Human are morons",
    "Somebody likes bombeli karawala",
    "There are so many brainy people out there",
    "It's raining cats and dogs"
  ];

  List<bool> answers = [true, false, true, true, false, true, false];

  int quizNumber = 0;

  void checkAnswer(userInput) {
    if (answers[quizNumber] == userInput) {
      print('User is fucking right');
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
                questions[quizNumber],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white, backgroundColor: Colors.green),
            onPressed: () {
              bool correctAnswer = answers[quizNumber];
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
