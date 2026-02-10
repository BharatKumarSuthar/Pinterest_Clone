import 'package:pinterest_clone/main_index.dart';

class CustomSliverGridView extends StatelessWidget {
  final List<Widget> items;
  const CustomSliverGridView({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        int startIndex = index * 3;
        int remainingItems = items.length - startIndex;
        int count = remainingItems >= 3 ? 3 : remainingItems;

        // Create row items
        List<Widget> rowItems = List.generate(count, (rowIndex) {
          return Expanded(child: items[startIndex + rowIndex]);
        });
        if (count < 3) {
          for (int i = 0; i < 3 - count; i++) {
            rowItems.add(const Expanded(child: SizedBox()));
          }
        }

        return Row(
          spacing: 8.r,
          crossAxisAlignment: .start,
          mainAxisSize: .max,
          children: rowItems,
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 8.r),
      itemCount: _totalLength,
    );
  }

  int get _totalLength {
    int quotient = (items.length / 3).toInt();
    int remainder = items.length % 3;
    return remainder > 0 ? quotient + 1 : quotient;
  }
}
