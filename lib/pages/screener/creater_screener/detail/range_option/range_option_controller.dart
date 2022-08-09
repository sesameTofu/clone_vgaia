import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';

class RangeOptionController extends BaseController {
  RangeOptionController(this.screenerOption);
  final ScreenerOption screenerOption;

  //
  late TextEditingController textControllerFrom;
  late TextEditingController textControllerTo;
  FocusNode focusFrom = FocusNode();
  FocusNode focusTo = FocusNode();

  late Rx<RangeValues> currentRangeValues;

  @override
  void onInit() {
    super.onInit();
    textControllerFrom = TextEditingController(
        text: (screenerOption.fromPrice ?? screenerOption.minValue ?? 0)
            .formatVolume());
    textControllerTo = TextEditingController(
        text: (screenerOption.toPrice ?? screenerOption.maxValue ?? 0)
            .formatVolume());
    //
    currentRangeValues = RangeValues(
            (screenerOption.fromPrice ?? screenerOption.minValue ?? 0)
                .toDouble(),
            (screenerOption.toPrice ?? screenerOption.maxValue ?? 0).toDouble())
        .obs;
    //
    _listenTextChange();
  }

  void _listenTextChange() {
    // from
    textControllerFrom.addListener(() {
      final double? _value =
          double.tryParse(textControllerFrom.text.replaceAll(',', ''));
      if (_value != null && _value > currentRangeValues.value.end) {
        currentRangeValues.value = RangeValues(
            currentRangeValues.value.end, currentRangeValues.value.end);
      } else if (screenerOption.minValue != null &&
          _value != null &&
          _value < screenerOption.minValue!) {
        currentRangeValues.value = RangeValues(
            screenerOption.minValue!.toDouble(), currentRangeValues.value.end);
      } else {
        currentRangeValues.value = RangeValues(
            _value ?? screenerOption.minValue!.toDouble(),
            currentRangeValues.value.end);
      }
    });

    // to
    textControllerTo.addListener(() {
      final double? _value =
          double.tryParse(textControllerTo.text.replaceAll(',', ''));
      if (screenerOption.maxValue != null &&
          _value != null &&
          _value > screenerOption.maxValue!) {
        currentRangeValues.value = RangeValues(currentRangeValues.value.start,
            screenerOption.maxValue!.toDouble());
      } else if (screenerOption.minValue != null &&
          _value != null &&
          _value < currentRangeValues.value.start) {
        currentRangeValues.value = RangeValues(currentRangeValues.value.start,
            screenerOption.maxValue!.toDouble());
      } else {
        currentRangeValues.value = RangeValues(
          currentRangeValues.value.start,
          _value ?? screenerOption.maxValue!.toDouble(),
        );
      }
    });
  }

  //
  void onChangeSlide(RangeValues values) {
    textControllerFrom.text = values.start.formatVolume();
    textControllerTo.text = values.end.formatVolume();
    currentRangeValues.value = values;
  }

  //
  void onApplyChange() {
    final num _fromPrice =
        num.tryParse(textControllerFrom.text.replaceAll(',', '')) ?? 0;
    final num _toPrice =
        num.tryParse(textControllerTo.text.replaceAll(',', '')) ?? 0;
    final num _maxValue = screenerOption.maxValue ?? 0;
    final num _minValue = screenerOption.minValue ?? 0;
    if (textControllerFrom.text.isEmpty || textControllerTo.text.isEmpty) {
      AppToast.showError(LocaleKeys.screener_noti_range_empty.tr);
      return;
    } else if (_fromPrice > _toPrice ||
        _maxValue < _fromPrice ||
        _maxValue < _toPrice ||
        _minValue > _fromPrice ||
        _minValue > _toPrice) {
      AppToast.showError(LocaleKeys.screener_noti_range_invalid.tr);
      return;
    }
    //
    Get.back(
        result: screenerOption
          ..fromPrice = num.parse(textControllerFrom.text.replaceAll(',', ''))
          ..toPrice = num.parse(textControllerTo.text.replaceAll(',', '')));
  }

  // @override
  // void onClose() {
  //   super.onClose();
  //   // Không  được Huy TextController
  //   textControllerFrom.dispose();
  //   textControllerTo.dispose();
  // }
}
