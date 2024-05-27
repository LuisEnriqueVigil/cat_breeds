import 'package:flutter/material.dart';

class ArrowIconAppBarWidget extends StatelessWidget {
  const ArrowIconAppBarWidget({
   Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.pop(context);
      }, 
      icon:const Icon(
      Icons.arrow_back_ios_new,
      color: Colors.white,
      )
    );
  }
}
