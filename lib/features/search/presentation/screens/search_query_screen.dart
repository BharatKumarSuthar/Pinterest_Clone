import 'package:pinterest_clone/core/constants/app_strings.dart';
import 'package:pinterest_clone/core/navigation/app_tab.dart';
import 'package:pinterest_clone/core/navigation/tab_stack_provider.dart';
import 'package:pinterest_clone/core/widgets/search_bar/custom_search_bar.dart';
import 'package:pinterest_clone/features/search/presentation/riverpod/providers/search_query_provider.dart';
import 'package:pinterest_clone/features/search/presentation/screens/search_detail_screen.dart';
import 'package:pinterest_clone/main_index.dart';

class SearchQueryScreen extends ConsumerWidget {
  final String searchValue;
  const SearchQueryScreen({this.searchValue = "", super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchNotifier = ref.read(searchQueryProvider.notifier);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomSearchBar(
            initialValue: searchValue,
            hintTxt: AppStrings.searchIdeas,
            onCancel: () {
              ref.read(tabStackProvider(AppTab.search).notifier).pop();
            },
            onChanged: (query) {
              searchNotifier.search(query);
            },
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  ref.read(tabStackProvider(AppTab.search).notifier).pop();
                  ref
                      .read(tabStackProvider(AppTab.search).notifier)
                      .push(
                        SearchDetailScreen(
                          searchTxt: ref.watch(searchQueryProvider)[index].item,
                        ),
                      );
                },
                child: Text(
                  ref.watch(searchQueryProvider)[index].item,
                  style: TextStyle(
                    color: Colors.primaries[index % Colors.primaries.length],
                    fontSize: 24.sp,
                    fontWeight: .w700,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: ref.watch(searchQueryProvider).length,
          ),
        ),
      ],
    );
  }
}
