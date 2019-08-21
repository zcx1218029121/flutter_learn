import 'package:flutter/material.dart';

class Util {
  static const String all = "all";
  static const String only = "";

  static buildPadding(Widget child,
      {String type = "all",
      double size = 0,
      double left = 0,
      double right = 0,
      double bottom = 0,
      double top = 0}) {
    EdgeInsets edgeInsets;

    switch (type) {
      case all:
        edgeInsets = EdgeInsets.all(size);
        break;
      case only:
        edgeInsets =
            EdgeInsets.only(left: left, right: right, bottom: bottom, top: top);
    }
    return new Padding(padding: edgeInsets, child: child);
  }
}
