
import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:dummy_project_1/core/utils/constants/app_text.dart';
import 'package:dummy_project_1/core/utils/constants/colors.dart';
import 'package:dummy_project_1/core/utils/constants/icon_path.dart';
import 'package:dummy_project_1/features/history/screens/history_screen.dart';
import 'package:dummy_project_1/features/order/screens/order_screen.dart';
import 'package:dummy_project_1/features/profile/screens/profile_screen.dart';
import 'package:dummy_project_1/features/subscription/screens/subscription_initial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  int _currentIndex = 0;

 
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  Widget _buildNavigator(int index, Widget child) {
    return Offstage(
      offstage: _currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (_) => child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        centerTitle: false,
        leadingWidth: 150,
        leading: Text(
          AppText.appName,
          style: getTextStyle(
            fontFamily: 'bricolage',
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 4.0,
                color: Colors.white.withValues(alpha: 0.3),
              ),
            ],
          ),
        ).marginOnly(left: 15),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withValues(alpha: 0.1),
            ),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(IconPath.belllogo),
                ),
                Positioned(
                  right: 15,
                  top: 10,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ).marginOnly(right: 15).paddingOnly(bottom: 10),
        ],
      ),
      body: Stack(
        children: [
          _buildNavigator(0, SubscriptionInitial()),
          _buildNavigator(1, OrderScreen()),
          _buildNavigator(2, HistoryScreen()),
          _buildNavigator(3, ProfileScreen()),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: AppColors.secondary,
        ),
        child: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.grey.shade500,
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          labelStyle: getTextStyle(
            fontFamily: 'bricolage',
            fontWeight: FontWeight.w600,
            fontSize: 11,
          ),
          indicator: TopIndicator(),
          tabs: <Widget>[
            Tab(icon: Image.asset(IconPath.menulogo, scale: 30), text: 'Menu'),
            Tab(icon: Image.asset(IconPath.order, scale: 30), text: 'Order'),
            Tab(icon: Image.asset(IconPath.chat, scale: 30), text: 'Chat'),
            Tab(
              icon: Image.asset(IconPath.profile, scale: 30),
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 5
      ..isAntiAlias = true;

    canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx, 0), paint);
  }
}
