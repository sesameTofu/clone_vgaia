import 'package:flutter_mobile/base/keep_alive_wrapper.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/asset/asset_page.dart';
import 'package:flutter_mobile/pages/expand/expand_page.dart';
import 'package:flutter_mobile/pages/main/main_controller.dart';
import 'package:flutter_mobile/pages/market/market_page.dart';
import 'package:flutter_mobile/pages/order/order_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with BaseMixin {
  late MainController _mainController;

  List<Widget> get pages => <Widget>[
        KeepAliveWrapper(child: Container()),
        KeepAliveWrapper(child: MarketPage()),
        KeepAliveWrapper(child: OrderPage()),
        KeepAliveWrapper(child: AssetPage()),
        KeepAliveWrapper(child: ExpandPage())
      ];

  List<TabItem> get _tabItem => <TabItem>[
        TabItem(
            icon: AppPath.category, lable: LocaleKeys.watch_list.tr, index: 0),
        TabItem(icon: AppPath.overview, lable: LocaleKeys.market.tr, index: 1),
        TabItem(
            icon: AppPath.placeOrder, lable: LocaleKeys.trading.tr, index: 2),
        TabItem(icon: AppPath.category, lable: LocaleKeys.account.tr, index: 3),
        TabItem(icon: AppPath.expand, lable: LocaleKeys.functions.tr, index: 4)
      ];

  @override
  void initState() {
    super.initState();

    _mainController = Get.put<MainController>(MainController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: PageView(
                controller: _mainController.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: pages)),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: _mainController.index.value,
            selectedItemColor: color.green50,
            unselectedItemColor: color.grey30,
            backgroundColor: color.background3,
            selectedLabelStyle:
                TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
            unselectedLabelStyle:
                TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400),
            type: BottomNavigationBarType.fixed,
            onTap: (int selectedIndex) {
              _mainController.pageController.jumpToPage(selectedIndex);
              _mainController.index.value = selectedIndex;
            },
            items: _tabItem
                .map<BottomNavigationBarItem>((TabItem e) => _buildItem(e))
                .toList())));
  }

  BottomNavigationBarItem _buildItem(TabItem item) {
    return BottomNavigationBarItem(
        icon: Image.asset(item.icon,
            color: _mainController.index.value == item.index
                ? color.green50
                : color.grey30,
            height: 32,
            width: 32),
        label: item.lable);
  }

  @override
  void dispose() {
    _mainController.dispose();
    super.dispose();
  }
}

class TabItem {
  TabItem({required this.icon, required this.lable, required this.index});

  final int index;
  final String icon;
  final String lable;
}
