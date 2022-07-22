import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yngen_exam/utils/router.dart';
import 'package:yngen_exam/utils/screen.dart';
import 'package:yngen_exam/widgets/bottom_modal.dart';
import 'package:yngen_exam/widgets/button.dart';
import 'package:yngen_exam/widgets/texts.dart';

class Select extends StatefulWidget {
  final String? hint;
  final String? value;
  final Function(dynamic)? onChange;
  final List<SelectOptions> options;
  const Select({Key? key, this.hint, this.value, this.onChange, required this.options}) : super(key: key);

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey))
      ),
      child: HallowButton(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            if(widget.hint != null && widget.value == null)
            Expanded(child: RegularText(widget.hint!, color: Colors.grey,)),
            if(widget.value != null)
            Expanded(child: RegularText(widget.options.where((e) => e.value == widget.value).first.label)),
            if(widget.hint == null && widget.value == null)
            Expanded(child: RegularText("")),
            Icon(Icons.arrow_drop_down, color: Colors.grey,)
          ],
        ),
        event: () {
          showBottomModal(context, child: Container(
            constraints: BoxConstraints(maxHeight: Screen.height(context) * .7),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...widget.options.map((e) => HallowButton(padding: EdgeInsets.all(15), align: Alignment.centerLeft, child: RegularText(e.label), event: (){
                    if(widget.onChange != null) widget.onChange!(e.value);
                    popRoute(context);
                  })),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}

class SelectOptions {
  final String label;
  final dynamic value;
  const SelectOptions({required this.label, required this.value});
}