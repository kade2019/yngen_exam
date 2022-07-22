import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class RegularText extends StatelessWidget {
  Color? color;
  String text;
  double size;
  RegularText(this.text, {Key? key, this.color, this.size = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            fontSize: size,
            fontWeight: FontWeight.w400,
            color: color ?? Colors.black87));
  }
}

class MediumText extends StatelessWidget {
  Color? color;
  String text;
  double? size;
  TextAlign? align;
  MediumText(this.text, {Key? key, this.color, this.size = 16, this.align}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        textAlign: align,
        style: GoogleFonts.poppins(
            fontSize: size,
            fontWeight: FontWeight.w500,
            color: color ?? Colors.black87));
  }
}

class SemiBoldText extends StatelessWidget {
  Color? color;
  String text;
  double size;
  TextAlign? align;
  SemiBoldText(this.text, {Key? key, this.color, this.size = 16, this.align}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: align,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(
            fontSize: size,
            fontWeight: FontWeight.w600,
            color: color ?? Colors.black87));
  }
}

class BoldText extends StatelessWidget {
  Color? color;
  String text;
  double size;
  BoldText(this.text, {Key? key, this.color, this.size = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            fontSize: size,
            fontWeight: FontWeight.w700,
            color: color ?? Colors.black87));
  }
}
