import 'package:pinterest_clone/core/constants/app_strings.dart';
import 'package:pinterest_clone/core/widgets/buttons/primary_btn.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/providers/indicator_provider.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/providers/onboarding_provider.dart';
import 'package:pinterest_clone/features/onboarding/presentation/widgets/header.dart';
import 'package:pinterest_clone/main_index.dart';

class GenderPage extends ConsumerWidget {
  const GenderPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Column(
        mainAxisSize: .min,
        spacing: 40.h,
        children: [
          Header(
            heading: "What's your gender?",
            para:
                "This helps us find you more relevent content.We won't show it on your profile.",
          ),
          Column(
            mainAxisSize: .min,
            spacing: 10.h,
            children: List.generate(genders.length, (index) {
              return SizedBox(
                width: double.maxFinite,
                child: PrimaryBtn(
                  bgColor: AppColors.charcolBrown,
                  btnTxt: genders[index],
                  callback: () {
                    ref
                        .read(onboardingProvider.notifier)
                        .setGender(genders[index]);
                    ref.read(indicatorProvider.notifier).nextStep();
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  final List<String> genders = const [
    AppStrings.female,
    AppStrings.male,
    AppStrings.specifyAnother,
  ];
}
