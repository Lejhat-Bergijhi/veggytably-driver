import 'package:flutter/material.dart';
import 'package:veggytably_driver/views/home_page/deliver_cust_order_body.dart';
import 'package:veggytably_driver/views/home_page/deliver_order_body.dart';
import 'package:veggytably_driver/views/map_page.dart';
import 'package:veggytably_driver/widgets/accepting_appbar.dart';
import 'package:veggytably_driver/widgets/deliver_to_cust_appbar.dart';

import '../widgets/custom_appbar.dart';
import 'home_page/offline_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isOnline = false;
  bool isAccepted = false;

  void toggleOnline() {
    setState(() {
      _isOnline = !_isOnline;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isAccepted) {
      return Scaffold(
        appBar: CustomFloatingAppbar(
          offline: !_isOnline,
          title: _isOnline ? "Online Mode" : "Offline Mode",
          subTitle: 'Home',
          color: _isOnline ? const Color(0xfffffffff) : const Color(0xff70cb88),
          toggleOnline: toggleOnline,
        ),
        // body: _isOnline ? const OnlineBody() : const OfflineBody(),
        body: _isOnline ? MapPage() : const OfflineBody(),
      );
    } else {
      if (isAccepted) {
        _isOnline = true;
        return const Scaffold(
          appBar: DeliverToCustAppbar(),
          body: DeliverCustOrderBody(),
        );
      } else {
        _isOnline = true;
        return const Scaffold(
          appBar: AcceptingAppbar(),
          body: DeliverOrderBody(),
        );
      }
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (!isAccepted) {
  //     return Scaffold(
  //       appBar: CustomFloatingAppbar(
  //         offline: !_isOnline,
  //         title: _isOnline ? "Online Mode" : "Offline Mode",
  //         subTitle: 'Home',
  //         color: _isOnline ? const Color(0xfffffffff) : const Color(0xff70cb88),
  //         toggleOnline: toggleOnline,
  //       ),
  //       body: _isOnline ? const OnlineBody() : const OfflineBody(),
  //     );
  //   } else {
  //     if (isAccepted) {
  //       _isOnline = true;
  //       return const Scaffold(
  //         appBar: DeliverToCustAppbar(),
  //         body: DeliverCustOrderBody(),
  //       );
  //     } else {
  //       _isOnline = true;
  //       return const Scaffold(
  //         appBar: AcceptingAppbar(),
  //         body: DeliverOrderBody(),
  //       );
  //     }
  //   }
  // }
}
