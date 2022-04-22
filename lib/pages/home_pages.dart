
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:rapino/home/HomeController.dart';
import 'package:rapino/home/HomeProvider.dart';
import 'package:rapino/home/map.dart';
import 'package:sz_fancy_bottom_navigation/sz_fancy_bottom_navigation.dart';

class HomePage extends StatelessWidget {
  HomeController controllerHome =
      HomeController(4.545367057195659, -76.09435558319092);

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: const Color(0xff00c600),
        textColor: Colors.white,
        initialSelection: 2,
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.search, title: "Search"),
          TabData(iconData: Icons.pin_drop_outlined, title: "Map"),
          TabData(iconData: Icons.shopping_cart, title: "Basket"),
          TabData(iconData: Icons.shopping_cart, title: "Basket")
        ],
        onTabChangedListener: (position) {},
      ),
      appBar: AppBar(
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        leadingWidth: 65,
        leading: Row(
          children: [
            Container(
              height: 70,
              padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
              color: const Color(0xfffef200),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            SizedBox(
              height: 70,
              child: Image.asset(
                "assets/diagonal.png",
                fit: BoxFit.fill,
              ),
              width: 30,
            )
          ],
        ),
        title: const Text(
          "Cerca a mi",
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      body: LoadingOverlay(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Expanded(child: Map()),
              ],
            )
          ],
        ),
        isLoading: homeProvider.isLoading,
      ),
    );
  }
}
