import 'package:flutter/material.dart';

class QuizzSantePage extends StatefulWidget {
  @override
  _QuizzSantePageState createState() => _QuizzSantePageState();
}

class _QuizzSantePageState extends State<QuizzSantePage> {
  int _questionIndex = 0;
  int _score = 0;
  String? _message;
  Color? _messageColor;

  final List<Map<String, Object>> _questions = [
    {
      "question": "Quelle est la tension artérielle normale ?",
      "image": "assets/qspo.png",
      "answers": [
        {"text": "12/8 cmHg", "score": 1, "isCorrect": true},
        {"text": "14/10 cmHg", "score": 0, "isCorrect": false},
        {"text": "16/9 cmHg", "score": 0, "isCorrect": false},
        {"text": "10/6 cmHg", "score": 0, "isCorrect": false},
      ],
    },
    {
      "question": "Quel taux de glycémie est considéré comme normal à jeun ?",
      "image": "assets/qgly.png",
      "answers": [
        {"text": "0,70 - 1,10 g/L", "score": 1, "isCorrect": true},
        {"text": "1,20 - 1,50 g/L", "score": 0, "isCorrect": false},
        {"text": "0,50 - 0,80 g/L", "score": 0, "isCorrect": false},
        {"text": "1,50 - 2,00 g/L", "score": 0, "isCorrect": false},
      ],
    },
    {
      "question":
          "Quelle est la durée minimale d'exercice physique recommandée par jour ?",
      "image": "assets/qten.png",
      "answers": [
        {"text": "10 minutes", "score": 0, "isCorrect": false},
        {"text": "30 minutes", "score": 1, "isCorrect": true},
        {"text": "1 heure", "score": 0, "isCorrect": false},
        {"text": "2 heures", "score": 0, "isCorrect": false},
      ],
    },
  ];

  void _answerQuestion(int score, bool isCorrect) {
    setState(() {
      _score += score;
      _message = isCorrect ? "Bonne réponse ! 🎉" : "Mauvaise réponse ❌";
      _messageColor = isCorrect ? Colors.green : Colors.red;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _message = null;
        if (_questionIndex < _questions.length - 1) {
          _questionIndex++;
        } else {
          _questionIndex++;
        }
      });
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
      _message = null;
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
                  Image.asset(
                    _questions[_questionIndex]["image"]
                        as String, // Image dynamique
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  ...(_questions[_questionIndex]["answers"]
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            textStyle: TextStyle(fontSize: 16),
                          ),
                          onPressed: () => _answerQuestion(
                              answer["score"] as int,
                              answer["isCorrect"] as bool),
                          child: Text(answer["text"] as String),
                        ),
                        SizedBox(
                            height: 12), // Ajout d'espace entre les boutons
                      ],
                    );
                  }).toList(),
                  if (_message != null) ...[
                    SizedBox(height: 20),
                    Text(
                      _message!,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _messageColor),
                    ),
                  ],
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
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    onPressed: _restartQuiz,
                    child: Text("Recommencer le quiz"),
                  ),
                ],
              ),
      ),
    );
  }
}
