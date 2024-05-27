
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_aplication/domain/controllers/home_controller.dart';
import 'package:test_aplication/presentation/screens/home/widgets/list_results_of_cat_on_home_widget.dart';
import 'package:test_aplication/presentation/screens/home/widgets/list_void_result_widget.dart';
import 'package:test_aplication/presentation/screens/home/widgets/search_container_widget.dart';
import 'package:test_aplication/presentation/theme/font_size.dart';
import 'package:test_aplication/presentation/theme/strings.dart';
import 'package:test_aplication/presentation/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Provider.of<HomeController>(context);
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0
        ),
        child:   Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const   SizedBox(
              height: 50.0,
            ),
            const  TextWidgetApp(
              text: titleHomeString,
              fontWeight: FontWeight.bold,
              fontSize: fontSize1, 
            ),
            
            const SearchContainerWidget(),
            const SizedBox(height: 10.0),
            (homeController.listOfCats.isEmpty)?
            const ListVoidResultWidget():
            const ListResultsOfCatOnHomeWidget()
          ],
        ),
      ),
    );
  }
}
