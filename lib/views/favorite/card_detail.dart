import 'package:e_learning_app/widgets/new_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/colors.dart';
import '../../utils/card_shadow.dart';

class CardDetail extends StatefulWidget {
  const CardDetail({Key? key}) : super(key: key);

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail>   with TickerProviderStateMixin{

  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController?.addListener(() {
      setState(() {});
    });
  }

  bool isAboutExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 22.0,
        centerTitle: true,
        title: const Text(
          'Card Detail',
          style: TextStyle(
              color: Color(0xff011633)),
        ),
        leading: BackButton(
          onPressed: () async {
            Navigator.of(context).pop(true);
          },
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    'assets/images/catalog-course.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                    child: Center(
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.29),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                            Icons.play_arrow,
                            size: 40,
                            color: Colors.white
                        ),
                      ),
                    )
                ),
                Positioned(
                  bottom: 14,
                  left: 0,
                  right: 0,
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 2,
                      activeTrackColor: Color(0xFF0DC8D9),
                      inactiveTrackColor: Colors.white,
                      thumbColor: Color(0xFF0DC8D9),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 4.0,
                      ),
                    ),
                    child: Slider(
                      value: .5,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Positioned(
                  bottom: 14,
                  left: 25,
                  right: 25,
                  child: Row(
                    children: [
                      Text(
                        '00:30',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '01:30',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: kButtonPurple,
              height: 32,
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset('assets/images/stack.svg'),
                  SizedBox(width: 4),
                  Text(
                    'Beginning',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 13,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.access_time,
                    size: 17,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '40 m',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 13,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/images/cup.svg'),
                  SizedBox(width: 4),
                  Text(
                    '45',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 13,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite_border,
                    size: 17,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '44',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 13,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: 13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kNewYellow,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0) + const EdgeInsets.only(top: 1.0),
                          child: Text(
                            'New',
                            style: TextStyle(
                              fontSize: 9.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF69C777),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0) + const EdgeInsets.only(top: 1.0),
                          child: Text(
                            '60.2 Score',
                            style: TextStyle(
                              fontSize: 9.0,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: kDarkGrayText,
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: 47,
                            height: 47,
                            child: CircularProgressIndicator(
                              backgroundColor: Color(0xFFEFF1F5),
                              color: Color(0xFF0DC8D9),
                              value: 0.7,
                            ),
                          ),
                          Positioned.fill(
                            child: Center(
                                child: Text(
                                  '65%',
                                  style: TextStyle(
                                    color: kDarkGrayText,
                                    fontSize: 11,
                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 21),
                  Text(
                      'Card About',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: kDarkGrayText,
                      )
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: isAboutExpanded ? null : 61,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: isAboutExpanded ? null : 35,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores',
                            style: TextStyle(
                              color: kGrayText,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        if (!isAboutExpanded) Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                              height: 34,
                              color: Colors.white.withOpacity(0.86),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isAboutExpanded = !isAboutExpanded;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isAboutExpanded) Container(
                      height: 34,
                      color: Colors.white.withOpacity(0.86),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isAboutExpanded = !isAboutExpanded;
                            });
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_up,
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 20),
                  TabBar(
                    indicatorColor: kButtonPurple,
                    labelPadding: const EdgeInsets.only(bottom: 10),
                    controller: _tabController,
                    tabs: [
                      Text(
                        'Contents',
                        style: tabTextStyle(0),
                      ),
                      Text(
                        'Comments',
                        style: tabTextStyle(1),
                      ),
                      Text(
                        'Resources',
                        style: tabTextStyle(2),
                      ),
                    ],
                  ),
                  SizedBox(height: 19),
                  buildTabContents(context),
                ],
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text('Register'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  TextStyle tabTextStyle(int i) {
    if (_tabController?.index == i) {
      return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: kButtonPurple,
      );
    } else {
      return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: kGrayText,
      );
    }
  }


  Widget buildTabContents(BuildContext context) {
    switch (_tabController?.index) {
      case 0:
        return buildContents(context);
        break;
      case 1:
        return buildComments(context);
        break;
      case 2:
        return buildAbout(context);
        break;
    }
    return Container();
  }

  Widget buildAbout(BuildContext context) {
    return Text(
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren.',
      style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: kGrayText
      ),
    );
  }

  Widget buildContents(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildCourseSection('Card section 1 Lorem Ipsum'),
        SizedBox(height: 12),
        buildCourseSection('Card section 2 Lorem Ipsum'),
        SizedBox(height: 12),
        buildCourseSection('Card section 3 Lorem Ipsum'),
        SizedBox(height: 12),
        buildCourseSection('Card section 4 Lorem Ipsum'),
      ],
    );
  }

  Widget buildCourseSection(String title) {
    return CourseSection(
        title,
        [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Lorem ipsum dolor sit amet',
                        style: TextStyle(
                          fontSize: 13,
                          color: kDarkGrayText,
                        )
                    ),
                    SizedBox(height: 9.0),
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Lorem',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: kDarkGrayText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Icon(Icons.circle, size: 6),
                          ),
                          Text(
                            '12 m',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: kDarkGrayText,
                            ),
                          ),
                        ]
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kButtonPurple,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.check,
                      size: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Lorem ipsum dolor sit amet',
                        style: TextStyle(
                          fontSize: 13,
                          color: kDarkGrayText,
                        )
                    ),
                    SizedBox(height: 9.0),
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Podcast',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: kDarkGrayText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Icon(Icons.circle, size: 6),
                          ),
                          Text(
                            '12 m',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: kDarkGrayText,
                            ),
                          ),
                        ]
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kButtonPurple,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.check,
                      size: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Lorem ipsum dolor sit amet',
                        style: TextStyle(
                          fontSize: 13,
                          color: kDarkGrayText,
                        )
                    ),
                    SizedBox(height: 9.0),
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Podcast',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: kDarkGrayText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Icon(Icons.circle, size: 6),
                          ),
                          Text(
                            '12 m',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: kDarkGrayText,
                            ),
                          ),
                        ]
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kButtonPurple),
                  ),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
    );
  }

  Widget buildComments(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '5 comments',
          style: TextStyle(
            color: kDarkGrayText,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: Image.asset('assets/images/img_ads.png').image,
            ),
            SizedBox(width: 8),
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFF5F5F5),
                      hintText: 'write comment...',
                    ),
                  )
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        buildComment1(context),
      ],
    );
  }

  Widget buildComment1(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: Image.asset('assets/images/img_ads.png').image,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                      'User',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: kDarkGrayText,
                      )
                  ),
                  Spacer(),
                  Text(
                      '2 hours ago',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        color: kGrayText,
                      )
                  )
                ],
              ),
              SizedBox(height: 12),
              Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: kDarkGrayText,
                  )
              ),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.reply,
                    color: kGrayText,
                    size: 18,
                  ),
                  Text(
                    'reply',
                    style: TextStyle(
                      color: kGrayText,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                  'View 1 more answer',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: kButtonPurple,
                  )
              ),
              SizedBox(height: 12),
            ],
          ),
        )
      ],
    );
  }
}
class CourseSection extends StatefulWidget {
  final String title;
  final List<Widget> rows;
  const CourseSection(this.title, this.rows, {Key? key}) : super(key: key);

  @override
  _CourseSectionState createState() => _CourseSectionState();
}

class _CourseSectionState extends State<CourseSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: isExpanded ? cardShadow : null,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              height: 43,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF003E7E).withOpacity(0.05),
                borderRadius: isExpanded
                    ? BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                    : BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(width: 14.0),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: kDarkGrayText,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: Color(0xFFABB1B5),
                    ),
                    SizedBox(width: 18.0),
                  ],
                ),
              ),
            ),
          ),
          if (isExpanded)
            ...buildRows(),
        ],
      ),
    );
  }

  List<Widget> buildRows() {
    final newList = <Widget>[];
    for (int i = 0; i < widget.rows.length; ++i) {
      newList.add(Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 27,
          bottom: 12,
          right: 25,
        ),
        child: widget.rows[i],
      ));
      if (i + 1 < widget.rows.length) {
        newList.add(Divider());
      }
    }
    return newList;
  }
}
