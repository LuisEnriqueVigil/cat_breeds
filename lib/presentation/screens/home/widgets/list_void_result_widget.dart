import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_aplication/data/api/services_of_info_cat.dart';
import 'package:test_aplication/domain/controllers/home_controller.dart';
import 'package:test_aplication/presentation/theme/font_size.dart';
import 'package:test_aplication/presentation/theme/strings.dart';
import 'package:test_aplication/presentation/widgets/text_widget.dart';

class ListVoidResultWidget extends StatelessWidget {
  const ListVoidResultWidget({
    Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    ServicesOfInfoCat servicesOfInfoCat = Provider.of<ServicesOfInfoCat>(context);
    HomeController homeController = Provider.of<HomeController>(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.30,
          ),
          const TextWidgetApp(
            text: voidListInfo, 
            textOverflow: TextOverflow.fade,
            fontWeight: FontWeight.bold, 
            fontSize: fontSize2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
          const Icon(
            Icons.search,
            color: Colors.amber,
            size: 40.0,
          ),
          const SizedBox(height: 15.0),
          InkWell(
            onTap: ()async{
              homeController.textEditingController.clear();
              homeController.listOfCats = await servicesOfInfoCat.getInfoAllCats();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10.0
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.orange.withOpacity(0.40)
              ),
              child: const TextWidgetApp(
                text: cleanFilters,
                fontWeight: FontWeight.normal,
                fontSize: fontSize2
              ),
            ),
          )
        ],
      ),
    );
  }
}
