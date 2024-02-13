import 'dart:typed_data';
import 'package:e_learning_app/utils/card_shadow.dart';
import 'package:e_learning_app/widgets/animation.dart';
import 'package:e_learning_app/widgets/master_painter.dart';
import 'package:e_learning_app/widgets/new_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';

class ProfileMainPage extends ConsumerStatefulWidget {
  const ProfileMainPage({Key? key}) : super(key: key);

  @override
  _ProfileMainPageState createState() => _ProfileMainPageState();
}

class _ProfileMainPageState extends ConsumerState<ProfileMainPage> {
  final scrollController = ScrollController();
  Uint8List? imgArray;
  String? fileName;
  int selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: CustomPaint(
        size: Size(MediaQuery.sizeOf(context).width,
            MediaQuery.sizeOf(context).height),
        painter: MasterPainter(),
        child: BounceFromBottomAnimation(
          delay: 5,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return CustomScrollView(
                cacheExtent: 3000,
                controller: scrollController,
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [

                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildButton(String text, int buttonId) {
    return SizedBox(
      width: 111,
      height: 57,
      child: Container(
        decoration: BoxDecoration(
          color: eParentPurple,
          boxShadow: dropShadow,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
