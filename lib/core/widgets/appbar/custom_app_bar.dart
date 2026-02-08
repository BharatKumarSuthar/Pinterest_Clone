import 'package:pinterest_clone/main_index.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  const CustomAppBar({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
}
