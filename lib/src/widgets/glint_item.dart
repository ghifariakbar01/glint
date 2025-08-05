part of '../../glint.dart';

class GlintItem extends StatelessWidget {
  const GlintItem({
    super.key,

    /// The loading item displayed defaults to 1
    /// Modify this to have multiple loading items displayed
    /// either vertically or horizontally
    this.itemCount = 1,
    this.spacing = 5,

    /// The axis direction which the widgets are displayed
    this.direction = Axis.vertical,

    /// Required radius size for glint item
    /// It is recommended to follow the child's border radius
    /// To create seamless loading experience
    required this.radius,
    this.color = Colors.white,
    this.height,
    this.width,
  });

  final Axis direction;
  final double spacing;
  final int itemCount;

  final double radius;
  final Color color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    _LoadItem loadItem() => _LoadItem(
          radius: radius,
          color: color,
          height: height,
          width: width,
        );
    if (itemCount == 1) {
      return loadItem();
    }
    return switch (direction) {
      Axis.vertical => Column(
          spacing: spacing,
          children: List.generate(itemCount, (_) => loadItem()),
        ),
      Axis.horizontal => Row(
          spacing: spacing,
          children: List.generate(itemCount, (_) => loadItem()),
        )
    };
  }
}

class _LoadItem extends StatelessWidget {
  const _LoadItem({
    required this.radius,
    required this.color,
    this.height,
    this.width,
  });

  final double radius;
  final Color color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      height: height,
      width: width,
    );
  }
}
