import 'package:flutter/material.dart';
import 'package:quizz_project/quizz_page.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Quizz | By princeG"),

      ),
      body: Center(
        child: Card(
          color: Colors.deepPurpleAccent.shade100,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.all(8),
              child: Image.asset("images/cover.jpg",height: size.height/2.5,width:size.width*0.8,fit: BoxFit.cover ,)
                ,),

              ElevatedButton(onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext ctx){
                  return QuizzPage();
                }));
              }, child: const Text("Commencer le Quizz"))
            ],
          ),
        ),
      ),
    );
  }

}