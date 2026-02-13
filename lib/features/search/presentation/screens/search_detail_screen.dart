import 'package:pinterest_clone/core/navigation/app_tab.dart';
import 'package:pinterest_clone/core/navigation/tab_stack_provider.dart';
import 'package:pinterest_clone/features/search/presentation/screens/search_query_screen.dart';
import 'package:pinterest_clone/main_index.dart';

class SearchDetailScreen extends ConsumerWidget {
  final String searchTxt;
  const SearchDetailScreen({required this.searchTxt, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _appBar(context: context, ref: ref),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 150.0,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8.0),
            itemCount: 20,
          ),
        ),
      ],
    );
  }

  Widget _appBar({required BuildContext context, required WidgetRef ref}) {
    return Padding(
      padding: const .only(top: 8.0),
      child: Column(
        mainAxisSize: .min,
        children: [
          Padding(
            padding: const .symmetric(horizontal: 15.0),
            child: Row(
              mainAxisSize: .max,
              spacing: 10.0,
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(tabStackProvider(AppTab.search).notifier).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(tabStackProvider(AppTab.search).notifier)
                          .push(SearchQueryScreen(searchValue: searchTxt));
                    },
                    child: Container(
                      padding: .all(12.0),
                      alignment: .centerLeft,
                      decoration: BoxDecoration(
                        border: .all(color: AppColors.white, width: 1.0),
                        borderRadius: .circular(12.r),
                      ),
                      child: Text(
                        maxLines: 1,
                        searchTxt,
                        style: TextStyle(
                          overflow: .clip,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Icon(Icons.menu, color: AppColors.white, size: 20.0),
              ],
            ),
          ),
          Padding(
            padding: const .symmetric(vertical: 12.0),
            child: SizedBox(
              height: 50.0,
              child: ListView.separated(
                scrollDirection: .horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length],
                      borderRadius: .circular(8.r),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 10.0),
                itemCount: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
