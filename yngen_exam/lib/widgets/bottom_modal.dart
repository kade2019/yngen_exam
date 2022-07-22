import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yngen_exam/utils/screen.dart';
import 'package:yngen_exam/widgets/margin.dart';

class BottomModal extends StatefulWidget {
  Widget child;
  Widget? header;
  EdgeInsets? padding;
  BottomModal({Key? key, required this.child, this.padding, this.header}) : super(key: key);

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white
      ),
      width: Screen.width(context),
      padding: widget.padding ?? EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.header ?? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Screen.width(context) * .25,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(50)
                ),
              )
            ],
          ),
          Margin.v(size: 20),
          widget.child,
        ],
      ),
    );
  }
}

showBottomModal(BuildContext context, {required Widget child, Widget? header, bool willPopScope = true, EdgeInsets? padding}){
  return showModalBottomSheet(isDismissible: willPopScope, enableDrag: willPopScope, backgroundColor: Colors.transparent, isScrollControlled: true, context: context, builder: (_){
    return WillPopScope(onWillPop: () async {return willPopScope;}, child: BottomModal(child: child, header: header, padding: padding,));
  });
}