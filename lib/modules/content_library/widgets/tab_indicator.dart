import 'package:flutter/painting.dart';

class TabIndicator extends Decoration {
  final BoxPainter _painter;

  TabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Rect rect = Rect.fromPoints(
      offset + Offset(0, cfg.size!.height - radius - 5 + 2.0),
      offset + Offset(cfg.size!.width, cfg.size!.height - 5),
    );

    final RRect roundedRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(radius),
    );

    canvas.drawRRect(roundedRect, _paint);
  }
}
