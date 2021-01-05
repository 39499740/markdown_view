/*
 * @Date: 2021-01-04 17:34:16
 * @LastEditors: 郝怿
 * @LastEditTime: 2021-01-05 17:41:37
 * @FilePath: /markdown_view/lib/markdown_view.dart
 */
// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'package:flutter/material.dart';

class MarkdownView extends StatefulWidget {
  final String markdownSource;
  MarkdownView({@required this.markdownSource, Key key}) : super(key: key);
  @override
  _MarkdownViewState createState() => _MarkdownViewState();
}

class _MarkdownViewState extends State<MarkdownView> {
  List<Widget> markdownWidgets = [];

  //拆解传入Markdown字符串
  void _getMarkdownWidgetTree() {
    print(widget.markdownSource.split("\n\n").length);
    print("=================================");
    print(widget.markdownSource.replaceAll("  \n", "\n\n"));
    print("=================================");

    //根据Markdown语法，换行采用双空格+换行或者双换行的方式。所以这里先把双空格+换行，替换成两个连续换行，然后根据连续换行进行解析，生成List
    List<String> markdownTree =
        widget.markdownSource.replaceAll("  \n", "\n\n").split("\n\n");
    //循环每一行进行解析，所以这里需要结合上下文来确定Widget块
    bool isCodeView = false; //是否处于代码块中
    int codeViewType =
        0; //代码块种类，Markdown里可用```包裹代码块，也可在每行前用制表符来表示代码块，这里默认0是```，1是制表符
    bool isList = false; //是否处于列表中
    bool isTable = false; //是否处于表格中

    List<String> cacheList = [];
    for (int i = 0; i < markdownTree.length; i++) {
      String tempStr = markdownTree[i];
      print(tempStr);
      if (!isCodeView) {
        //如果上一行是代码块，那么这边先判断是否存在代码块。如果type是0，判断是否为```结尾；type是1，则判断开头是否为制表符
        if (codeViewType == 0) {
          //```
          if (tempStr.contains(r'```')) {
            //发现了```结尾，将cache转换为代码块Widget加入树
            isCodeView = false;
            markdownWidgets.add(codeViewWidget(cacheList));
            cacheList = [];
          } else {
            //依然处于代码块中，继续向cache写入markdown字符串
            cacheList.add(tempStr);
          }
        } else {
          //制表符

        }
      } else if (isList) {
      } else if (isTable) {
      } else {}
    }
  }

  Widget codeViewWidget(List<String> markdownStrList) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          onPressed: () {
            _getMarkdownWidgetTree();
          },
          child: Text("解析"),
        ),
      ),
    );
  }
}
