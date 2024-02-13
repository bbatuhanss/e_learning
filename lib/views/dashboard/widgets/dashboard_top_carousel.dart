import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_learning_app/services/dio/dio.dart';
import 'package:e_learning_app/utils/card_shadow.dart';
import 'package:e_learning_app/widgets/animation.dart';
import 'package:e_learning_app/widgets/scale_fadeanimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../controller/controller.dart';
import '../../../widgets/page_view.dart' as pv;
import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardTopCarousel extends ConsumerStatefulWidget {
  const DashboardTopCarousel({Key? key}) : super(key: key);

  @override
  _DashboardTopCarouselState createState() => _DashboardTopCarouselState();
}

class _DashboardTopCarouselState extends ConsumerState<DashboardTopCarousel> {
  final pv.PageController _controller = pv.PageController(
    initialPage: 0,
    viewportFraction: 1,
  );
  CarouselController buttonCarouselController = CarouselController();


  @override
  void initState() {
    super.initState();
   // asyncInit();
  }

  Future<void> asyncInit() async {
   await gellAllCountry();
  }

  Future<void> gellAllCountry() async {
    try{

      final response = await ServiceDio().get("all");
      print(response);

    }catch(err){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("$err: Error"),
        ),
      );
    }
  }

  late List<Widget> imageSliders = imgList
      .map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Stack(
            children: <Widget>[
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Image.network(item, fit: BoxFit.cover, width: 1000.0)
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'No. ${imgList.indexOf(item)} image',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    ),
  ))
      .toList();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;

    double carouselHeight = (width - 22 * 2) * 9 / 16;

    return Consumer(builder: (context, watch, child) {
      return DefaultTextStyle(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          shadows: textOnCardShadow,
        ),
        child: Column(
          children: [
            BounceFromBottomAnimation(
              delay: 4,
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  enlargeFactor: 0.4,
                  autoPlay: true,
                  animateToClosest: true,
                  enableInfiniteScroll: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  disableCenter: true,
                  pageSnapping: true,
                  pauseAutoPlayOnTouch: true,
                ),
                items: imageSliders,
              ),
            ),

            /*
            SizedBox(
              height: carouselHeight + 20,
              child: pv.PageView(
                controller: _controller,
                children: [
                  for (var item in demoData )
                    buildCarouselItem(
                        context,
                        item["id"],
                        //We subtract 3 from the value to understand which slider has been selected. Since the id value returned from the service for this widget starts from 3 ,
                        demoData.length,
                        item["illustration"],
                        item["title"],
                        item["text"],
                        "click"
                    ),
                ],
              ),
            ),
           */
          ],
        ),
      );
    });
  }

  Widget buildCarouselItem(
    BuildContext context,
    int itemIndex,
    int numItems,
    String photo,
    String header,
    String shortDescription,
    String buttonText,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: cardShadow,
          ),
          child: Stack(
            children: [
              SvgPicture.asset(
                photo,
                fit: BoxFit.contain,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Container(
                      color: Colors.black12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22) +
                    const EdgeInsets.only(top: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      header,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 14.0),
                    Text(
                      shortDescription,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16
                      ),
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < numItems; ++i)
                          i == itemIndex
                              ? Container(
                                  width: 9.0,
                                  height: 9.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 2.3),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                )
                              : Container(
                                  width: 7.0,
                                  height: 7.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 2.3),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.5),
                                  ),
                                )
                      ],
                    ),
                    const SizedBox(height: 9.0),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
