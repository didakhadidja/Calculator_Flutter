import 'package:calculator_app/SpecialButton.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var MenuItems= <String>[
    'Dark mode',
    'Lite mode'
  ];
  /**************Les couleurs***************/
  int BackgroundCouleur=0xff17181A;
  int numberButtonCouleur=0xff303136;
  int ButtonCouleur=0xff616161;
  int grandTextCouleur=Colors.white.value;
  int petitTextCouleur=Colors.white54.value;
  int buttonTextCouleur=0xffA5A5A5;
  int shadowCouleur=0xffDDD9D9;
  //0xffF7F8FB
  /**************Les couleurs***************/

  String test='3';
  int first;
  int second;
  String operation;
  String historique = '';
  String res;
  String textDisplay = '';

  void btnOnClick(String value){
    print(value);
    if(value=='C'){
      first=0;
      second=0;
      textDisplay='';
      res='';
    }else{ if(value=='AC'){
      historique='';
      first=0;
      second=0;
      textDisplay='';
      res='';
    }else {
      if(value=='+' || value=='X' || value=='/' || value=='-'){
        first=int.parse(textDisplay);
        operation=value;
        textDisplay='';
        res='';
      }else{
        if(value=='='){
          second=int.parse(textDisplay);
          if(operation=='+'){
            res= (first+second).toString();
            historique=first.toString() + operation + second.toString();
          }
          if(operation=='-'){
            res= (first-second).toString();
            historique=first.toString() + operation + second.toString();
          }
          if(operation=='X'){
            res= (first*second).toString();
            historique=first.toString() + operation + second.toString();
          }
          if(operation=='/'){
            res= (first/second).toString();
            historique=first.toString() + operation + second.toString();
          }


        }else{
          if(value=='<'){
            if (res != null && res.length > 0) {
              res = res.substring(0, res.length - 1);
            }
            print('tappé');
          }else{
            res = int.parse(textDisplay + value).toString();
          }

        }
      }
    }

    }
    setState(() {
      textDisplay=res;
    });
  }

  void onSelect(item){
    switch(item){
      case 'Dark mode':
        setState(() {
          BackgroundCouleur=0xff17181A;
          numberButtonCouleur=0xff303136;
          ButtonCouleur=0xff616161;
          grandTextCouleur=Colors.white.value;
          petitTextCouleur=Colors.white54.value;
          buttonTextCouleur=0xffA5A5A5;
          shadowCouleur=0xff17181A;
        });
        break;
      case 'Lite mode':
        setState(() {
          BackgroundCouleur=0xffF7F8FB;
          numberButtonCouleur=0xffDDD9D9;
          ButtonCouleur=0xffB9B9B9;
          grandTextCouleur=Colors.black.value;
          petitTextCouleur=Colors.grey.value;
          buttonTextCouleur=Colors.white.value;
          shadowCouleur=0xffDDD9D9;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(BackgroundCouleur),
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton(
            color:Colors.grey[300],
            icon: Icon(Icons.more_vert,color: Colors.blue,size: 30,),
            onSelected: onSelect,
              itemBuilder: (BuildContext context){
            return MenuItems.map((String choice) {
              return PopupMenuItem<String>(
                  child: Text(choice),
                value: choice,
              );
            }).toList();
          })
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(BackgroundCouleur),
        ),
        padding: EdgeInsets.only(bottom: 20,right: 10,left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Container(
              alignment: Alignment(1.0,1.0),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  //historique !=null?historique:'',
                  historique,
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(petitTextCouleur),
                  ),
                ),
              ),
            ),


            Container(
              alignment: Alignment(1.0,1.0),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  textDisplay !=null?textDisplay:'',
                  //test,
                 // textDisplay,
                  style: TextStyle(
                    fontSize: 50,
                    color: Color(grandTextCouleur),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpecialButton(nombre: 'AC',couleur: ButtonCouleur, textCouleur: buttonTextCouleur,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: 'C',couleur: ButtonCouleur, textCouleur: buttonTextCouleur,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '<',couleur: Colors.blue.value, textCouleur: Colors.white.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '/',couleur: Colors.blue.value, textCouleur: Colors.white.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpecialButton(nombre: '9',couleur: numberButtonCouleur, textCouleur: Colors.blue.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '8',couleur: numberButtonCouleur, textCouleur: Colors.blue.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '7',couleur: numberButtonCouleur, textCouleur: Colors.blue.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: 'X',couleur: Colors.blue.value, textCouleur: Colors.white.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpecialButton(nombre: '6',couleur: numberButtonCouleur, textCouleur: Colors.blue.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '5',couleur: numberButtonCouleur, textCouleur: Colors.blue.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '4',couleur: numberButtonCouleur, textCouleur: Colors.blue.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '+',couleur: Colors.blue.value, textCouleur: Colors.white.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpecialButton(nombre: '3',couleur: numberButtonCouleur, textCouleur: Colors.blue.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '2',couleur: numberButtonCouleur, textCouleur: Colors.blue.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '1',couleur: numberButtonCouleur, textCouleur: Colors.blue.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '-',couleur: Colors.blue.value, textCouleur: Colors.white.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpecialButton(nombre: '+/-',couleur: numberButtonCouleur, textCouleur: Colors.blue.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '0',couleur: numberButtonCouleur, textCouleur: Colors.blue.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '00',couleur: numberButtonCouleur, textCouleur: Colors.blue.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
                SpecialButton(nombre: '=',couleur: Colors.blue.value, textCouleur: Colors.white.value,textSize: 22,callback: btnOnClick,shadowColor: shadowCouleur,),
              ],
            ),



          ],
        ),
      ),
    );
  }
}
