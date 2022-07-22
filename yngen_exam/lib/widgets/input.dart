import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatefulWidget {
  String? hint;
  Widget? prefix;
  Widget? suffix;
  bool password;
  bool dark;
  String? value;
  Function(String)? onChange;
  Input({Key? key, this.hint, this.prefix, this.suffix, this.password = false, this.value, this.onChange, this.dark = false}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {

  TextEditingController _ctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _ctrl.text = widget.value ?? "";
    _ctrl.addListener((){
      if(widget.onChange != null){
        widget.onChange!(_ctrl.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey))
      ),
      child: TextField(
        controller: _ctrl,
        cursorColor: Colors.black,
        cursorWidth: 1,
        obscureText: widget.password,
        decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.prefix,
            suffixIcon: widget.suffix,
            hintStyle: GoogleFonts.poppins(color: Colors.black38),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            contentPadding: EdgeInsets.all(12),
            fillColor: widget.dark ? Colors.black.withOpacity(.05) : Colors.white.withOpacity(.3),
            filled: true),
      ),
    );
  }
}
