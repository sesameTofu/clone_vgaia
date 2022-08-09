import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/usecase/place_order/place_order_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';

class PlaceOrderCondition {
  final PlaceOrderUseCase placeOrderUseCase = PlaceOrderUseCase();

  // Chọn lệnh điều kiện
  late final RxNotify<Select<PlaceOrderType>> placeOrderTypeSelect =
      listOrderType[0].objective;

// Cho lệnh trước giờ
  DateTime formDate = DateTime.now();

// Cho lệnh trước giờ
  RxNotify<DateTime> toDate = DateTime.now().objective;

  // Phương thức: phát sinh 1 lần, khớp đủ khối lượng
  late final RxNotify<Select<MatMethod>> matchMathod =
      listMatMethod[0].objective;

  // Giá điều điều kiện : Không điều kiện, gía tham chiếu
  late final RxNotify<Select<OrderPriceCondition>> orderPriceCondition =
      listOrderPriceConditions[0].objective;

// Điều kiện giá : >= , <=
  late final RxNotify<Select<PriceCondition>> priceCondition =
      listPriceConditions[0].objective;

//  Khoảng dừng
  late final RxNotify<Select<SpreadsType>> spreadsType =
      listspreadsType[0].objective;

//  chenh lech
  late final RxNotify<Select<PriceDiffsType>> priceDiffsType =
      listPriceDiffsType[0].objective;

// Chênh lệch giá theo type (gia tri hoac %) : Dùng để tính giá kích hoạt
  final TextEditingController priceDiffController =
      TextEditingController(text: '0');
  final FocusNode priceDiffFocusNode = FocusNode();

// gia dieu kien
  final TextEditingController referencePriceController =
      TextEditingController(text: '0');
  final FocusNode referencePriceFocusNode = FocusNode();

// Khoảng dừng
  final TextEditingController spreadValueController =
      TextEditingController(text: '0');
  final FocusNode spreadValueFocusNode = FocusNode();

// Giá chênh lệch
  final TextEditingController triggerPriceController =
      TextEditingController(text: '0');
  final FocusNode triggerPriceFocusNode = FocusNode();

// Giá mua thấp nhất
  final TextEditingController lowestAndHighesPriceController =
      TextEditingController(text: '0');
  final FocusNode lowestAndHighesPriceFocusNode = FocusNode();

// Giá bình quân
  final TextEditingController averageController =
      TextEditingController(text: '0');

// Giá kích hoạt
  final TextEditingController activePriceController =
      TextEditingController(text: '0');

// Giá đặt
  final TextEditingController orderPriceController =
      TextEditingController(text: '0');

  num get activePrice => activePriceController.text.formatNumber();

// Chenh lech
  num get triggerPrice => triggerPriceController.text.formatNumber();

// Gias tham chieu
  num? get referencePrice => referencePriceController.text.formatNumber();

// Khoang dung
  num? get spreadValue => spreadValueController.text.formatNumber();

// Giá mua thấp nhất
  num get lowestAndHighesPrice =>
      lowestAndHighesPriceController.text.formatNumber();

// gia dat ( lenh chot lai, cat lo)
// Khoang dung
  num? get orderPriceConditionNumber =>
      orderPriceController.text.formatNumber();

  void initCondition() {
    initDate();
    averageController.addListener(calculateActivePriceChange);
    priceDiffController.addListener(calculateActivePriceChange);
  }

// Lấy ngày ở sever
  void initDate() {
    formDate = placeOrderUseCase.getDateTimeFormSever();
    toDate.value = placeOrderUseCase.getDateTimeFormSever();
  }

// Thay đổi phương thức
  void changeMatMethod(Select<MatMethod> valueMatchMethod) {
    if (matchMathod.value != valueMatchMethod) {
      matchMathod.value = valueMatchMethod;
    }
  }

// Thay đổi có sử dụng giá tham chiếu hay không
  void changeOrderPriceCondition(
      Select<OrderPriceCondition> valueOrderPriceCondition) {
    if (orderPriceCondition.value != valueOrderPriceCondition) {
      orderPriceCondition.value = valueOrderPriceCondition;
    }
  }

// Thay đổi giá tham chiếu
  void changeReferencePrice(Select<PriceCondition> valuePriceCondition) {
    if (priceCondition.value != valuePriceCondition) {
      priceCondition.value = valuePriceCondition;
    }
  }

  void changeSpreadsType(Select<SpreadsType> valueSpreadsType) {
    if (spreadsType.value != valueSpreadsType) {
      spreadsType.value = valueSpreadsType;
    }
  }

