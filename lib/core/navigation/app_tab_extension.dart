import 'package:pinterest_clone/core/constants/app_strings.dart';
import 'package:pinterest_clone/core/navigation/app_tab.dart';

extension AppTabExtension on AppTab {
  String get label {
    switch (this) {
      case AppTab.home:
        return AppStrings.home;
      case AppTab.search:
        return AppStrings.search;
      case AppTab.create:
        return AppStrings.create;
      case AppTab.inbox:
        return AppStrings.create;
      case AppTab.saved:
        return AppStrings.saved;
    }
  }
}
