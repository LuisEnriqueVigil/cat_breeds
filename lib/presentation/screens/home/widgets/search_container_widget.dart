
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_aplication/data/api/services_of_info_cat.dart';
import 'package:test_aplication/domain/controllers/home_controller.dart';
import 'package:test_aplication/domain/models/cat_model.dart';
import 'package:test_aplication/presentation/theme/strings.dart';

class SearchContainerWidget extends StatelessWidget {
  const SearchContainerWidget({
    Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Provider.of<HomeController>(context);
    ServicesOfInfoCat servicesOfInfoCat = Provider.of<ServicesOfInfoCat>(context);
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.orange.withOpacity(0.10),
        border: Border.all(
          color: Colors.orange.withOpacity(0.90)
        )
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 8.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: homeController.textEditingController,
              onSubmitted: (value){
                FocusScope.of(context).unfocus();
                List<CatModel> searchList = homeController.listOfCats.where((element) => 
                  (element.name??"").toLowerCase().contains(
                    value.toLowerCase()
                  )
                ).toList();
                homeController.listOfCats = searchList;
              },
              onChanged: (value)async{
                if(value.isEmpty){
                  homeController.listOfCats = await servicesOfInfoCat.getInfoAllCats();
                }
              },
              decoration: InputDecoration.collapsed(
                hintText: hintextSearch,
                border: InputBorder.none,
                hintStyle: GoogleFonts.poppins()
              ),
            ),
          ),
          IconButton(
            onPressed: (){
              FocusScope.of(context).unfocus();
              List<CatModel> searchList = homeController.listOfCats.where((element) => 
                  (element.name??"").toLowerCase().contains(
                    homeController.textEditingController.text.toLowerCase()
                  )
                ).toList();
                homeController.listOfCats = searchList;
            },
            icon: Icon(
              Icons.search,
              color: ThemeData.light().colorScheme.secondary,
            )
          )
        ],
      ),
    );
  }
}