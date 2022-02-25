import 'package:flutter/material.dart';
/**
 *Developed by Suneel kumar 16-02-2022
 */

extension WidgetExt on Widget{
  Widget get topRight=>Align(
    alignment: Alignment.topRight,
    child: this,
  );
  }