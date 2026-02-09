import 'package:pinterest_clone/features/onboarding/presentation/riverpod/providers/indicator_provider.dart';
import 'package:pinterest_clone/features/onboarding/presentation/widgets/header.dart';
import 'package:pinterest_clone/main_index.dart';

class GenderPage extends ConsumerWidget {
  const GenderPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(indicatorProvider);
    return Column(
      children: [
        Header(
          heading: "What's your gender?",
          para:
              "This helps us find you more relevent content.We won't show it on your profile.",
        ),
      ],
    );
  }
}
