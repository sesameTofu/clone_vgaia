import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/screener/screener_controller.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ScreenerPage extends BaseScreen<ScreenerController> {
  ScreenerPage({Key? key}) : super(key: key);

  @override
  ScreenerController putController() => ScreenerController();

  @override
  Widget builder() {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
      bottomNavigationBar: _buildButtonAdd,
    );
  }

  PreferredSize get _buildAppBar => PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarCustom(
          titleAppBar: LocaleKeys.screener_filter.tr,
        ),
      );

  Widget get _buildBody => SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () => controller.getListFilter(),
        child: Obx(
          () => controller.listScreeener.isEmpty
              ? SizedBox()
              : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.listScreeener.length,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 100),
                  itemBuilder: (_, int index) =>
                      _buildItemFilter(controller.listScreeener[index]),
                ),
        ),
      );

  Widget get _buildButtonAdd => Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 20, left: 12, right: 12),
        child: WidgetButton(
          onClick: () => controller.onCreateNewScreener(),
          title: ' ' + LocaleKeys.screener_create_new_filter.tr,
          textColor: color.primary,
          bgColor: color.background1,
          typeButton: TypeButton.secondary,
          icon: Icon(
            Icons.add,
            size: 22,
            color: color.primary,
          ),
        ),
      );

  Widget _buildItemFilter(ScreenerModel filter) => Slidable(
        actionExtentRatio: 0.2,
        actionPane: SlidableDrawerActionPane(),
        direction: Axis.horizontal,
        secondaryActions: <SlideAction>[
          SlideAction(
            onTap: () => controller.onRemoveScreener(filter),
            closeOnTap: true,
            color: color.red50,
            child: Icon(
              Icons.delete_forever,
              color: color.grey40,
              size: 20,
            ),
          )
        ],
        child: GestureDetector(
          onTap: () => controller.onTapScreener(filter),
          child: Container(
            decoration: BoxDecoration(
              color: color.background1,
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  filter.nameFilter ?? '- - -',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle.custom(size: 16, color: color.grey0),
                ).paddingSymmetric(horizontal: 12, vertical: 14),
                Divider(color: color.grey50, height: 1),
                SizedBox(height: 10),
                if (filter.marketIDstr != null)
                  _buildTextRow('${LocaleKeys.screener_market.tr} : ',
                      filter.marketIDstr),
                if (filter.industriesStr != null)
                  _buildTextRow('${LocaleKeys.screener_industry.tr} : ',
                      filter.industriesStr),
                if (filter.quotesStr != null)
                  _buildTextRow('${LocaleKeys.screener_quotes_indicator.tr} : ',
                      filter.quotesStr),
                if (filter.financialStr != null)
                  _buildTextRow(
                      '${LocaleKeys.screener_financial_indicator.tr} : ',
                      filter.financialStr),
                if (filter.technicalStr != null)
                  _buildTextRow(
                      '${LocaleKeys.screener_technical_indicator.tr} : ',
                      filter.technicalStr),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ).paddingOnly(bottom: 12);

  Widget _buildTextRow(String title, String? content) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: RichText(
          text: TextSpan(
            text: title,
            style: textStyle.regular(color: color.grey0),
            children: <TextSpan>[
              TextSpan(
                  text: content ?? '- - -',
                  style: textStyle.regular(color: color.primary)),
            ],
          ),
        ),
      );
}
