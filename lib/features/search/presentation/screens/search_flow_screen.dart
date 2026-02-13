import 'package:pinterest_clone/core/navigation/app_tab.dart';
import 'package:pinterest_clone/core/navigation/tab_stack_provider.dart';
import 'package:pinterest_clone/core/widgets/search_bar/search_bar_provider.dart';
import 'package:pinterest_clone/features/search/presentation/screens/search_detail_screen.dart';
import 'package:pinterest_clone/features/search/presentation/screens/search_query_screen.dart';
import 'package:pinterest_clone/main_index.dart';

class SearchFlowScreen extends ConsumerStatefulWidget {
  const SearchFlowScreen({super.key});

  @override
  ConsumerState<SearchFlowScreen> createState() => _SearchFlowScreenState();
}

class _SearchFlowScreenState extends ConsumerState<SearchFlowScreen> {
  @override
  Widget build(BuildContext context) {
    final stackState = ref.watch(
      tabStackProvider(AppTab.search).select((state) => state),
    );
    final currentIndex = stackState.currentIndex;
    final screens = stackState.screens;
    return Scaffold(
      body: SafeArea(
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            if (screens[currentIndex] is SearchQueryScreen) {
              final searchBarState = ref.watch(
                searchBarProvider.select((state) => state),
              );
              final searchBarNotifier = ref.read(searchBarProvider.notifier);
              if (searchBarState.isFocused) {
                /*searchBarNotifier.setFocus(false);
                final currentFocus = FocusManager.instance.primaryFocus;

                if (currentFocus != null && currentFocus.hasFocus) {
                  currentFocus.unfocus(); // Hide keyboard
                  // Stop further popping
                }*/
                searchBarNotifier.setFocus(false);
                //FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              } else {
                ref.read(tabStackProvider(AppTab.search).notifier).pop();
              }
            } else if (screens[currentIndex] is SearchDetailScreen) {
              ref.read(tabStackProvider(AppTab.search).notifier).pop();
            }
          },
          child: IndexedStack(index: currentIndex, children: screens),
        ),
      ),
    );
  }
}
