import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yngen_exam/widgets/margin.dart';
import 'package:yngen_exam/widgets/texts.dart';

class MyCard extends StatelessWidget {
  final List<Widget>? children;
  final String? title;
  const MyCard({Key? key, this.children, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.2),
                offset: Offset(0, 16),
                spreadRadius: -12)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if(title != null)
          RegularText(title!),
          Margin.v(),
          if(children != null)
          ...children!
        ],
      ),
    );
  }
}
