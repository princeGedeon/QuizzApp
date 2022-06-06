import 'package:flutter/material.dart';
import 'package:quizz_project/data.dart';
import 'package:quizz_project/question.dart';
import 'package:quizz_project/quizz_page.dart';
import 'package:quizz_project/text_with_style.dart';

class QuizzPage extends StatefulWidget{

  @override
  QuizzPageState createState()=>QuizzPageState();


}

class QuizzPageState extends State<QuizzPage>{
  List<Question> questions=Datas().listeQuestions;
  int index=0;
  int score=0;
  void initState()
  {
    super.initState();
  }

  @override
  void dispose()
  {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Question question=questions[index];
    return Scaffold(
      appBar: AppBar(
        title:Text("Score : $score") ,),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(8),
          child: Padding(padding: EdgeInsets.all(8),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWithStyle(data:"Question numero : ${index+1}/${questions.length}", color: Colors.deepOrange,style: FontStyle.italic,),
                  TextWithStyle(data: question.question,size: 21,weight: FontWeight.bold,),

                  Image.asset(question.getImage()),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      answerBtn(false),
                      answerBtn(true)
                    ],
                  ),

                ],
              ) ,
          )
        ),
      ),
    );
  }

  ElevatedButton answerBtn(bool b){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (b)?Colors.greenAccent:Colors.redAccent
        ),
        onPressed: (){
          checkAnswer(b);

    }, child: Text((b)?"VRAI":"FAUX"));
  }

  checkAnswer(bool answer) {
    final question = questions[index];
    bool bonneResponse = (question.reponse == answer);

    if (bonneResponse) {
      setState(() {
        score++;
      });
    }
      showAnswer(bonneResponse);

  }
  Future<void> showAnswer(bool bonneReponse) async{
    Question question=questions[index];
    String title=(bonneReponse)?"C'est gagné":"Raté";
    String imageShow=(bonneReponse)?"vrai.jpg":"faux.jpg";
    String path="images/$imageShow";
    return showDialog(barrierDismissible: false,context: context, builder: (BuildContext ctx){
      return SimpleDialog(

        title: TextWithStyle(data: title,),
        children: [
          Image.asset(path),
          TextWithStyle(data: question.explication),
          TextButton(onPressed: (){}, child: TextWithStyle(data: "Passer à la question suivante",))
        ],
      );

    });

  }
}
    


