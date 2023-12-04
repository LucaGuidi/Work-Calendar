import 'package:flutter/cupertino.dart';

extension BuildContextExtension on BuildContext {
  CupertinoThemeData get theme => CupertinoTheme.of(this);

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;
}