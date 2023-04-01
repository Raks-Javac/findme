import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:findme/src/core/utils/extensions.dart';
import 'package:findme/src/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../shared/res/res.dart';

class Dash extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> with SingleTickerProviderStateMixin {
  int bottomNavIndex = 0;

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  void changeBasedOnIndex(int index) {
    bottomNavIndex = index;
    setState(() {});
  }

  List<String> icons = [mAHomeIcon, mAOthersIcon, mACart, mABell];
  List<String> labels = ["Home", "More", "Cart", "Notifi..."];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FWidgetAppBar(
          leading: const Padding(
            padding: EdgeInsets.all(16.0),
            child: ImageIcon(
              AssetImage(
                mAMenuIcon,
              ),
              color: PColors.primaryColor,
              size: 12,
            ),
          ),
          title: Image.asset(
            mAlogoIcon,
            width: 200,
            height: 30,
          ),
          shouldCenterAppBar: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                mALocationIcon,
                width: 18,
                height: 21,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  const HomeView(),
                  Container(),
                  const HomeView(),
                  Container(),
                ]),
            //bottom Nav

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipPath(
                  clipper: _MyClipper(125),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 25),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorWeight: 0.1,
                          controller: tabController,
                          onTap: (int index) {
                            changeBasedOnIndex(index);
                          },
                          tabs: [
                            for (int i = 0; i < icons.length; i++)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                    AssetImage(icons[i]),
                                    color: i == bottomNavIndex
                                        ? PColors.primaryColor
                                        : PColors.primaryColor.withOpacity(0.6),
                                  ),
                                  addVerticalSpacing(1.5),
                                  Text(
                                    i == bottomNavIndex ? labels[i] : "",
                                    style: const TextStyle(
                                        fontSize: 11.5,
                                        color: PColors.primaryColor),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Container(
            //   color: Colors.black,
            //   width: double.infinity, // or any other desired width
            //   height: 20, // or any other desired height
            //   child: ConstrainedBox(
            //     constraints: const BoxConstraints(maxHeight: 40),
            //     child: BackdropFilter(
            //       filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            //       child: Container(
            //         color: Colors.white.withOpacity(0.4),
            //         // Your content goes here
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
        // bottomNavigationBar: SizedBox(
        //   height: 50,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       SizedBox(
        //         height: 100,
        //         width: double.infinity,
        //         child: Column(
        //           children: [
        //             SizedBox(
        //               height: 30,
        //               child: BackdropFilter(
        //                   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //                   child: SizedBox(
        //                     height: 60,
        //                     child: Row(
        //                       children: const [Text("dddd")],
        //                     ),
        //                   )),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50.0, left: 30),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              mAMegaCart,
              width: 75,
              height: 75,
            ),
          ),
        ));
  }
}

class Adscard extends StatelessWidget {
  const Adscard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 1,
            left: 10,
            right: 10,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFCDD2FD),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: const SizedBox(width: 220, height: 400),
            ),
          ),
          Positioned(
            top: 14,
            right: 5,
            left: 5,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF2B365A),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: const SizedBox(width: 220, height: 400),
            ),
          ),
          Positioned(
            top: 24,
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    image: DecorationImage(
                      image: AssetImage(mAFrontCardImage),
                      fit: BoxFit.fitHeight,
                    )),
                child: Container(
                  width: 173,
                  height: 120,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  // decoration: const BoxDecoration(
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(5),
                  //     topRight: Radius.circular(5),
                  //   ),
                  // ),
                  // child: Image.asset(
                  //   mAFrontCardImage,
                  //   fit: BoxFit.fitHeight,
                  // ),
                )),
          ),
        ],
      ),
    );
  }
}

class CategoryClass {
  final String? label;
  final String? imagePath;
  CategoryClass({this.imagePath, this.label});

