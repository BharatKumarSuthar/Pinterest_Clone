import 'package:flutter/services.dart';
import 'package:pinterest_clone/core/navigation/app_tab.dart';
import 'package:pinterest_clone/core/navigation/app_tab_extension.dart';
import 'package:pinterest_clone/core/navigation/tab_stack_provider.dart';
import 'package:pinterest_clone/core/widgets/app_modal/app_modal.dart';
import 'package:pinterest_clone/features/create/presentation/widgets/create_bottom_modal.dart';
import 'package:pinterest_clone/features/home/presentation/screens/home_screen.dart';
import 'package:pinterest_clone/features/search/presentation/screens/search_flow_screen.dart';
import 'package:pinterest_clone/main_index.dart';
import 'package:pinterest_clone/navigation/tab_provider.dart';

class MainTabsScreen extends ConsumerWidget {
  const MainTabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabState = ref.watch(tabProvider.select((state) => state));
    final currentTab = tabState.currentTab;
    final previousTab = tabState.previousTab;
    return PopScope(
      canPop: (currentTab == 0 && _screens(currentTab, ref) == 1)
          ? true
          : false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (currentTab != 0 && _screens(currentTab, ref) == 1) {
          print('ENTERED');
          ref.read(tabProvider.notifier).setTab(previousTab);
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.charcolBrown,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          body: screens[currentTab],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent, // remove ripple
              highlightColor: Colors.transparent, // remove highlight
            ),
            child: BottomNavigationBar(
              type: .fixed,
              backgroundColor: AppColors.charcolBrown,
              selectedFontSize: 13,
              unselectedFontSize: 13,
              selectedLabelStyle: TextStyle(
                color: AppColors.white,
                fontWeight: .w500,
              ),
              unselectedLabelStyle: TextStyle(
                color: AppColors.white,
                fontWeight: .w500,
              ),
              unselectedItemColor: AppColors.white,
              selectedItemColor: AppColors.white,
              currentIndex: currentTab,
              onTap: (index) {
                if (index == 2) {
                  AppModal.showAppModal(
                    context: context,
                    child: CreateBottomModal(),
                  );
                } else if (index != currentTab) {
                  ref.read(tabProvider.notifier).setTab(index);
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: AppTab.home.icon,
                  activeIcon: AppTab.home.activeIcon,
                  label: AppTab.home.label,
                ),
                BottomNavigationBarItem(
                  icon: AppTab.search.icon,
                  activeIcon: AppTab.search.activeIcon,
                  label: AppTab.search.label,
                ),
                BottomNavigationBarItem(
                  icon: AppTab.create.icon,
                  activeIcon: AppTab.create.activeIcon,
                  label: AppTab.create.label,
                ),
                BottomNavigationBarItem(
                  icon: AppTab.inbox.icon,
                  activeIcon: AppTab.inbox.activeIcon,
                  label: AppTab.inbox.label,
                ),
                BottomNavigationBarItem(
                  icon: AppTab.saved.icon,
                  activeIcon: AppTab.saved.activeIcon,
                  label: AppTab.saved.label,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int _screens(int index, WidgetRef ref) {
    return ref.watch(
      tabStackProvider(
        AppTab.values[index],
      ).select((state) => state.screens.length),
    );
  }

  final List<Widget> screens = const [
    HomeScreen(),
    SearchFlowScreen(),
    SizedBox(),
    SizedBox(
      child: Center(
        child: Text(
          "Inbox",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 40.0,
            fontWeight: .w700,
          ),
        ),
      ),
    ),
    SizedBox(
      child: Center(
        child: Text(
          "Saved",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 40.0,
            fontWeight: .w700,
          ),
        ),
      ),
    ),
  ];
}
