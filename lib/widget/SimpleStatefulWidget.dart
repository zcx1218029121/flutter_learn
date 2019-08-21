import 'package:flutter/material.dart';
import 'dart:async';

/// 最简单的flutter控件
/// @author loafer
class SimpleStatefulWidget extends StatefulWidget {
  final String text;

  // 构造方法传值
  SimpleStatefulWidget({this.text});

  @override
  State<StatefulWidget> createState() => _SimpleStatefulWidgetState(this.text);
}

class _SimpleStatefulWidgetState extends State<SimpleStatefulWidget> {
  String _text;

  _SimpleStatefulWidgetState(this._text);

  @override
  void initState() {
    // 该方法只执行一次
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        this._text = "i am change";
      });
    });
  }

  @override
  void didChangeDependencies() {
    // 在state之后调用获取别的state
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(_text ?? "这就是有状态DMEO",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(5))));
  }

  @override
  void dispose() {
    // 销毁回掉
    super.dispose();
  }
}