  static List<CategoryClass> returnList() {
    return [
      CategoryClass(imagePath: mATransportImage, label: "Transport"),
      CategoryClass(imagePath: mADeliveryImage, label: "Delivery"),
      CategoryClass(imagePath: mAFoodImage, label: "Food"),
    ];
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int bannerLength = 7;
  int currentIndex = 0;
  void changeBannerIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //hi sectiom
                Text(
                  "Hi Casa",
                  style: context.getTextTheme.bodySmall?.copyWith(
                    color: PColors.greyColor,
                    fontSize: 13,
                  ),
                ),
                addVerticalSpacing(5),

                //morning section
                Row(
                  children: [
                    Text(
                      "Good morning",
                      style: context.getTextTheme.bodySmall?.copyWith(
                        color: PColors.primaryColor,
                        fontSize: 18,
                        fontFamily: PStrings.boldFontName,
                      ),
                    ),
                    addHorizontalSpacing(8),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 7.0),
                      child: ImageIcon(
                        AssetImage(mACLoudIcon),
                        color: PColors.primaryColor,
                      ),
                    ),
                  ],
                ),

                //search section
                addVerticalSpacing(9),
                DoubleIconFormFieldWidget(
                  hintText: "Find anything",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(mASearchIcon),
                  ),
                  label: "Find anything",
                  suffixIcon: SizedBox(
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            mACameraIcon,
                            width: 26,
                            height: 26,
                          ),
                          addHorizontalSpacing(14),
                          Image.asset(
                            mAMicIcon,
                            width: 26,
                            height: 26,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                addVerticalSpacing(12),
                CarouselSlider(
                  items: [
                    for (int i = 0; i < bannerLength; i++)
                      Image.asset(
                        mABannerImage,
                      ),
                  ],
                  options: CarouselOptions(
                    enlargeFactor: 0.2,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      changeBannerIndex(index);
                    },
                    enlargeCenterPage: true,
                    reverse: false,
                    padEnds: false,
                    aspectRatio: 1.80,
                    viewportFraction: 1.0,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < bannerLength; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: CircleAvatar(
                          radius: 3.5,
                          backgroundColor: i != currentIndex
                              ? PColors.primaryColor
                              : PColors.primaryColor.withOpacity(0.5),
                        ),
                      ),
                  ],
                ),

                addVerticalSpacing(9),

                //category
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(mATopEdgetIcon),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Text(
                                "CATEGORY",
                                style: context.getTextTheme.bodySmall?.copyWith(
                                  color: PColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: PStrings.boldFontName,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Image.asset(mABottomEdgeIcon),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "See all",
                            style: context.getTextTheme.bodySmall?.copyWith(
                              color: PColors.greyColor.withOpacity(0.8),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontFamily: PStrings.boldFontName,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                //
                addVerticalSpacing(15),
                CarouselSlider(
                  items: [
                    ...CategoryClass.returnList().map((e) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 8,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 20),
                            child: Column(
                              children: [
                                Image.asset(
                                  e.imagePath!,
                                  width: 45,
                                  height: 45,
                                ),
                                addVerticalSpacing(14),
                                Text(
                                  e.label!,
                                  style:
                                      context.getTextTheme.bodySmall?.copyWith(
                                    color: PColors.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: PStrings.boldFontName,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                  options: CarouselOptions(
                    enlargeFactor: 0.2,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      changeBannerIndex(index);
                    },
                    enlargeCenterPage: false,
                    reverse: false,
                    padEnds: false,
                    aspectRatio: 2.5,
                    viewportFraction: 0.36,
                  ),
                ),

                //
                addVerticalSpacing(20),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            mAGreenIcon,
                            height: 20,
                          ),
                          addHorizontalSpacing(7),
                          Text(
                            "Whats new on FindMe ?",
                            style: context.getTextTheme.bodySmall?.copyWith(
                              color: PColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: PStrings.boldFontName,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "See all",
                            style: context.getTextTheme.bodySmall?.copyWith(
                              color: PColors.greyColor.withOpacity(0.8),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontFamily: PStrings.boldFontName,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
//cards
                addVerticalSpacing(20),
                CarouselSlider(
                  items: const [
                    Adscard(),
                    Adscard(),
                    Adscard(),
                  ],
                  options: CarouselOptions(
                    enlargeFactor: 0.2,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      changeBannerIndex(index);
                    },
                    enlargeCenterPage: false,
                    reverse: false,
                    padEnds: false,
                    aspectRatio: 2.4,
                    viewportFraction: 0.52,
                  ),
                ),

                addVerticalSpacing(100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class CurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     final midPoint = size.width / 2;
//     final controlPoint = Offset(midPoint, size.height * 0.45);
//     path.lineTo(0, size.height);
//     path.quadraticBezierTo(
//         controlPoint.dx, controlPoint.dy, size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }

class _MyClipper extends CustomClipper<Path> {
  final double space;

  _MyClipper(this.space);

  @override
  Path getClip(Size size) {
    final path = Path();
    final halfWidth = size.width / 2;
    final halfSpace = space / 2;
    final curve = space / 6;
    final height = halfSpace / 1.4;
    path.lineTo(halfWidth - halfSpace, 0);
    path.cubicTo(halfWidth - halfSpace, 0, halfWidth - halfSpace + curve,
        height, halfWidth, height);

    path.cubicTo(halfWidth, height, halfWidth + halfSpace - curve, height,
        halfWidth + halfSpace, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
