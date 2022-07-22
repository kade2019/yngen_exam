import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yngen_exam/utils/colors.dart';
import 'package:yngen_exam/utils/router.dart';
import 'package:yngen_exam/utils/screen.dart';
import 'package:yngen_exam/widgets/button.dart';
import 'package:yngen_exam/widgets/margin.dart';
import 'package:yngen_exam/widgets/texts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Container
      appBar: AppBar(
        title: BoldText("WinLots Construction", color: Colors.white,),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        width: Screen.width(context),
        height: Screen.height(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list_alt, color: Colors.grey.shade300, size: 30),
            RegularText("No Diaries yet", color: Colors.grey.shade400, size: 14,),
            Margin.v(size: 20),
            SolidButton(event: (){
              pushRoute(context, url: '/new-diary');
            }, color: mainColor,child: SemiBoldText("Add new Diary", color: Colors.white,),)
          ],
        ),
      ),
    );
  }
}