import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_aplication/data/api/services_of_info_cat.dart';
import 'package:test_aplication/domain/controllers/home_controller.dart';
import 'package:test_aplication/presentation/screens/home/screens/home_screen.dart';
import 'package:test_aplication/presentation/screens/splash/widgets/image_splash_screen_widget.dart';
import 'package:test_aplication/presentation/screens/splash/widgets/title_splash_screen_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key,}): super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkInfoAndGetCats(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              TitleSplashScreenWidget(),
              SizedBox(height: 20.0),
              ImageSplashScreenWidget()
           ],
        ),
      ),
    );
  }


  Future checkInfoAndGetCats (BuildContext context) async{//
    ServicesOfInfoCat servicesOfInfoCat = Provider.of<ServicesOfInfoCat>(context,listen: false);
    HomeController homeController = Provider.of<HomeController>(context,listen: false);
    homeController.listOfCats = await servicesOfInfoCat.getInfoAllCats();
    if(context.mounted){
      return Navigator.pushReplacement(
           context, PageRouteBuilder(
           pageBuilder: (_,__,___)=> const HomeScreen(),
           transitionDuration: const Duration(milliseconds: 0)
         ));
    } 
  }
}
