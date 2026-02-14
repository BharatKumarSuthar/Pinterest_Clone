import 'package:pinterest_clone/core/constants/app_strings.dart';
import 'package:pinterest_clone/core/navigation/app_tab.dart';
import 'package:pinterest_clone/main_index.dart';

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
        return AppStrings.inbox;
      case AppTab.saved:
        return AppStrings.saved;
    }
  }

  SvgPicture get icon {
    switch (this) {
      case AppTab.home:
        return SvgPicture.asset(AppIcons.home, width: 24.r, height: 24.r);
      case AppTab.search:
        return SvgPicture.asset(AppIcons.search, width: 24.r, height: 24.r);
      case AppTab.create:
        return SvgPicture.asset(AppIcons.create, width: 24.r, height: 24.r);
      case AppTab.inbox:
        return SvgPicture.asset(AppIcons.inbox, width: 24.r, height: 24.r);
      case AppTab.saved:
        return SvgPicture.asset(AppIcons.saved, width: 24.r, height: 24.r);
    }
  }

  SvgPicture get activeIcon {
    switch (this) {
      case AppTab.home:
        return SvgPicture.asset(AppIcons.homeFilled, width: 24.r, height: 24.r);
      case AppTab.search:
        return SvgPicture.asset(
          AppIcons.searchFilled,
          width: 24.r,
          height: 24.r,
        );
      case AppTab.create:
        return SvgPicture.asset(AppIcons.create, width: 24.r, height: 24.r);
      case AppTab.inbox:
        return SvgPicture.asset(
          AppIcons.inboxFilled,
          width: 24.r,
          height: 24.r,
        );
      case AppTab.saved:
        return SvgPicture.asset(
          AppIcons.savedFilled,
          width: 24.r,
          height: 24.r,
        );
    }
  }
}
