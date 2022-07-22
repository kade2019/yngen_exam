import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yngen_exam/utils/date_converter.dart';
import 'package:yngen_exam/widgets/button.dart';
import 'package:yngen_exam/widgets/texts.dart';

class MyDatePicker extends StatefulWidget {
  final String? hint;
  final DateTime? value;
  final Function(DateTime)? onChange;
  const MyDatePicker({Key? key, this.hint, this.value, this.onChange}) : super(key: key);

  @override
  State<MyDatePicker> createState() => My_DatePickerState();
}

class My_DatePickerState extends State<MyDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
      child: HallowButton(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            if (widget.hint != null && widget.value == null)
              Expanded(
                  child: RegularText(
                widget.hint!,
                color: Colors.grey,
              )),
            if (widget.value != null)
              Expanded(child: RegularText(DateConverter.dateToString(widget.value!))),
            if (widget.hint == null && widget.value == null)
              Expanded(child: RegularText("")),
            Icon(
              Icons.calendar_today,
              color: Colors.grey,
            )
          ],
        ),
        event: () async {
          final DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 5));

          if(date != null && widget.onChange != null){
            widget.onChange!(date);
          }
        },
      ),
    );
  }
}
