import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:veggytably_driver/widgets/custom_appbar.dart';

import 'home_page/offline_body.dart';
import 'home_page/online_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isOnline = false;

  void toggleOnline() {
    setState(() {
      _isOnline = !_isOnline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customFloatingAppbar(
        offline: !_isOnline,
        title: _isOnline ? "Online Mode" : "Offline Mode",
        subTitle: 'Home',
        color: _isOnline ? const Color(0xfffffffff) : const Color(0xff70cb88),
        toggleOnline: toggleOnline,
      ),
      body: _isOnline ? OnlineBody() : OfflineBody(),
    );
  }
}
