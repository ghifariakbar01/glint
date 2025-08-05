part of '../../glint.dart';

class _GlintDescendant extends StatefulWidget {
  const _GlintDescendant({
    required this.isLoading,
    required this.child,
    required this.glint,
  });

  final Widget child;
  final bool isLoading;
  final GlintItem glint;

  @override
  State<_GlintDescendant> createState() => _GlintDescendantState();
}

class _GlintDescendantState extends State<_GlintDescendant> {
  Listenable? _glintChanges;
  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    final glint = Glint.of(context)!;
    if (!glint.isSized) {
      return const SizedBox();
    }
    final glintSize = glint.size;
    final gradient = glint.gradient;
    final offsetWithinGlint = glint.getDescendantOffset(
      descendant: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinGlint.dx,
            -offsetWithinGlint.dy,
            glintSize.width,
            glintSize.height,
          ),
        );
      },
      child: widget.glint,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_glintChanges != null) {
      _glintChanges!.removeListener(_onGlintChange);
    }
    _glintChanges = Glint.of(context)?.glintChanges;
    if (_glintChanges != null) {
      _glintChanges!.addListener(_onGlintChange);
    }
  }

  @override
  void dispose() {
    _glintChanges?.removeListener(_onGlintChange);
    super.dispose();
  }

  void _onGlintChange() {
    if (widget.isLoading) {
      setState(() {});
    }
  }
}
