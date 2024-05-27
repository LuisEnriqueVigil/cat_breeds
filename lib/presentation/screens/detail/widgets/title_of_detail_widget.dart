import 'package:flutter/material.dart';
import 'package:test_aplication/presentation/theme/font_size.dart';
import 'package:test_aplication/presentation/widgets/text_widget.dart';

class TitleOfDetailWidget extends StatelessWidget {
  final String title;
  const TitleOfDetailWidget({
     required this.title,
  Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextWidgetApp(
        text: title, 
        textOverflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.bold,
        fontSize: fontSize1,
        colorText: Colors.white,
      );
  }
}