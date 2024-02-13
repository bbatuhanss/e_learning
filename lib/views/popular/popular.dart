import 'package:e_learning_app/controller/controller.dart';
import 'package:e_learning_app/widgets/new_appbar.dart';
import 'package:flutter/material.dart';
import '../../models/model.dart';
import '../../theme/colors.dart';
import '../../utils/card_shadow.dart';
import '../../utils/top_navigator_key.dart';
import '../../widgets/scale_fadeanimation.dart';
import '../favorite/card_detail.dart';

class PopularMainPage extends StatefulWidget {
  const PopularMainPage({Key? key}) : super(key: key);

  @override
  State<PopularMainPage> createState() => _PopularMainPageState();
}

class _PopularMainPageState extends State<PopularMainPage> {
  @override
  Widget build(BuildContext context) {
    // TODO this is the best approach. change all other screens according to this.
    var mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;

    double cardWidth = (width - 22 * 2 - 15) / 2;
    double cardHeight = cardWidth * 195 / 155;
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: cardWidth,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 4.0,
                mainAxisExtent: cardHeight,
              ),
              delegate: SliverChildListDelegate(
                [
                  for(var item in model_list)
                    ScaleFadeAnimation(
                      delay: 2,
                      child: buildCard(context, item, cardWidth),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context, Model data, double cardWidth) {
    return GestureDetector(
      onTap: () {
        topNavigatorKey.currentState?.push(
          MaterialPageRoute(builder: (context) {
            return CardDetail(
            );
          }),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 200,
        width: 200,
        child: Container(
          width: cardWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: profileShadow,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 155 / 90,
                      child: Image.asset(
                        data.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0) -
                        const EdgeInsets.only(bottom: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Text(
                            data.title1,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16,
                                color: unSelectedMenuColor),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Text(
                            data.desc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 12,
                                color: unSelectedMenuColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
