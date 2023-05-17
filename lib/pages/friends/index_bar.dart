import 'package:flutter/material.dart';
import 'package:welinkapp/const.dart';

class IndexBar extends StatefulWidget {
  final void Function(String str) indexBarCallBack;

  const IndexBar({Key? key, required this.indexBarCallBack}) : super(key: key);

  @override
  IndexBarState createState() => IndexBarState();
}

class IndexBarState extends State<IndexBar> {
  var _currentIndexLetter = '';
  final _indexWords = [];
  Color _backgroundColor = const Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;

  var _showIndicator = false;
  var _indicatorAlignmentY = -1.13;

  String? getIndexLetter(BuildContext context, Offset globalPosition) {
    RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box != null) {
      double y = box.globalToLocal(globalPosition).dy;
      final itemHeight = screenHeight(context) / 2 / _indexWords.length;
      int index = (y ~/ itemHeight).clamp(0, _indexWords.length - 1);
      return _indexWords[index];
    }
    return null;
  }

  @override
  void initState() {
    super.initState();

    _indexWords.add('🔍');
    for (int i = 0; i < 26; i++) {
      var string = String.fromCharCode(i + 65);
      _indexWords.add(string);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> indexWidgets = [];
    for (int i = 0; i < _indexWords.length; i++) {
      indexWidgets.add(Expanded(
        child: Text(_indexWords[i],
            style: TextStyle(
              fontSize: 10,
              color: _textColor,
            )),
      ));
    }

    return Positioned(
        top: screenHeight(context) / 8,
        right: 0,
        width: 100,
        height: screenHeight(context) / 2,
        child: Row(
          children: [
            Container(
              alignment: Alignment(0, _indicatorAlignmentY),
              width: 70,
              child: !_showIndicator
                  ? null
                  : Stack(
                      alignment: const Alignment(-0.3, 0),
                      children: [
                        const Image(
                          image: AssetImage('assets/images/气泡.png'),
                          width: 60,
                        ),
                        Text(
                          _currentIndexLetter,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 35),
                        )
                      ],
                    ),
            ),
            GestureDetector(
              child: Container(
                width: 30,
                color: _backgroundColor,
                child: Column(
                  children: indexWidgets,
                ),
              ),
              onVerticalDragDown: (DragDownDetails details) {
                if (_currentIndexLetter !=
                    getIndexLetter(context, details.globalPosition)!) {
                  _currentIndexLetter =
                      getIndexLetter(context, details.globalPosition)!;
                  widget.indexBarCallBack(_currentIndexLetter);
                }
                _backgroundColor = const Color.fromRGBO(1, 1, 1, 0.5);
                _textColor = Colors.white;
                _showIndicator = true;
                setState(() {});
              },
              onVerticalDragUpdate: (DragUpdateDetails details) {
                if (_currentIndexLetter !=
                    getIndexLetter(context, details.globalPosition)!) {
                  _currentIndexLetter =
                      getIndexLetter(context, details.globalPosition)!;
                  widget.indexBarCallBack(_currentIndexLetter);
                  _indicatorAlignmentY = (1.13 + 1.13) /
                          (_indexWords.length.toDouble() - 1) *
                          _indexWords.indexOf(_currentIndexLetter) -
                      1.13;
                  setState(() {});
                }
              },
              onVerticalDragEnd: (DragEndDetails details) {
                _backgroundColor = const Color.fromRGBO(1, 1, 1, 0.0);
                _textColor = Colors.black;
                _showIndicator = false;
                setState(() {});
              },
            ),
          ],
        ));
  }
}
