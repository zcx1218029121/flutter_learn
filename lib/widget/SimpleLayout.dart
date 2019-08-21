import 'package:flutter/material.dart';
import 'package:flutter_all/Util.dart';

/// 简单的layout 布局练习
//mainAxisAlignment: MainAxisAlignment.start,
////默认是最大充满、还是根据child显示最小大小
//mainAxisSize: MainAxisSize.max,
////副轴方向，Column的横向、Row为竖向
//crossAxisAlignment :CrossAxisAlignment.center,
class SimpleLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _getCard("1123", Icons.star);
  }

  // init BottomItem
  _getBottomItem(IconData icon, String text) {
    ///充满 Row 横向的布局
    return new Expanded(
      flex: 1,

      ///居中显示
      child: new Center(

        ///横向布局
        child: new Row(

          ///主轴居中,即是横向居中
          mainAxisAlignment: MainAxisAlignment.center,

          ///大小按照最大充满
          mainAxisSize: MainAxisSize.min,

          ///竖向也居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildItem(icon, text),
            _buildGap(size: 50),
          ],
        ),
      ),
    );
  }

  _buildGap({double size = 5.0}) {
    return new Padding(padding: new EdgeInsets.only(left: size));
  }

  _buildText(String text) {
    return new Text(
      text,
      //设置字体样式：颜色灰色，字体大小14.0
      style: new TextStyle(color: Colors.grey, fontSize: 14.0),
      //超过的省略为...显示
      overflow: TextOverflow.ellipsis,
      //最长一行
      maxLines: 1,
    );
  }

  _buildIcon(IconData icon) {
    return new Icon(
      icon,
      size: 16.0,
      color: Colors.grey,
    );
  }

  _buildItem(IconData icon, String text) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_buildIcon(icon), _buildText(text)],
        mainAxisSize: MainAxisSize.min);
  }

  _getCard(String text, IconData icon) {
    return new Container(
      ///卡片包装
      child: new Card(
        ///增加点击效果
          child: new FlatButton(
              onPressed: (){print("点击了哦");},
              child: new Padding(
                padding: new EdgeInsets.only(left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ///文本描述
                    new Container(
                        child: new Text(
                          "这是一点描述",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          ///最长三行，超过 ... 显示
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                        alignment: Alignment.topLeft),
                    new Padding(padding: EdgeInsets.all(10.0)),

                    ///三个平均分配的横向图标文字
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _getBottomItem(Icons.star, "1000"),
                        _getBottomItem(Icons.link, "1000"),
                        _getBottomItem(Icons.subject, "1000"),
                      ],
                    ),
                  ],
                ),
              ))),
    );
    

  }
}
