import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_aplication/domain/controllers/home_controller.dart';
import 'package:test_aplication/presentation/screens/detail/screens/detail_screen.dart';
import 'package:test_aplication/presentation/theme/font_size.dart';
import 'package:test_aplication/presentation/theme/images.dart';
import 'package:test_aplication/presentation/theme/strings.dart';
import 'package:test_aplication/presentation/widgets/text_widget.dart';

class ListResultsOfCatOnHomeWidget extends StatelessWidget {
  const ListResultsOfCatOnHomeWidget({
    Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Provider.of<HomeController>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: homeController.listOfCats.length,
        itemBuilder: (context,index){
          double heightSize = 320;
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                DetailScreen(
                  tag: index,
                  catModel: homeController.listOfCats[index],
                ) ));
            },
            child: Container(
              height: heightSize,width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.only(
                bottom: 15.0
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.4
                ),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.60,
                        child:  TextWidgetApp(
                          text:homeController.listOfCats[index].name??"" ,
                          fontWeight: FontWeight.normal,
                          fontSize: fontSize2,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.amber.withOpacity(0.30)
                        ),
                        child: const TextWidgetApp(
                          text: viewMoreInfo,
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Hero(
                    tag: index,
                    child: SizedBox(
                      height: heightSize*0.60,
                      child: FadeInImage(
                        height: 80.0,
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
                          homeController.listOfCats[index].urlImage??"",
                         ),
                         fit: BoxFit.fitWidth,
                        ),
                    ),
                  ),
                  SizedBox(height:heightSize*0.05),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent.withOpacity(0.30),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.35,
                          child:  TextWidgetApp(
                            text: homeController.listOfCats[index].origin??"" ,
                            fontWeight: FontWeight.normal,
                            fontSize: fontSize3,
                          ),
                        ),
                        const Spacer(),
                        TextWidgetApp(
                          text: "$inteligenceString ${(homeController.listOfCats[index].intelligence??0).toString()}",
                          fontWeight: FontWeight.normal,
                          fontSize: fontSize3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } 
      ),
    );
  }
}
