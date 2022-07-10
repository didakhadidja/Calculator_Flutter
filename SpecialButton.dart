import 'package:flutter/material.dart';

class SpecialButton extends StatelessWidget {
  final String nombre;
  final int couleur;
  final int textCouleur;
  final int textSize;
  final Function callback;
  final int shadowColor;

  const SpecialButton({Key key, this.nombre, this.couleur, this.textCouleur, this.textSize, this.callback, this.shadowColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(couleur),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            //color: Color(0xffDDD9D9),
            color: Color(shadowColor),
            blurRadius: 15,
            //spreadRadius: 1,
          ),
        ],
      ),
      height: 70,
      width: 70,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        child: Text(
          nombre,
          style: TextStyle(
            fontSize: 22,
            color: Color(textCouleur),
          ),
        ),
        onPressed: () => callback(nombre),
        //color: Colors.red,
      ),

    );
  }
}
