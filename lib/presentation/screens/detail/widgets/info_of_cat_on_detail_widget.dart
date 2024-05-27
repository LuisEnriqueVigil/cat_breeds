import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_aplication/presentation/theme/font_size.dart';
import 'package:test_aplication/presentation/widgets/text_widget.dart';

class InfoOfCatOnDetailWidget extends StatelessWidget {
  final String titleInfo;
  final String detailInfo; 
  
  const InfoOfCatOnDetailWidget({
     required this.titleInfo, required this.detailInfo,
  Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10.0
          ),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.40),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Row(
            children: [
              TextWidgetApp(
                text: titleInfo,
                fontWeight: FontWeight.bold, 
                fontSize: fontSize2
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.20,
                child: TextWidgetApp(
                   text: detailInfo,
                   textOverflow: TextOverflow.fade,
                   fontWeight: FontWeight.normal, 
                   fontSize: fontSize3
                 ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}


