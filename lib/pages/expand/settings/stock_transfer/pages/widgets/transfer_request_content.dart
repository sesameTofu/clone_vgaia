import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/pages/stock_transfer_request_controller.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/text_field/build_input_text.dart';

class TransferRequestContent
    extends BaseScreen<StockTransferRequestController> {
  TransferRequestContent({Key? key}) : super(key: key);

  @override
  Widget builder() => Obx(() {
        if (controller.isFocus.value) {
          return SizedBox(height: 10.0);
        }
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(LocaleKeys.goline_Content.tr, style: textStyle.medium()),
                SizedBox(height: 5.0),
                BuildInputText(
                  hintText: LocaleKeys.transfers_Content_transfer.tr,
                  controller: controller.nodeCtrl,
                  maxLines: 3,
                  // textAlign: TextAlign.start,
                  scrollPadding: EdgeInsets.zero,
                  fontSize: 13.0,
                ),
                SizedBox(height: 12.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: WidgetButton(
                        title: 'Huỷ',
                        typeButton: TypeButton.secondary,
                        onClick: () {
                          controller.setSelectAll(false);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Obx(() => WidgetButton(
                            isShowLoading: controller.isLoadingPage.value,
                            bgColor: controller.isconfirm.value
                                ? color.primary
                                : color.grey60,
                            title: LocaleKeys.goline_Confirm.tr,
                            onClick: () {
                              // if (controller.validateSubmit() != null) {
                              //   AppToast.showError(controller.validateSubmit());
                              //   return;
                              // }
                              controller.submitTransferSec();
                            },
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });

  @override
  StockTransferRequestController? putController() =>
      StockTransferRequestController();
}
