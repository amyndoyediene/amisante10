import 'package:flutter/material.dart';

class QuizzSantePage extends StatefulWidget {
  @override
  _QuizzSantePageState createState() => _QuizzSantePageState();
}

class _QuizzSantePageState extends State<QuizzSantePage> {
  int _questionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      "question": "Quelle est la tension artérielle normale ?",
      "answers": [
        {"text": "12/8 cmHg", "score": 1},
        {"text": "14/10 cmHg", "score": 0},
        {"text": "16/9 cmHg", "score": 0},
        {"text": "10/6 cmHg", "score": 0},
      ],
    },
    {
      "question": "Quel taux de glycémie est considéré comme normal à jeun ?",
      "answers": [
        {"text": "0,70 - 1,10 g/L", "score": 1},
        {"text": "1,20 - 1,50 g/L", "score": 0},
        {"text": "0,50 - 0,80 g/L", "score": 0},
        {"text": "1,50 - 2,00 g/L", "score": 0},
      ],
    },
    {
      "question": "Quelle est la durée minimale d'exercice physique recommandée par jour ?",
      "answers": [
        {"text": "10 minutes", "score": 0},
        {"text": "30 minutes", "score": 1},
        {"text": "1 heure", "score": 0},
        {"text": "2 heures", "score": 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _questionIndex++;
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Santé")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _questionIndex < _questions.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _questions[_questionIndex]["question"] as String,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ...(_questions[_questionIndex]["answers"] as List<Map<String, Object>>).map((answer) {
                    return ElevatedButton(
                      onPressed: () => _answerQuestion(answer["score"] as int),
                      child: Text(answer["text"] as String),
                    );
                  }).toList(),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Votre score : $_score / ${_questions.length}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _restartQuiz,
                    child: Text("Recommencer le quiz"),
                  ),
                ],
              ),
      ),
    );
  }
}
