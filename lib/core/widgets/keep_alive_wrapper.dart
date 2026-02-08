import 'package:pinterest_clone/main_index.dart';

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;
  const KeepAliveWrapper({required this.child, super.key});

  @override
  State<StatefulWidget> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
