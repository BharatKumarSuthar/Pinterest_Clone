import 'package:pinterest_clone/core/constants/app_strings.dart';
import 'package:pinterest_clone/core/extensions/date_extension.dart';
import 'package:pinterest_clone/core/widgets/buttons/primary_btn.dart';
import 'package:pinterest_clone/core/widgets/item_picker/custom_date_picker.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/providers/indicator_provider.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/providers/onboarding_provider.dart';
import 'package:pinterest_clone/features/onboarding/presentation/widgets/date_picker_dialog.dart';
import 'package:pinterest_clone/features/onboarding/presentation/widgets/header.dart';
import 'package:pinterest_clone/main_index.dart';

class BirthDatePage extends ConsumerWidget {
  const BirthDatePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var birthDate = ref.watch(
      onboardingProvider.select((state) => state.birthDate),
    );
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          mainAxisSize: .min,
          spacing: 10.h,
          children: [
            Header(
              heading: "Hi Bharat! Enter your birthdate",
              para:
                  "To help keep Pinterest safe, we now require your birthdate. Your birthdate also also helps us provide more personalized recommendations and relevent ads. We won't share this information without your permission and it won't be visible on your profile",
            ),
            _selectedBirthDate(ref, context, birthDate!),
            Text(
              "Use your own age, even if this is a buisness account.",
              style: TextStyle(color: AppColors.gray, fontSize: 12.sp),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: PrimaryBtn(
          btnTxt: AppStrings.next,
          bgColor: AppColors.pinterestRed,
          callback: () {
            ref.read(indicatorProvider.notifier).currentIndex();
          },
        ),
      ),
    );
  }

  GestureDetector _selectedBirthDate(
    WidgetRef ref,
    BuildContext context,
    String birthDate,
  ) {
    return GestureDetector(
      onTap: () {
        String selectedDate = birthDate;
        showDatePickerDialog(
          context: context,
          child: CustomDatePicker(
            onDateChanged: (date) {
              selectedDate = date.format();
            },
          ),
          onCancel: () => context.pop(),
          onOk: () {
            ref.read(onboardingProvider.notifier).setBirthDate(selectedDate);
            context.pop();
          },
        );
      },
      child: Text(
        birthDate,
        style: TextStyle(
          color: AppColors.gray,
          fontSize: 35.sp,
          fontWeight: .w700,
        ),
      ),
    );
  }
}
