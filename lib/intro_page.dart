import 'package:flutter/material.dart';
import 'package:intro_ui/home_page.dart';

import 'title_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  static final String id = "intro_page";

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.id);
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                index=page;
              });
            },
            children: [
              _itemPage(
                image: "assets/body.jpg",
                title: TitleUtils.stepOneTitle,
                title2: TitleUtils.stepOneContent,
              ),
              _itemPage(
                image: "assets/sit.jpg",
                title: TitleUtils.stepTwoTitle,
                title2: TitleUtils.stepTwoContent,
              ),
              _itemPage(
                image: "assets/teach.jpg",
                title: TitleUtils.stepThreeTitle,
                title2: TitleUtils.stepThreeContent,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildIndicators(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemPage({image, title, title2}) {
    return Container(
      padding: EdgeInsets.only(
        left: 50,
        right: 50,
        bottom: 60,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              height: 300,
              width: 300,
              child: Image.asset(image),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            title2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
      ),
    );
  }

  List<Widget> buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (index == i) {
        indicators.add(indicator(true));
      } else {
        indicators.add(indicator(false));
      }
    }
    return indicators;
  }
}