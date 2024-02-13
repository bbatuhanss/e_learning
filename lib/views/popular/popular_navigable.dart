import 'package:e_learning_app/utils/navigable.dart';
import 'package:e_learning_app/views/popular/popular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/colors.dart';
import '../dashboard/inner_navigator.dart';

final innerNavigatorKey = GlobalKey<NavigatorState>();

class PopularNavigable extends Navigable {
  final bool Function() onBack;

  PopularNavigable({required this.onBack});

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () async {
          final handled = await Navigator.of(context).maybePop();
          if (handled != true) onBack();
        },
      ),
      centerTitle: true,
      titleSpacing: 22.0,
      title: Text('Popular',
        overflow: TextOverflow.ellipsis,
      ),
      elevation: 0,
    );
  }

  @override
  BottomNavigationBarItem buildBottomNavigationBarItem(
      BuildContext context, bool isSelected) {
    return buildBottomNavigationBarItemWithIcons(
      context,
      SvgPicture.asset(
        'assets/images/bar_icons/popular_empty.svg',
        height: 24,
        color: Colors.white,
      ),
      SvgPicture.asset(
        'assets/images/bar_icons/popular.svg',
        height: 24,
        color: Colors.white,
      ),
      isSelected,
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return InnerNavigator(
      navigatorKey: innerNavigatorKey,
      initialRoute: MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: kBackground,
          appBar: buildAppBar(context),
          body: Container(
            decoration: const BoxDecoration(
              color: kBackground,
            ),
            child: PopularMainPage(),
          ),
        ),
      ),
      onOuterBack: onBack,
    );
  }
}
