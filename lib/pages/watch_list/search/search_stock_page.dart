import 'package:flutter/services.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_page.dart';
import 'package:flutter_mobile/utils/text_formatter.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'search_page_controller.dart';

class SearchStockPage extends BaseScreen<SearchStockController> {
  SearchStockPage({Key? key, this.categoryId}) : super(key: key);
  final num? categoryId;

  @override
  Widget builder() {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: color.background1,
          appBar: _buildAppBar,
          body: buildData,
        ));
  }

  PreferredSize get _buildAppBar => PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 100.0),
        child: AppBarCustom(
            titleAppBar: LocaleKeys.search_stock_code.tr,
            widgetBottom: PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _buildInputSearch,
                      SizedBox(height: 12),
                      Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1, color: color.grey80),
                            ),
                            color: color.grey100,
                          ),
                          child: Column(children: <Widget>[
                            SizedBox(height: 10),
                            buildHintInfo,
                            SizedBox(height: 8),
                          ]))
                    ]))),
      );

  Widget get _buildInputSearch => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: 32,
          child: TextFormField(
              autofocus: true,
              controller: controller.searchController,
              onChanged: controller.searchKeyWord,
              textInputAction: TextInputAction.search,
              style: TextStyle(color: color.grey0),
              // onFieldSubmitted: controller.searchKeyWord,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintStyle: textStyle.regular(size: 12, color: color.grey40),
                  hintText: LocaleKeys.watchlist_search_text_hint.tr,
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 11),
                    child: SvgPicture.asset(
                      AppPath.icSearch,
                      color: color.grey40,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 1, color: color.grey20)),
                  contentPadding: EdgeInsets.all(sized.paddingSmall),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: color.grey40),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: color.primary),
                  ),
                  suffixIcon: Obx(() => controller.showButtonClean.value
                      ? GestureDetector(
                          onTap: () {
                            controller.clean();
                          },
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(4, 0, 0, 1),
                              child: Icon(
                                Icons.highlight_remove_outlined,
                                color: color.primary,
                                size: 20,
                              )))
                      : SizedBox())),
              inputFormatters: <TextInputFormatter>[
                UpperCaseTextFormatter(),
              ]),
        ),
      );

  Padding get buildHintInfo => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text.rich(
        TextSpan(
          style: textStyle.semiBold(size: 10, color: color.grey40),
          children: <InlineSpan>[
            TextSpan(
              text: LocaleKeys.watchlist_search_desc1.tr + ' ',
            ),
            WidgetSpan(
                child: SvgPicture.asset(
              AppPath.icStarUnWatch,
              height: 11.95,
              width: 11.46,
            )),
            TextSpan(
              text: ' ' + LocaleKeys.watchlist_search_desc2.tr,
            )
          ],
        ),
      ));

  Widget get buildData => Obx(() => ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: controller.selectStock.length,
      itemBuilder: (_, int index) => InkWell(
            onTap: () async {
              final bool? isplaceOrder = await Get.to(() => SecQuoteDetailPage(
                  controller.selectStock[index].stockItem.secID ?? '',
                  idCategory: categoryId));
              if (isplaceOrder ?? false) {
                Get.back();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: color.grey70),
                ),
                color: color.grey100,
              ),
              height: 60,
              child: Row(children: <Widget>[
                SizedBox(width: 12),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      SizedBox(height: 8),
                      Text(controller.selectStock[index].stockItem.secID ?? '',
                          style: textStyle.bold(color: color.grey0)),
                      Text(controller.selectStock[index].stockItem.sName ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle.regular(color: color.grey40)),
                    ])),
                InkWell(
                    borderRadius: BorderRadius.circular(50.0),
                    onTap: () => controller.addStockCategory(
                        controller.selectStock[index].stockItem.secID),
                    child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: SvgPicture.asset(
                            controller.selectStock[index].stockItem.isFavourite
                                ? AppPath.icStarWatched
                                : AppPath.icStarUnWatch))),
                SizedBox(width: 12),
              ]),
            ),
          )));

  @override
  SearchStockController putController() =>
      SearchStockController(categoryId: categoryId);
}
