import 'package:flutter/material.dart';
import 'quiz_brain.dart';

void main() {
  runApp(const Quizlerr());
}

QuizBrain newQuizBrain = QuizBrain();

class Quizlerr extends StatelessWidget {
  const Quizlerr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuizPage();
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int questionNumber = 0;
  void checkAnswer(pickedAnswer) {
    setState(() {
      bool correctAnswer = newQuizBrain.getQuestionAnswer();
      if (correctAnswer == pickedAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
      }
      newQuizBrain.increaseQuestionNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text('QUIZ APP'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                padding: const EdgeInsets.all(30.0),
                alignment: Alignment.center,
                child: Text(
                  newQuizBrain.getQuestionText(),
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 21.0, horizontal: 20.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: const Text(
                      'TRUE',
                      style: TextStyle(fontSize: 15.0),
                    )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 21.0, horizontal: 20.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      checkAnswer(false);
                    },
                    child: const Text(
                      'FALSE',
                      style: TextStyle(fontSize: 15.0),
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: scoreKeeper,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
