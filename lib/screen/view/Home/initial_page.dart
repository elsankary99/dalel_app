import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/screen/view/Home/pages/cart_page.dart';
import 'package:test/screen/view/Home/pages/home_page.dart';
import 'package:test/screen/view/Home/pages/search_page.dart';
import 'package:test/screen/view/Home/pages/user_page.dart';

@RoutePage()
class InitialPage extends ConsumerStatefulWidget {
  const InitialPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<InitialPage>
    with SingleTickerProviderStateMixin {
  int _bottomNavIndex = 0;
  late TabController tapController;
  List<IconData> iconList = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.magnifyingGlass,
    FontAwesomeIcons.solidUser
  ];
  List<Widget> pagesList = [
    const HomePage(),
    const CartPage(),
    const SearchPage(),
    const UserPage(),
  ];

  @override
  void initState() {
    tapController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TabBarView(
          controller: tapController,
          physics: const NeverScrollableScrollPhysics(),
          children: pagesList,
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,

        activeIndex: _bottomNavIndex,
        backgroundColor: AppColors.primaryColor,
        activeColor: AppColors.deepBrown,
        inactiveColor: AppColors.lightBrown,
        iconSize: 18.sp,
        height: context.height * 0.08,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        gapLocation: GapLocation.none,
        onTap: (index) => setState(() {
          tapController.animateTo(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceIn);
          _bottomNavIndex = index;
        }),
        //other params
      ),
    );
  }
}
