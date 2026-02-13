import 'package:pinterest_clone/core/widgets/search_bar/search_bar_provider.dart';
import 'package:pinterest_clone/main_index.dart';

class CustomSearchBar extends ConsumerStatefulWidget {
  final double borderRadius;
  final String hintTxt;
  final String initialValue;
  final ValueChanged<String>? onChanged;
  final VoidCallback onCancel;
  const CustomSearchBar({
    required this.onChanged,
    this.borderRadius = 12,
    this.hintTxt = "Search",
    this.initialValue = "",
    required this.onCancel,
    super.key,
  });

  @override
  ConsumerState<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends ConsumerState<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialValue;
    _focusNode.addListener(() {
      ref.read(searchBarProvider.notifier).setFocus(_focusNode.hasFocus);
    });

    _controller.addListener(() {
      ref.read(searchBarProvider.notifier).setText(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchBarProvider);
    // Automatically request focus/unfocus based on provider
    if (state.isFocused && !_focusNode.hasFocus) {
      _focusNode.requestFocus();
    } else if (!state.isFocused && _focusNode.hasFocus) {
      _focusNode.unfocus();
    }
    return Row(
      spacing: 15,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: AppColors.white,
                width: state.isFocused ? 2.0 : 1.0,
              ),
            ),
            child: Row(
              children: [
                if (!state.isFocused && !state.hasText) ...[
                  const Icon(Icons.search, color: AppColors.white),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: TextField(
                    autofocus: true,
                    cursorColor: AppColors.pinterestRed,
                    maxLines: 1,
                    controller: _controller,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: widget.hintTxt,
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: AppColors.grayDim),
                    ),
                    onChanged: (value) {
                      widget.onChanged!(value);
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (state.hasText && state.isFocused) {
                      _controller.clear();
                      ref.read(searchBarProvider.notifier).clear();
                    } else if (state.hasText && !state.isFocused) {
                      _controller.clear();
                      ref.read(searchBarProvider.notifier).clear();
                      ref.read(searchBarProvider.notifier).setFocus(true);
                    } else {
                      debugPrint("Camera tapped");
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: state.hasText
                        ? const Icon(Icons.close, color: AppColors.white)
                        : const Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.white,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: widget.onCancel,
          child: Text(
            "Cancel",
            style: TextStyle(color: AppColors.white, fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
