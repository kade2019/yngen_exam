import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yngen_exam/utils/colors.dart';
import 'package:yngen_exam/utils/router.dart';
import 'package:yngen_exam/widgets/margin.dart';
import 'package:yngen_exam/widgets/texts.dart';

showLoader(BuildContext context){
  showDialog(context: context, builder: (builder){
    return WillPopScope(child: AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: mainColor,),
          Margin.v(size: 20),
          RegularText("Submittinig")
        ],
      ),
    ), onWillPop: () async {return false;});
  });
}

showAlert(BuildContext context, {String? message}){
  showDialog(context: context, builder: (builder){
    return AlertDialog(
      content: RegularText(message ?? ""),
      actions: [TextButton(onPressed: (){
        popRoute(context);
      }, child: RegularText("Okay"))],
    );
  });
}