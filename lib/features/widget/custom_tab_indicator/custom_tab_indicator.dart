import 'package:flutter/cupertino.dart';

enum CustomTabIndicatorSize {
  tiny,
  normal,
  fixed,
  full,
}
enum CustomTabIndicatorGravity {
  start,
  center,
  end,
}

class CustomTabIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final double fixedWidth;
  final CustomTabIndicatorGravity fixedGravity;
  final CustomTabIndicatorSize indicatorSize;

  const CustomTabIndicator(
      {@required this.indicatorHeight,
        @required this.indicatorColor,
        @required this.indicatorSize,
        this.fixedWidth,
        this.fixedGravity});

  @override
  _CustomTabPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomTabPainter(this, onChanged);
  }
}

class _CustomTabPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomTabPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    Rect rect;
    if (decoration.indicatorSize == CustomTabIndicatorSize.full) {
      rect = Offset(offset.dx,
          (configuration.size.height - decoration.indicatorHeight ?? 3)) &
      Size(configuration.size.width, decoration.indicatorHeight ?? 3);
    } else if (decoration.indicatorSize == CustomTabIndicatorSize.normal) {
      rect = Offset(offset.dx + 6,
          (configuration.size.height - decoration.indicatorHeight ?? 3)) &
      Size(configuration.size.width - 12, decoration.indicatorHeight ?? 3);
    } else if (decoration.indicatorSize == CustomTabIndicatorSize.tiny) {
      rect = Offset(offset.dx + configuration.size.width / 2 - 8,
          (configuration.size.height - decoration.indicatorHeight ?? 3)) &
      Size(16, decoration.indicatorHeight ?? 3);
    } else if (decoration.indicatorSize == CustomTabIndicatorSize.fixed) {
      if (decoration.fixedGravity == CustomTabIndicatorGravity.start) {
        rect = Offset(offset.dx,
            (configuration.size.height - decoration.indicatorHeight ?? 3)) &
        Size(decoration.fixedWidth ?? 25, decoration.indicatorHeight ?? 3);
      } else if (decoration.fixedGravity == CustomTabIndicatorGravity.end) {
        rect = Offset(offset.dx + configuration.size.width - 8,
            (configuration.size.height - decoration.indicatorHeight ?? 3)) &
        Size(decoration.fixedWidth ?? 25, decoration.indicatorHeight ?? 3);
      } else {
        rect = Offset(
            offset.dx +
                configuration.size.width / 2 -
                (decoration.fixedWidth ?? 25) / 2,
            (configuration.size.height - decoration.indicatorHeight ?? 3)) &
        Size(decoration.fixedWidth ?? 25, decoration.indicatorHeight ?? 3);
      }
    }

    final Paint paint = Paint();
    paint.color = decoration.indicatorColor ?? Color(0xff1967d2);
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndCorners(rect,
            topRight: Radius.circular(8),
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8)),
        paint);
  }
}