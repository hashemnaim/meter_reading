import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class NavigationTabController extends GetxController {
  PersistentTabController? tabController;
  RxInt selectedPageIndex = 0.obs;

  @override
  void onInit() {
    tabController =
        PersistentTabController(initialIndex: selectedPageIndex.value);

    super.onInit();
  }
}
