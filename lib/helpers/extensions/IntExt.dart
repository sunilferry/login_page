import 'package:flutter/material.dart';
/**
 *Developed by Suneel kumar 16-02-2022
 */

extension IntExt on int{
  Widget get height=>SizedBox(height: toDouble(),);
  Widget get width=>SizedBox(width: toDouble(),);
  }