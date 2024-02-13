import 'package:e_learning_app/widgets/fade_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const NewAppBar({Key? key}) : super(key: key);

  @override
  _NewAppBarState createState() => _NewAppBarState();

  @override
  Size get preferredSize => new Size(70, 70);
}

class _NewAppBarState extends ConsumerState<NewAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        leadingWidth: 0,
        backgroundColor: kBackground,
        leading: Container(),
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            RotateFadeAnimation(
              delay: 2,
              child: Icon(
                Icons.travel_explore,
                size: 30,
                color: unSelectedMenuColor,
              ),
            ),
            const SizedBox(width: 10,),
            Text(
              "Lets Explore the App!",
              style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: unSelectedMenuColor),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
