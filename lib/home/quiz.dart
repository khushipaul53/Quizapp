import 'package:flutter/material.dart';
import 'package:quizapp/model/question.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  int _currectQuestionIndex=0;
  int score=0;

  List questionBank = [
    Question.name(
        "John Glenn was the oldest astronaut to travel in space.", true),
    Question.name("Golf balls have 300 to 500 dimples.", true),
    Question.name("Lightning can’t strike in the same place twice", false),
    Question.name("Colorblind people can see color", true),
    Question.name("Arachnophobia is the fear of bathing.", false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Quiz",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black87,
        ),
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Image.asset("images/flag.png", width: 280, height: 180),
              Container(
                height: 120.0,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.grey)),
                child: Center(
                  child: Text(
                    questionBank[_currectQuestionIndex].questiontext,
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () => _checkAnswer(true,context),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.blueGrey)),
                      // MaterialStatePropertyAll<Color>(Colors.blueGrey)),
                      child: Text(
                        "TRUE",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                      onPressed: () => _checkAnswer(false,context),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.blueGrey)),
                      // MaterialStatePropertyAll<Color>(Colors.blueGrey)),
                      child: Text(
                        "FALSE",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                      onPressed: () => _nextQuestion(),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.blueGrey)),
                      // MaterialStatePropertyAll<Color>(Colors.blueGrey)),
                      child: Icon(Icons.arrow_forward
                      ),

                      ),

                ],
              )

            ],
          ),
        ));
  }

  _checkAnswer(bool userChoice,BuildContext context) {
    if(userChoice==questionBank[_currectQuestionIndex].isCorrect)
      {
        debugPrint("Correct");
         final snackbar= new SnackBar(content: Text(
    "Hurray!!!! Correct")
    );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        score=score+5;


      }
    else{
     final snackbar= new SnackBar(content: Text("Sorry!!! Incorrect.. try Again"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
      debugPrint("Incorrect");

    }
  }
  _nextQuestion(){
    setState(() {
if(_currectQuestionIndex<questionBank.length-1)
  {
    _currectQuestionIndex++;

  }
else{
       final snackbar= new SnackBar(content: Text("Question finished!!! Your Score for today is: $score"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
  debugPrint("Question finished");
  debugPrint("Score $score");

}
    });

  }
}
