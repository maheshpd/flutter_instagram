import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/home_page.dart';
import 'package:flutter_instagram/pages/search_page.dart';
import 'package:flutter_instagram/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: black,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const HomePage(),
      const SearchPage(),
      const Center(
        child: Text(
          "Upload Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
              color: white),
        ),
      ),
      const Center(
        child: Text(
          "Activity Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
              color: white),
        ),
      ),
      const Center(
        child: Text(
          "Account Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
              color: white),
        ),
      )
    ];

    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  PreferredSize getAppBar() {
    if (pageIndex == 0) {
      return PreferredSize(
          child: AppBar(
            backgroundColor: appBarColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/images/camera_icon.svg",
                  width: 30,
                ),
                const Text(
                  "Instagram",
                  style: TextStyle(fontFamily: 'Billabong', fontSize: 35),
                ),
                SvgPicture.asset(
                  "assets/images/message_icon.svg",
                  width: 30,
                )
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(50));
    } else if (pageIndex == 1) {
      return const PreferredSize(
          child: Text('data'), preferredSize: Size.fromHeight(0));
    } else if (pageIndex == 2) {
      return PreferredSize(
          child: AppBar(
            centerTitle: true,
            backgroundColor: appBarColor,
            title: const Text("Upload"),
          ),
          preferredSize: const Size.fromHeight(50));
    } else if (pageIndex == 3) {
      return PreferredSize(
          child: AppBar(
            centerTitle: true,
            backgroundColor: appBarColor,
            title: const Text("Activity"),
          ),
          preferredSize: const Size.fromHeight(50));
    } else {
      return PreferredSize(
          child: AppBar(
            centerTitle: true,
            backgroundColor: appBarColor,
            title: const Text("Account"),
          ),
          preferredSize: const Size.fromHeight(50));
    }
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      pageIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_icon.svg",
      pageIndex == 3
          ? "assets/images/love_active_icon.svg"
          : "assets/images/love_icon.svg",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];

    return Container(
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(color: appFooterColor),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return InkWell(
                  onTap: () {
                    selectedTab(index);
                  },
                  child: SvgPicture.asset(
                    bottomItems[index],
                    width: 27,
                  ));
            })),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
