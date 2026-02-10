import 'package:pinterest_clone/features/onboarding/presentation/riverpod/providers/indicator_provider.dart';
import 'package:pinterest_clone/features/onboarding/presentation/screens/onboarding/birth_date_page.dart';
import 'package:pinterest_clone/features/onboarding/presentation/screens/onboarding/country_page.dart';
import 'package:pinterest_clone/features/onboarding/presentation/screens/onboarding/gender_page.dart';
import 'package:pinterest_clone/features/onboarding/presentation/screens/onboarding/mood_preferences_page.dart';
import 'package:pinterest_clone/main_index.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(indicatorProvider);
    return Scaffold(
      appBar: _appBar(context: context, currentIndex: currentIndex),
      body: _onBoardingScreens[currentIndex],
    );
  }

  AppBar _appBar({required BuildContext context, required int currentIndex}) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: (currentIndex == 0)
          ? IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
            )
          : null,
      title: Row(
        mainAxisSize: .min,
        spacing: 10.w,
        children: List.generate(_onBoardingScreens.length, (index) {
          if (index == currentIndex) {
            return _activeIndex();
          } else if (index < currentIndex) {
            return _inactiveIndex(AppColors.white);
          } else {
            return _inactiveIndex(AppColors.charcolOlive);
          }
        }),
      ),
      centerTitle: true,
    );
  }

  Container _activeIndex() {
    return Container(
      height: 10.r,
      width: 10.r,
      decoration: BoxDecoration(
        shape: .circle,
        border: .all(color: AppColors.white, width: 2.0),
      ),
    );
  }

  Container _inactiveIndex(Color color) {
    return Container(
      height: 7.r,
      width: 7.r,
      decoration: BoxDecoration(color: color, shape: .circle),
    );
  }

  final List<Widget> _onBoardingScreens = const [
    BirthDatePage(),
    GenderPage(),
    CountryPage(),
    MoodPreferencesPage(),
  ];
}
