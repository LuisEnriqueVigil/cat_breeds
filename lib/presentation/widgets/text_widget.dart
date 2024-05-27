import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidgetApp extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final Color? colorText; 
  const TextWidgetApp(
      {
      required this.text,
      required this.fontWeight,
      required this.fontSize,
      this.textAlign = TextAlign.start,
      this.colorText = Colors.black,
      this.textOverflow = TextOverflow.ellipsis, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color:colorText,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      overflow: textOverflow,
      textAlign: textAlign,
    );
  }
}
