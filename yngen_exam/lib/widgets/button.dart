import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yngen_exam/utils/screen.dart';

class SolidButton extends StatelessWidget {
  Widget child;
  Function()? event;
  double? width;
  double? height;
  Color? color;
  EdgeInsetsGeometry? padding;
  BorderRadius? borderRadius;
  SolidButton(
      {Key? key,
      required this.child,
      required this.event,
      this.width,
      this.height,
      this.color,
      this.padding,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Colors.black.withOpacity(.2),
              offset: Offset(0, 16),
              spreadRadius: -12
            )
          ]
        ),
        child: CupertinoButton(
          padding: padding,
          onPressed: event,
          color: color ?? Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          child: child,
        ));
  }
}

class HallowButton extends StatelessWidget {
  Widget child;
  Function()? event;
  double? width;
  double? height;
  EdgeInsetsGeometry? padding;
  AlignmentGeometry? align;
  HallowButton(
      {Key? key,
      required this.child,
      required this.event,
      this.width,
      this.height,
      this.padding,
      this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: CupertinoButton(
          alignment: align ?? Alignment.center,
          onPressed: event,
          padding: padding,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: child,
        ));
  }
}

class BorderedButton extends StatelessWidget {
  Widget child;
  Function()? event;
  double? width;
  double? height;
  EdgeInsetsGeometry? padding;
  AlignmentGeometry? align;
  Border? border;
  BorderedButton(
      {Key? key,
      required this.child,
      required this.event,
      this.width,
      this.height,
      this.padding,
      this.align,
      this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? Screen.width(context),
        height: height,
        child: CupertinoButton(
          alignment: align ?? Alignment.center,
          onPressed: event,
          padding: EdgeInsets.zero,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: Container(
              width: width ?? Screen.width(context),
              constraints: BoxConstraints(maxHeight: 40),
              padding: padding ?? EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: border ?? Border.all(color: Colors.black54, width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: child),
        ));
  }
}
