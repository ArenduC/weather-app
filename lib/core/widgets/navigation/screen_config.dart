import 'package:flutter/material.dart';

class ScreenConfig {

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final bool extendBodyBehindAppBar;
  final Widget? floatingActionButton;

 const ScreenConfig({required this.body, this.appBar,this.floatingActionButton, this.bottomNavigationBar,  this.extendBodyBehindAppBar = false});

}