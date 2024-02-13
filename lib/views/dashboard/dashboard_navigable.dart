import 'package:e_learning_app/utils/navigable.dart';
import 'package:e_learning_app/widgets/animation.dart';
import 'package:e_learning_app/widgets/master_painter.dart';
import 'package:e_learning_app/widgets/new_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/colors.dart';
import 'inner_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/views/dashboard/widgets/popular.dart';
import 'package:e_learning_app/views/dashboard/widgets/search_page.dart';
import 'widgets/dashboard_sub.dart';
import 'widgets/dashboard_top_carousel.dart';

final innerNavigatorKey = GlobalKey<NavigatorState>();
final unreadNotificationsOfCountProvider =
    ChangeNotifierProvider((ref) => UnReadNotificationsOfNotifier());

class UnReadNotificationsOfNotifier extends ChangeNotifier {
  int unreadNotificationCount = 0;

  void setNotificationsOfCount(int count) {
    unreadNotificationCount = count;
    notifyListeners();
  }
}

class DashboardNavigable extends Navigable {

  AppBar buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 22.0,
      title: Text('dashboard',
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
        'assets/images/bar_icons/home_empty.svg',
        height: 24,
      ),
      SvgPicture.asset(
        'assets/images/bar_icons/home.svg',
        height: 24,
      ),
      isSelected,
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return InnerNavigator(
        navigatorKey: innerNavigatorKey,
        initialRoute: MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor:  kBackground,
            appBar: const NewAppBar(),
            body: BounceFromBottomAnimation(
              delay: 5,
              child: Container(
                decoration: const BoxDecoration(
                 color: kBackground,
                ),
                child: DashboardInnerPage(
                    goToBottomNavigationPage: goToBottomNavigationPage),
              ),
            ),
          ),
        ),
      );
    });
  }

  void Function(int index) goToBottomNavigationPage;

  DashboardNavigable({required this.goToBottomNavigationPage});
}

class DashboardInnerPage extends ConsumerStatefulWidget {
  final void Function(int index) goToBottomNavigationPage;

  const DashboardInnerPage({Key? key, required this.goToBottomNavigationPage})
      : super(key: key);

  @override
  _DashboardInnerPageState createState() => _DashboardInnerPageState();
}

class _DashboardInnerPageState extends ConsumerState<DashboardInnerPage> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.unfocus();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            decoration: BoxDecoration(
              color: greyParentColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 6,
                    ),
                    child: Text(
                      "Search...",
                      textAlign: TextAlign.left,
                      style:
                      TextStyle(fontSize: 14, color: unSelectedMenuColor),
                    ),
                  ),
                  const Spacer(),
                  buildSearch(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const DashboardTopCarousel(),
          const SizedBox(height: 5.0),
          DashboardSub(
            goToBottomNavigationPage: widget.goToBottomNavigationPage,
          ),
          const SizedBox(height: 5.0),
          Popular(
            goToBottomNavigationPage: widget.goToBottomNavigationPage,
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Row(
      children: [
        const SizedBox(width: 22),
        IconButton(
            onPressed: () {
              focusNode.unfocus();
              //TODO not found page should be add to the MyCoursesSearchPage
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                const SearchPage(),
                transitionDuration: Duration.zero,
              ));
            },
            icon: Icon(
              Icons.search_sharp,
              size: 28,
              color: Colors.grey,
            )
        ),
        const SizedBox(width: 22),
      ],
    );
  }
}
