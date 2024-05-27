import 'package:flutter/material.dart';
import 'package:test_aplication/domain/models/cat_model.dart';
import 'package:test_aplication/presentation/screens/detail/widgets/arrow_icon_app_bar_widget.dart';
import 'package:test_aplication/presentation/screens/detail/widgets/image_detail_widget.dart';
import 'package:test_aplication/presentation/screens/detail/widgets/info_of_cat_on_detail_widget.dart';
import 'package:test_aplication/presentation/screens/detail/widgets/title_of_detail_widget.dart';
import 'package:test_aplication/presentation/theme/font_size.dart';
import 'package:test_aplication/presentation/theme/strings.dart';
import 'package:test_aplication/presentation/widgets/text_widget.dart';

class DetailScreen extends StatelessWidget {
  final int tag;
  final CatModel catModel; 
  const DetailScreen({ required this.tag, required this.catModel,Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.withOpacity(0.60),
        leading: const ArrowIconAppBarWidget(),
        title: TitleOfDetailWidget(
          title: catModel.name??"" ,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ImageDetailWidget(
                tag: tag,
                urlCatImage: catModel.urlImage??"",
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    child: TextWidgetApp(
                      text: catModel.description??"",
                      fontWeight: FontWeight.normal, 
                      fontSize: fontSize2,
                      textOverflow: TextOverflow.fade,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const TextWidgetApp(
                    text: interestingInfo,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize2
                  ),
                  const SizedBox(height: 10.0),
                  InfoOfCatOnDetailWidget(
                    titleInfo: inteligenceString,
                    detailInfo:( catModel.intelligence??0).toString(),
                  ),
                  InfoOfCatOnDetailWidget(
                    titleInfo: adaptabilityString,
                    detailInfo:( catModel.adaptability??0).toString(),
                  ),
                  InfoOfCatOnDetailWidget(
                    titleInfo: originString,
                    detailInfo:( catModel.origin??"").toString(),
                  ),
                  InfoOfCatOnDetailWidget(
                    titleInfo: hairlessString,
                    detailInfo:( (catModel.hairless??0)==0)?"Con pelaje":"Sin pelaje",
                  ),
                  InfoOfCatOnDetailWidget(
                    titleInfo: levelEnergyString,
                    detailInfo:( catModel.energyLevel??0).toString(),
                  ),
                  InfoOfCatOnDetailWidget(
                    titleInfo: dogFriendlyString,
                    detailInfo:( (catModel.dogFriendly??0)==0)?
                      "Amigable":
                      "No amigable",
                  ),
                  InfoOfCatOnDetailWidget(
                    titleInfo: otherNamesString,
                    detailInfo:( catModel.altNames??"").toString(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
