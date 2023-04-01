part of 'widgets.dart';

class FWidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final List<Widget> actions;
  final bool shouldCenterAppBar;
  final double elevation;

  final Widget title;
  const FWidgetAppBar(
      {super.key,
      required this.actions,
      this.elevation = 0,
      this.shouldCenterAppBar = false,
      required this.leading,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: context.appTheme.scaffoldBackgroundColor,
      leading: leading,
      centerTitle: shouldCenterAppBar,
      title: title,
      actions: [...actions],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
