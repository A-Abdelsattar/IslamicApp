import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final String text;
  final String text2;


  ContainerCard({required this.text,required this.text2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(25),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(text,style: TextStyle(fontSize: 18,),),
                Text(text2,style: TextStyle(fontSize: 18,),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
