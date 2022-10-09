import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_provider.dart';
import '../page/home_page.dart';
import '../config/app_asset.dart';
import '../config/app_color.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => TodoProvider(),
                child: const HomePage(),
              ),
            ));
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Task',
                style: AppColor.blackTextStyle.copyWith(fontSize: 60),
              ),
              Image.asset(
                AppAsset.imgSplash,
                width: 227,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
