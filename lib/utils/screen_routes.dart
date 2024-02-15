import 'package:db_miner/screen/detail/view/detail_screen.dart';
import 'package:db_miner/screen/home/view/home_screen.dart';
import 'package:db_miner/screen/like/view/like_screen.dart';
import 'package:db_miner/screen/setting/view/setting_screen.dart';
import 'package:db_miner/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder>screen_routes={
 '/':(context) => const SplashScreen(),
 'home':(context) => const HomeScreen(),
 'detail':(context) => const DetailScreen(),
 'setting':(context) => const SettingScreen(),
 'like':(context) => const LikeScreen(),
};