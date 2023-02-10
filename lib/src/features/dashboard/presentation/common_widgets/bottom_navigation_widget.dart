import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:kofu/src/features/dashboard/presentation/providers/dashboard_controller_provider.dart';
import 'package:kofu/src/routing/app_router.dart';

class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomNavigationWidget> createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState
    extends ConsumerState<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final position = ref.watch(dashboardControllerNotifierProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: position,
        onTap: (value) => _onTap(value),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        items: [
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/icons/navbar-home-off.png",
                color: Theme.of(context).primaryColor,
              ),
              icon: Image.asset("assets/icons/navbar-home-off.png"),
              label: 'HOME'),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/icons/navbar-cart-off.png",
                color: Theme.of(context).primaryColor,
              ),
              icon: Image.asset("assets/icons/navbar-cart-off.png"),
              label: 'CART'),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/icons/navbar-order-off.png",
                color: Theme.of(context).primaryColor,
              ),
              icon: Image.asset("assets/icons/navbar-order-off.png"),
              label: 'ORDER'),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/icons/navbar-profile-off.png",
                color: Theme.of(context).primaryColor,
              ),
              icon: Image.asset("assets/icons/navbar-profile-off.png"),
              label: 'PROFILE'),
        ],
      ),
    );
  }

  void _onTap(int index) {
    ref.read(dashboardControllerNotifierProvider.notifier).setPosition(index);

    switch (index) {
      case 0:
        context.goNamed(AppRoute.home.name);
        break;
      case 1:
        context.goNamed(AppRoute.cart.name);
        break;
      case 2:
        context.goNamed(AppRoute.order.name);
        break;
      case 3:
        context.goNamed(AppRoute.profile.name);
        break;
      default:
    }
  }
}
