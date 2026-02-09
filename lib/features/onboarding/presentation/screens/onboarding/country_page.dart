import 'package:pinterest_clone/core/constants/app_strings.dart';
import 'package:pinterest_clone/core/widgets/buttons/primary_btn.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/providers/indicator_provider.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/providers/onboarding_provider.dart';
import 'package:pinterest_clone/features/onboarding/presentation/widgets/header.dart';
import 'package:pinterest_clone/main_index.dart';

class CountryPage extends ConsumerWidget {
  const CountryPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final country = ref.watch(
      onboardingProvider.select((state) => state.country),
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          mainAxisSize: .min,
          spacing: 10.h,
          children: [
            Header(
              heading: "What's your country or region?",
              para:
                  "This helps us find more relevent content.We won't show it on your profile.",
            ),
            const SizedBox(height: 40.0),
            GestureDetector(
              onTap: () => context.go(AppRouterPath.country),
              child: Row(
                mainAxisSize: .max,
                children: [
                  Expanded(
                    child: Text(
                      country!,
                      style: TextStyle(color: AppColors.white, fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Icon(Icons.arrow_forward_ios, color: AppColors.white),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: PrimaryBtn(
          btnTxt: AppStrings.next,
          callback: () {
            ref.read(indicatorProvider.notifier).currentIndex();
          },
        ),
      ),
    );
  }
}
