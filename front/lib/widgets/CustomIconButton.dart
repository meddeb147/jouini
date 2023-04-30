import 'package:flutter/material.dart';

class customiconbutton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final VoidCallback onTap;
  final Color? color;
  const customiconbutton(
    {Key? key,
    required this.child,
    required this.height,
    required this.width,
    required this.onTap,
    this.color= Colors.white }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Ink(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Center(child: child),
        onTap: onTap,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(-1),
            blurRadius: 2.0,
            spreadRadius: .05,
          )

        ] ),

    );
  }
}