import 'package:flutter_mobile/import.dart';

class TabBarViewSliver extends SliverPersistentHeaderDelegate with BaseMixin {
  TabBarViewSliver(
      {this.paddingWidget, required this.tabs, required this.controller});

  final List<Widget> tabs;

  final TabController controller;

  final EdgeInsetsGeometry? paddingWidget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: paddingWidget ?? const EdgeInsets.all(0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: color.grey80,
            border: Border(bottom: BorderSide(color: color.grey60, width: 1))),
        child: TabBar(
          key: PageStorageKey<Type>(TabBar),
          controller: controller,
          isScrollable: true,
          unselectedLabelColor: color.grey40,
          labelColor: color.grey0,
          indicatorColor: color.primary,
          tabs: tabs,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  double maxExtent = 50;
  @override
  double minExtent = 50;
}
