import 'package:pinterest_clone/main_index.dart';

class StringPicker extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String>? onChanged;
  final int initialIndex;

  const StringPicker({
    super.key,
    required this.items,
    this.onChanged,
    this.initialIndex = 0,
  });

  @override
  State<StringPicker> createState() => _StringPickerState();
}

class _StringPickerState extends State<StringPicker> {
  late FixedExtentScrollController _controller;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
    _controller = FixedExtentScrollController(initialItem: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    const double itemHeight = 60;

    return SizedBox(
      height: itemHeight * 3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListWheelScrollView.useDelegate(
            controller: _controller,
            itemExtent: itemHeight,
            diameterRatio: 100,
            perspective: 0.001,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
              widget.onChanged?.call(widget.items[index]);
            },
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: widget.items.length,
              builder: (context, index) {
                final isSelected = index == selectedIndex;

                return Center(
                  child: Text(
                    widget.items[index],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: .w400,
                      color: isSelected
                          ? AppColors.black
                          : AppColors.charcolBrown.withValues(alpha: .75),
                    ),
                  ),
                );
              },
            ),
          ),

          /// Highlight Center Lines
          IgnorePointer(
            child: Container(
              height: itemHeight,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.red, width: 2),
                  bottom: BorderSide(color: Colors.red, width: 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
