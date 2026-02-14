import 'package:pinterest_clone/core/constants/app_strings.dart';
import 'package:pinterest_clone/core/services/shared_pref_service.dart';
import 'package:pinterest_clone/core/widgets/buttons/primary_btn.dart';
import 'package:pinterest_clone/core/widgets/keep_alive_wrapper.dart';
import 'package:pinterest_clone/features/onboarding/domain/entities/mood_preference_entity.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/notifiers/image_selection_notifier.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/providers/mood_preferences_provider.dart';
import 'package:pinterest_clone/features/onboarding/presentation/riverpod/providers/onboarding_provider.dart';
import 'package:pinterest_clone/features/onboarding/presentation/widgets/custom_sliver_grid_view.dart';
import 'package:pinterest_clone/features/onboarding/presentation/widgets/header.dart';
import 'package:pinterest_clone/features/onboarding/presentation/widgets/mood_preference_card.dart';
import 'package:pinterest_clone/main_index.dart';

class MoodPreferencesPage extends ConsumerStatefulWidget {
  const MoodPreferencesPage({super.key});
  @override
  ConsumerState<MoodPreferencesPage> createState() =>
      _MoodPreferencesPageState();
}

class _MoodPreferencesPageState extends ConsumerState<MoodPreferencesPage> {
  @override
  Widget build(BuildContext context) {
    final moodPrefList = ref.watch(moodListProvider);
    final selectedImagesList = ref.watch(imageSelectionProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: .all(20.r),
            sliver: SliverToBoxAdapter(
              child: Header(
                heading: "What's are you in the mood to do?",
                para: "Pick 3 or more to curate your experience",
              ),
            ),
          ),
          SliverPadding(
            padding: .only(left: 8.r, right: 8.r, top: 20.h),
            sliver: CustomSliverGridView(
              items: List.generate(moodPrefList.length, (index) {
                return KeepAliveWrapper(
                  child: MoodPreferenceCard(
                    index: index,
                    imageUrl: moodPrefList[index].imageUrl,
                    title: moodPrefList[index].title,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: PrimaryBtn(
          bgColor: _shouldAllowNext(selectedImagesList.length)
              ? AppColors.pinterestRed
              : AppColors.charcolBrown,
          btnTxt: AppStrings.next,
          txtColor: _shouldAllowNext(selectedImagesList.length)
              ? AppColors.white
              : AppColors.grayDim,
          callback: () async {
            if (_shouldAllowNext(selectedImagesList.length)) {
              _setPreferences(ref, selectedImagesList, moodPrefList);
              await SharedPrefService.setBool(AppStrings.isOnboarded, true);
              if (!mounted) return;
              context.go(AppRouterPath.tabs);
            }
          },
        ),
      ),
    );
  }

  bool _shouldAllowNext(int length) => length > 2;

  void _setPreferences(
    WidgetRef ref,
    Set<int> selectedImages,
    List<MoodPreferenceEntity> moodList,
  ) {
    final preferences = selectedImages
        .map((index) => moodList[index].title)
        .toList();
    ref.read(onboardingProvider.notifier).setMoodPreference(preferences);
  }
}
