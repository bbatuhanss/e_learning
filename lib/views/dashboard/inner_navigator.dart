import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InnerNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Route initialRoute;
  final bool Function()? onOuterBack;

  const InnerNavigator({
    Key? key,
    required this.navigatorKey,
    required this.initialRoute,
    this.onOuterBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onOuterBack == null) return true;
        var handled = await navigatorKey.currentState?.maybePop();
        if (handled != true) {
          handled = onOuterBack!();
        }
        return handled != true;
      },
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: (settings) => initialRoute,
      ),
    );
  }
}
