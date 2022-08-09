import 'package:flutter_mobile/base/base_main_controller.dart';
import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/main/main_controller.dart';
import 'package:flutter_mobile/pages/order/order_controller.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_list_view_model/order_conditional_view_model.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_list_view_model/order_diary_view_model.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_list_view_model/order_list_view_model_abstract.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_list_view_model/order_pre_view_model.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/account/account_mixi_controller.dart';
import 'package:flutter_mobile/widgets/app_dialog_cofirm.dart';
import 'package:horizontal_data_table/refresh/hdt_refresh_controller.dart';

class OrderListNormalController extends BaseMainController<TypePageOrder>
    with AccountMixi {
  OrderListNormalController()
      : super(
            currentPage: TypePageOrder.OrderDiary,
            indexPageChange: Get.find<OrderController>().typePage);
  final HDTRefreshController hdtRefreshController = HDTRefreshController();
  final MainController mainController = Get.find<MainController>();
  final List<Select<OrderListType>> listOrderType = <Select<OrderListType>>[
    Select<OrderListType>(
        id: 0, title: LocaleKeys.order_diary.tr, value: OrderListType.diary),
    Select<OrderListType>(
        id: 1,
        title: LocaleKeys.trading_page_pre_market.tr,
        value: OrderListType.preMarket),
    Select<OrderListType>(
        id: 2,
        title: LocaleKeys.trading_page_conditional.tr,
        value: OrderListType.conditional),
  ];

  final List<Select<TradeType>> listTradeType = <Select<TradeType>>[
    Select<TradeType>(id: 0, title: LocaleKeys.goline_LoaiLenh.tr, value: null),
    Select<TradeType>(id: 1, title: LocaleKeys.buy.tr, value: TradeType.BUY),
    Select<TradeType>(id: 2, title: LocaleKeys.sell.tr, value: TradeType.SELL)
  ];

  // Rx<SessionState> sessionSate = Get.find<SessionController>().state;

  final Rx<Select<OrderListType>> orderTypeSelect = Select<OrderListType>().obs;

  final RxList<OrderListModelAbstract> _listData =
      RxList<OrderListModelAbstract>();

  // ignore: invalid_use_of_protected_member
  List<OrderListModelAbstract> get listData => _listData.value;

  final Rx<Select<TradeType>> tradeTypeSelect = Select<TradeType>().obs;

  OrderListAbstract orderListAbstract = OrderDiaryViewModel();

  RxList<Select<dynamic>> orderListStatus = <Select<dynamic>>[].obs;

  Rx<Select<dynamic>> orderStatusSelect =
      Rx<Select<dynamic>>(Select<dynamic>());
  // Chỉ gọi Api 1 lần
  bool isFirstCallData = true;

  @override
  void onInit() {
    _bindData();
    super.onInit();
  }

  @override
  void initPage({bool? onInit = false}) {
    getOrderList();
  }

  void _bindData() {
    // init thể loại là sổ lệnh (index = 0)
    orderTypeSelect.value = listOrderType[0];

    // mặc định loại lệnh: lấy all (index = 0)
    tradeTypeSelect.value = listTradeType[0];
  }

  Future<void> getOrderList() async {
    switch (orderTypeSelect.value.value) {
      case OrderListType.preMarket:
        orderListAbstract = OrderPreViewModel();
        break;
      case OrderListType.conditional:
        orderListAbstract = OrderConditionalViewModel();
        break;
      case OrderListType.diary:
      default:
        orderListAbstract = OrderDiaryViewModel();
    }
    // get Trạng thái mới
    orderListStatus.value = orderListAbstract.getOrderListStatus();
    orderStatusSelect.value = orderListAbstract.getOrderListStatusSelect();
    // rest về loại lệnh về all
    tradeTypeSelect.value = listTradeType[0];
    _callApiGetData();
  }

  Future<void> _callApiGetData() async {
    showLoading();
    await orderListAbstract.callApi(
        tradeType: tradeTypeSelect.value.value,
        status: orderStatusSelect.value);
    // setData
    _listData.value = orderListAbstract.orderListFilter;
    isFirstCallData = false;
    hideLoading();
  }

// thay đổi trạng thái
  void changeStatusOrder(Select<dynamic> value) {
    if (value != orderStatusSelect.value) {
      orderStatusSelect.value = value;
      _callApiGetData();
    }
  }

  // thay đổi Loại lệnh (all,buy,sell)
  void changeOrderTradeType(Select<TradeType> value) {
    if (value != tradeTypeSelect.value) {
      tradeTypeSelect.value = value;
      orderListAbstract.fliterTradeType(tradeType: tradeTypeSelect.value.value);
      _listData.value = orderListAbstract.orderListFilter;
    }
  }

  //  Thay đổi loại ( sổ lệnh, trước ngày, điều kiện)
  void changeOrderType(Select<OrderListType> type) {
    if (orderTypeSelect.value != type) {
      orderTypeSelect.value = type;
      getOrderList();
    }
  }

  Future<void> refeshData() async {
    await getOrderList();
    hdtRefreshController.refreshCompleted();
  }

  void cancelOrderList(List<OrderListModelAbstract> listSelect) {
    showLoading();
    orderListAbstract.cancelOrderList(
        orderListModelAbstract: listSelect,
        onSuccess: (bool isSuccess) {
          hideLoading();
          showDialogSuccess();
        },
        onFailure: (dynamic error) {
          hideLoading();
          AppToast.showError(getError(error));
        });
  }

  void showDialogSuccess() {
    AppDialogCofirmDialog().show(
      content: LocaleKeys.cancel_order_succ.tr,
      onCancel: () {
        Get.back();
        _callApiGetData();
      },
    );
  }

  @override
  void accountChange(Select<String> subAccount, {bool isFrist = false}) {
    // TODO: implement accountChange
  }

  onLoad() {}
}
