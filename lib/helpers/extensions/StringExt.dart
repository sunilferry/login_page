import 'package:flutter/material.dart';

extension StringExt on String{
  Widget text({Color color=Colors.white,double size=16,FontWeight fontWeight=FontWeight.normal})=>Text(this,style: TextStyle(color: color,fontSize: size,fontWeight: fontWeight),);
}
/**
 *Developed by Suneel kumar 16-02-2022
 */