import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// {@template core.presentation.widgets.customCircularProgressIndicator}
/// A custom circular progress indicator.
/// {@endtemplate}
class CustomCircularProgressIndicator extends StatefulWidget {
  /// {@macro core.presentation.widgets.customCircularProgressIndicator}
  const CustomCircularProgressIndicator({
    super.key,
    this.color,
    this.size,
  });

  /// The optional color for this circular progress indicator.
  ///
  /// It defaults to [ColorScheme.primary] of current context.
  final Color? color;

  /// The optional size of this circular progress indicator.
  /// It defaults to 42.
  final double? size;

  @override
  State<CustomCircularProgressIndicator> createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    )..repeat();
    _rotationAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return RotationTransition(
      turns: _rotationAnimation,
      child: Icon(
        FlutterRemix.loader_5_line,
        size: widget.size ?? 42,
        color: widget.color ??
            Theme.of(
              context,
            ).colorScheme.primary,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
