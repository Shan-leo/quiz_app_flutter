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
                'This is where the question text will go',
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
              setState(() {
                scoreKeeper.add(
                  Icon(Icons.check, color: Colors.green),
                );
              });
            },
            child: Text(
              'True',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white, backgroundColor: Colors.red),
            onPressed: () {},
            child: Text(
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
