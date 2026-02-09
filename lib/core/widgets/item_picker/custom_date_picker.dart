import 'package:pinterest_clone/core/widgets/item_picker/string_picker.dart';
import 'package:pinterest_clone/main_index.dart';

class CustomDatePicker extends StatefulWidget {
  final ValueChanged<DateTime>? onDateChanged;

  const CustomDatePicker({super.key, this.onDateChanged});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  int selectedDay = 7;
  int selectedMonth = 2;
  int selectedYear = 2026;

  List<String> get months => const [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  List<int> get years =>
      List.generate(100, (index) => 1950 + index); // 1950 - 2049

  List<int> get days {
    int totalDays = DateUtils.getDaysInMonth(selectedYear, selectedMonth);
    return List.generate(totalDays, (index) => index + 1);
  }

  void _notifyDate() {
    widget.onDateChanged?.call(
      DateTime(selectedYear, selectedMonth, selectedDay),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        /// MONTH
        Expanded(
          child: StringPicker(
            items: months,
            initialIndex: selectedMonth - 1,
            onChanged: (value) {
              setState(() {
                selectedMonth = months.indexOf(value) + 1;

                // Fix day overflow (e.g. Feb 31 → Feb 28)
                int maxDay = DateUtils.getDaysInMonth(
                  selectedYear,
                  selectedMonth,
                );
                if (selectedDay > maxDay) {
                  selectedDay = maxDay;
                }
              });
              _notifyDate();
            },
          ),
        ),

        /// DAY
        Expanded(
          child: StringPicker(
            items: days.map((e) => e.toString()).toList(),
            initialIndex: selectedDay - 1,
            onChanged: (value) {
              selectedDay = int.parse(value);
              _notifyDate();
            },
          ),
        ),

        /// YEAR
        Expanded(
          child: StringPicker(
            items: years.map((e) => e.toString()).toList(),
            initialIndex: years.indexOf(selectedYear),
            onChanged: (value) {
              setState(() {
                selectedYear = int.parse(value);

                int maxDay = DateUtils.getDaysInMonth(
                  selectedYear,
                  selectedMonth,
                );
                if (selectedDay > maxDay) {
                  selectedDay = maxDay;
                }
              });
              _notifyDate();
            },
          ),
        ),
      ],
    );
  }
}
