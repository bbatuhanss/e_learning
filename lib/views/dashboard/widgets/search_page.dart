import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../theme/colors.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}



class _SearchPageState extends ConsumerState<SearchPage> {
  TextEditingController searchTextController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool onSubmitted = false;

  @override
  void initState() {
    super.initState();

    searchTextController.addListener(() {
      if (searchTextController.text.isEmpty) {
        setState(() {
          onSubmitted = false;
        });
      } else {
        setState(() {});
      }
    });
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/images/new_design/chevron-left.svg',
              color: unSelectedMenuColor,
              width: 20,
              height: 20,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          titleSpacing: 22.0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
              fontSize: 16,
              color: unSelectedMenuColor),
          title: const Text('Ara'),
          elevation: 1,
        ),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12.0),
                    buildSearch(),
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }


  Widget buildSearch() {
    return Row(
      children: [
        const SizedBox(width: 22),
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextFormField(
              controller: searchTextController,
              focusNode: focusNode,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              onFieldSubmitted: (value) {
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignLabelWithHint: false,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color(0xffE5E5E5), width: 1.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: const Color(0xfff5f5f5),
                isDense: true,
                contentPadding: const EdgeInsets.all(8),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    'assets/images/global_search_icon.svg',

                    color: const Color(0xff143A6D),
                  ),
                ),
                suffixIcon: searchTextController.text.isEmpty
                    ? null
                    : IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.3),
                    size: 20,
                  ),
                  onPressed: () {
                    onSubmitted = false;
                    searchTextController.text = '';
                  },
                ),
              ),
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('İptal', style: const TextStyle(
                color: unSelectedMenuColor, fontSize: 15))),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget buildNotFoundArea(String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset('assets/images/new_design/smile_icon.svg'),
          const SizedBox(height: 27),
          Text(
            '"$text"',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: kGrayText,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Üzgünüz, aradığınız kriterlere uygun \nhiçbir sonuç bulunamadı.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: kGrayText,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Color getCardColor(int levelId) {
    if (levelId == 1) {
      return const Color(0xffBABABA);
    } else if (levelId == 2) {
      return const Color(0xffFED94A);
    } else {
      return const Color(0xffFB5858);
    }
  }

  Widget buildSearchResult(String description, String searchText, int id) {
    final index =
    description.toLowerCase().indexOf(searchText.toLowerCase());
    final length = searchText.length;

    final head = index == -1
        ? description
        : description.substring(0, index);
    final mid =
    index == -1 ? '' : description.substring(index, index + length);
    final end = index == -1 ? '' : description.substring(index + length);

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: RichText(
          text: TextSpan(
            text: head,
            style: Theme
                .of(context)
                .textTheme
                .bodyText1,
            children: <TextSpan>[
              TextSpan(
                text: mid,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: unSelectedMenuColor,
                ),
              ),
              TextSpan(text: end),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchResultCardView() {
    return buildNotFoundArea("searchText");
  }
}


class DetailRow extends StatefulWidget {
  final int courseId;

  const DetailRow({
    Key? key, required this.courseId,
  }) : super(key: key);

  @override
  _DetailRowState createState() => _DetailRowState();
}

class _DetailRowState extends State<DetailRow> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: SizedBox(
          height: 18.0,
          width: 18.0,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey,
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          "assets/images/ic_time.svg",
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: SizedBox(
            width: 65,
            child: Text(
               '',
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xff606060),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/liked.svg",
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                 "",
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
