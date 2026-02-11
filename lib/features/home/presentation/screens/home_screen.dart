import 'package:pinterest_clone/features/home/presentation/riverpod/providers/home_screen_provider.dart';
import 'package:pinterest_clone/main_index.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNotifier = ref.watch(homeScreenProvider.notifier);
    final state = ref.watch(homeScreenProvider.select((state) => state));
    final currentIndex = state.currentIndex;
    final screens = state.screens;
    return PopScope(
      canPop: screens.length <= 1,
      onPopInvokedWithResult: (didPop, result) {
        if (screens.length > 1) {
          homeNotifier.requestPop();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: IndexedStack(index: currentIndex, children: screens),
        ),
      ),
    );
  }
}
