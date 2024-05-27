import 'package:flutter/material.dart';
import 'package:test_aplication/presentation/theme/images.dart';

class ImageSplashScreenWidget extends StatelessWidget {
  const ImageSplashScreenWidget({
    Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      height: 180,
      image: AssetImage(
        loadingImage,
      ),
      fit: BoxFit.cover,
    );
  }
}
