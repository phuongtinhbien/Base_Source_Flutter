

import 'package:flutter/cupertino.dart';

class _IndicatorPainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _IndicatorPainter(Color color, this.radius)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final rect = new Rect.fromCenter(center: offset + Offset(cfg.size.width / 2 , cfg.size.height - 1 ), width: 32, height: 2);
    final rrect = new RRect.fromRectAndRadius(rect,Radius.circular(10.0));
    canvas.drawRRect(rrect, _paint);
//    canvas.drawRect(rect, _paint);
  }
}

class CustomTabbarIndicator extends Decoration {
  final BoxPainter _painter;

  CustomTabbarIndicator({@required Color color, @required double radius})
      : _painter = _IndicatorPainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}