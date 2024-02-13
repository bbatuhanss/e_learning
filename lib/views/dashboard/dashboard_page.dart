import 'package:e_learning_app/views/favorite/favorite_navigable.dart';
import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../popular/popular_navigable.dart';
import '../profile/profile_navigable.dart';
import 'dashboard_navigable.dart';
import '../../utils/navigable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

final goHomeProvider = ChangeNotifierProvider((ref) => GoHomeNotifier());

class GoHomeNotifier extends ChangeNotifier {
  bool goHome = false;

  void setHomePage(bool home) {
    goHome = home;
    notifyListeners();
  }
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  int _bottomNavigationBarIndex = 0;
  double _offsetY = 0.0;

  bool backFromNavigable() {
    if (_bottomNavigationBarIndex != 0) {
      setState(() {
        _bottomNavigationBarIndex = 0;
      });
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    final List<Navigable> navigables = [
      DashboardNavigable(goToBottomNavigationPage: goToBottomNavigationPage),
      PopularNavigable(onBack: backFromNavigable),
      FavoriteNavigable(onBack: backFromNavigable),
      ProfileNavigable(onBack: backFromNavigable),
    ];

    final navigable = navigables[_bottomNavigationBarIndex];

    final bottomNavigationBarItems = List.generate(
      navigables.length,
      (i) => navigables[i].buildBottomNavigationBarItem(
        context,
        i == _bottomNavigationBarIndex,
      ),
    );

    // onWillPop: () async {
    //   if (_bottomNavigationBarIndex != 0) {
    //     setState(() {
    //       _bottomNavigationBarIndex = 0;
    //     });
    //     return false;
    //   }
    //   return true;
    // },
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: navigable.buildPage(context),
      ),
      bottomNavigationBar: Container(
        color: kBackground,
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color:unSelectedMenuColor, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            height: 55,
            width: width,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: unSelectedMenuColor,
                elevation: 10,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: _bottomNavigationBarIndex,
                onTap: goToBottomNavigationPage,
                type: BottomNavigationBarType.fixed,
                items: bottomNavigationBarItems,

                selectedLabelStyle: const TextStyle(fontSize: 0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void goToBottomNavigationPage(int index) {
    setState(() {
      _bottomNavigationBarIndex = index;
    });
  }
}
