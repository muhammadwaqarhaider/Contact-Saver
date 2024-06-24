import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String name;
  Color color;
  CustomTab({Key? key, required this.name,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(name,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
      ),
    );

  }
}
