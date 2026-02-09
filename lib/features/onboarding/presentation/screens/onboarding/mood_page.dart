import 'package:pinterest_clone/features/onboarding/presentation/riverpod/providers/indicator_provider.dart';
import 'package:pinterest_clone/main_index.dart';

class MoodPage extends ConsumerWidget {
  const MoodPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(indicatorProvider);
    return Column();
  }
}
