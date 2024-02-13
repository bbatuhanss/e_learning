import 'package:e_learning_app/controller/controller.dart';
import 'package:e_learning_app/models/model.dart';
import 'package:e_learning_app/theme/colors.dart';
import 'package:e_learning_app/utils/card_shadow.dart';
import 'package:e_learning_app/widgets/scale_fadeanimation.dart';
import 'package:flutter/material.dart';
import '../../../utils/top_navigator_key.dart';
import '../../../widgets/page_view.dart' as pv;
import '../../favorite/card_detail.dart';

class DashboardSub extends StatefulWidget {
  final void Function(int index) goToBottomNavigationPage;
  const DashboardSub({Key? key,required this.goToBottomNavigationPage}) : super(key: key);

  @override
  State<DashboardSub> createState() => _DashboardSubState();
}

class _DashboardSubState extends State<DashboardSub> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final pv.PageController _controller = pv.PageController(
    initialPage: 0,
    viewportFraction: 0.46,
    alignLeftWithMargin: 22,
  );

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;

    double cardWidth = (width - 22 * 2 - 16) / 2;
    double cardHeight = cardWidth * 195 / 155;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              const Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 14,
                  color:unSelectedMenuColor,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  widget.goToBottomNavigationPage(2);
                },
                child: const Text(
                  'Sees Them All',
                  style: TextStyle(
                    fontSize: 11,
                    color:Color(0xff828282),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 7),
        SizedBox(
          height: cardHeight + 20,
          child: pv.PageView(
            controller: _controller,
            children: [
              for(var item in model_list)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0) +
                      const EdgeInsets.only(right: 22.0),
                  child: ScaleFadeAnimation(
                      delay: 1,
                      child: buildCard(context, item, cardWidth)),
                ),
            ],
          ),
        ),
      ],
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
