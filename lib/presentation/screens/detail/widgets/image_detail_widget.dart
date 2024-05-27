import 'package:flutter/material.dart';
import 'package:test_aplication/presentation/theme/images.dart';

class ImageDetailWidget extends StatelessWidget {
  
  const ImageDetailWidget({
    required this.tag, required this.urlCatImage,
 Key? key,}): super(key: key);

  final int tag;
  final String urlCatImage;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: SizedBox(
        width: double.infinity,
        child:  FadeInImage(
         imageErrorBuilder: (context, error, stackTrace) {
           return const Image(
             image:  AssetImage(
               splashImage,
             ),
             fit: BoxFit.contain, 
           );
         },
         placeholder: const AssetImage(
           loadingImage
         ),
          image: NetworkImage(
           urlCatImage,
          ),
          fit: BoxFit.fitWidth,
         ),
      ),
    );
  }
}
