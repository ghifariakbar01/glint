import 'package:flutter/material.dart';

part 'src/widgets/glint_descendant.dart';
part 'src/widgets/glint_item.dart';

class Glint extends StatefulWidget {
  final bool isLoading;
  final Widget child;
  final GlintItem glintItem;
  final LinearGradient linearGradient;

  const Glint({
    super.key,
    required this.isLoading,
    required this.child,
    required this.glintItem,
    this.linearGradient = const LinearGradient(
      colors: [
        Color(0xFFEBEBF4),
        Color(0xFFF4F4F4),
        Color(0xFFEBEBF4),
      ],
      stops: [0.1, 0.3, 0.4],
      begin: Alignment(-1.0, -0.3),
      end: Alignment(1.0, 0.3),
      tileMode: TileMode.clamp,
    ),
  });

  static GlintState? of(BuildContext context) {
    return context.findAncestorStateOfType<GlintState>();
  }

  @override
  GlintState createState() => GlintState();
}

class GlintState extends State<Glint> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return _GlintDescendant(
      isLoading: widget.isLoading,
      glint: widget.glintItem,
      child: widget.child,
    );
  }

  late AnimationController _glintController;

  @override
  void initState() {
    super.initState();

    _glintController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _glintController.dispose();
    super.dispose();
  }

  LinearGradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        transform: _SlidingGradientTransform(
          slidePercent: _glintController.value,
        ),
      );

  bool get isSized =>
      (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final glintBox = context.findRenderObject() as RenderBox?;
    return descendant.localToGlobal(offset, ancestor: glintBox);
  }

  Listenable get glintChanges => _glintController;
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({required this.slidePercent});

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
