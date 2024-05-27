import 'package:flutter/material.dart';
import 'package:test_aplication/presentation/theme/strings.dart';
import 'package:test_aplication/presentation/widgets/text_widget.dart';

class TitleSplashScreenWidget extends StatelessWidget {
  const TitleSplashScreenWidget({
    Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.60,
      child: const TextWidgetApp(
        text: welcomeSplashScreen,
        fontWeight: FontWeight.bold, 
        colorText: Colors.orange,
        fontSize: 25,
        textAlign: TextAlign.center,
        textOverflow: TextOverflow.fade,
      ),
    );
  }
}