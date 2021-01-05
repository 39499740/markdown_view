/*
 * @Date: 2021-01-04 17:34:16
 * @LastEditors: 郝怿
 * @LastEditTime: 2021-01-05 16:04:21
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
  void _getMarkdownWidgetTree() {
    List<String> markdownTree =
        widget.markdownSource.replaceAll("  \n", "\n\n").split("\n\n");
    for (int i = 0; i < markdownTree.length; i++) {
      print(markdownTree[i]);
    }
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
