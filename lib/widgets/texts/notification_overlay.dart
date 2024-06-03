import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

enum FlushBarStatus { isActive, dismissed }

class FlushBar extends StatefulWidget {
  final Widget child;
  final Duration? duration;

  FlushBar({
    super.key,
    required this.child,
    this.duration,
  });

  @override
  State<FlushBar> createState() => _FlushBarState();

  late final OverlayEntry? _entry;

  void show(BuildContext context) {
    _entry = OverlayEntry(
      builder: (ctx) {
        return this;
      },
      maintainState: false,
      opaque: false,
    );

    Overlay.of(context).insert(_entry!);
  }

  void dismiss() {
    _entry?.remove();
  }
}

class _FlushBarState extends State<FlushBar> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  final GlobalKey _key = GlobalKey();

  double? _notificationHeight;

  @override
  void setState(VoidCallback fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween<double>(
      begin: -1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.fastOutSlowIn,
      ),
    );

    Future.delayed(Duration.zero, () {
      if (_notificationHeight == null) {
        setState(() {
          _notificationHeight = _key.currentContext!.size!.height;
        });
      }
    });

    _animationController!.forward().whenCompleteOrCancel(() {
      Future.delayed(
        const Duration(seconds: 4, milliseconds: 500),
        (() {
          if (mounted) {
            _animationController?.reverse().whenCompleteOrCancel(() {
              widget._entry?.remove();
            });
          }
        }),
      );
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (ctx, child) {
        return Positioned(
          top: _notificationHeight == null
              ? _animation!.value * 400
              : (_animation!.value * (_notificationHeight!)) + 24,
          left: 8,
          right: 8,
          child: Material(
            key: _key,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [ThemeShadow.flushShadow],
              ),
              margin: const EdgeInsets.only(
                top: ThemeSize.paddingLarge,
                left: ThemeSize.paddingMedium,
                right: ThemeSize.paddingMedium,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