  void changeDriffType(Select<PriceDiffsType> valueDiffsType) {
    if (priceDiffsType.value != valueDiffsType) {
      priceDiffsType.value = valueDiffsType;
      calculateActivePriceChange();
    }
  }

// Tính lại giá kích hoạt khi giá bình quân thay đổi, và giá trị chênh lêch thay đổi
  void calculateActivePriceChange() {
    final num averagePrice = averageController.text.formatNumber();
    final num diffValue = priceDiffController.text.formatNumber();
    num activePrice = 0;
    if (placeOrderTypeSelect.value.value == PlaceOrderType.TakeProfit) {
      if (priceDiffsType.value.value == PriceDiffsType.value) {
        activePrice = averagePrice + diffValue;
      } else {
        activePrice = averagePrice * (1 + diffValue / 100);
      }
    } else {
      if (priceDiffsType.value.value == PriceDiffsType.value) {
        activePrice = averagePrice - diffValue;
      } else {
        activePrice = averagePrice * (1 - diffValue / 100);
      }
    }

    activePriceController.text = activePrice.formatPrice(decimalDigits: 3);
  }

  void changeDate({required DateTime date}) {
    toDate.value = date;
  }

  void clearDataCondition() {
    initDate();
    matchMathod.value = listMatMethod[0];
    orderPriceCondition.value = listOrderPriceConditions[0];
    priceCondition.value = listPriceConditions[0];
    spreadsType.value = listspreadsType[0];
    referencePriceController.text = '0';
    spreadValueController.text = '0';
    triggerPriceController.text = '0';
    lowestAndHighesPriceController.text = '0';
    priceDiffController.text = '0';
  }

  List<Select<MatMethod>> listMatMethod = <Select<MatMethod>>[
    Select<MatMethod>(
        id: 0,
        title: LocaleKeys.trading_page_one_time.tr,
        value: MatMethod.OneTime),
    Select<MatMethod>(
        id: 1,
        title: LocaleKeys.trading_page_match_enough_order_qty.tr,
        value: MatMethod.MatchEnough)
  ];

// Giá điều kiện
  List<Select<OrderPriceCondition>> listOrderPriceConditions =
      <Select<OrderPriceCondition>>[
    Select<OrderPriceCondition>(
        id: 0,
        title: LocaleKeys.trading_page_no_condition.tr,
        value: OrderPriceCondition.notCondition),
    Select<OrderPriceCondition>(
        id: 1,
        title: LocaleKeys.trading_page_basic_price.tr,
        value: OrderPriceCondition.referencePrice)
  ];

// Giá điều kiện
  List<Select<PriceCondition>> listPriceConditions = <Select<PriceCondition>>[
    Select<PriceCondition>(
        id: 0, title: '>=', value: PriceCondition.largerOrEqual),
    Select<PriceCondition>(
        id: 1, title: '<=', value: PriceCondition.lessThanOrEqual)
  ];

// Khoảng dừng
  List<Select<SpreadsType>> listspreadsType = <Select<SpreadsType>>[
    Select<SpreadsType>(
        id: 0,
        title: LocaleKeys.trading_page_by_value.tr,
        value: SpreadsType.value),
    Select<SpreadsType>(
        id: 1,
        title: LocaleKeys.trading_page_by_percentage.tr,
        value: SpreadsType.percentage)
  ];

// Chênh lệch
  List<Select<PriceDiffsType>> listPriceDiffsType = <Select<PriceDiffsType>>[
    Select<PriceDiffsType>(
        id: 0,
        title: LocaleKeys.trading_page_by_value.tr,
        value: PriceDiffsType.value),
    Select<PriceDiffsType>(
        id: 1,
        title: LocaleKeys.trading_page_by_percentage.tr,
        value: PriceDiffsType.percentage)
  ];

  List<Select<PlaceOrderType>> listOrderType = <Select<PlaceOrderType>>[
    Select<PlaceOrderType>(
        id: 0,
        title: LocaleKeys.goline_NormalOrder.tr,
        value: PlaceOrderType.OrderNormal),
    Select<PlaceOrderType>(
        id: 1,
        title: LocaleKeys.goline_TruocNgay.tr,
        value: PlaceOrderType.BeforeDay),
    Select<PlaceOrderType>(
        id: 2,
        title: LocaleKeys.goline_XuHuong.tr,
        value: PlaceOrderType.Tendency),
    Select<PlaceOrderType>(
        id: 3,
        title: LocaleKeys.goline_ChotLai.tr,
        value: PlaceOrderType.TakeProfit),
    Select<PlaceOrderType>(
        id: 4,
        title: LocaleKeys.goline_CatLo.tr,
        value: PlaceOrderType.StopLoss),
    Select<PlaceOrderType>(
        id: 5,
        title: LocaleKeys.goline_TranhMuBan.tr,
        value: PlaceOrderType.DisputePurchase)
  ];
}
