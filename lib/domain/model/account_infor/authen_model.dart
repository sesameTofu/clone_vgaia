import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/utils/functs.dart';

class AuthenModel {
  AuthenModel(
      {required this.id,
      required this.delCd,
      required this.userID,
      required this.allowSaveOtp,
      required this.businessCd,
      required this.channel,
      required this.otpType,
      this.remark,
      this.isSubmitOtpSuccess = false});

  factory AuthenModel.fromJson(Map<String, dynamic> json) => AuthenModel(
        id: json['id'] as int?,
        delCd: json['delCd'] as int?,
        userID: json['userID'] as String?,
        allowSaveOtp: ((json['allowSaveOtp'] as int?) ?? 0) == 1,
        businessCd: json['businessCd'] as int?,
        channel: json['channel'] as int?,
        otpType: json['otpType'] as int?,
        remark: json['remark'] as String?,
      );

  int? id;
  int? delCd;
  String? userID;
  int? channel;
  int? businessCd;
  int? otpType;
  bool? allowSaveOtp;
  bool isSubmitOtpSuccess = false;
  String? remark;
  late String? sessionOTPCode = '';
  bool isSavedOtp = true;

  PinType getTypeAuthen() {
    switch (otpType) {
      case 1:
        {
          return PinType.SmartOtp;
        }
      case 2:
        {
          return PinType.Otp;
        }
      case 3:
        {
          return PinType.Password;
        }
    }
    return PinType.None;
  }

  BussinesType getBusinessType() {
    switch (businessCd) {
      case -1:
        {
          return BussinesType.GetSmartOtp;
        }
      case 1:
        {
          return BussinesType.Login;
        }
      case 2:
        {
          return BussinesType.Order;
        }
      case 3:
        {
          return BussinesType.TransferBank;
        }
      case 4:
        {
          return BussinesType.TranferInside;
        }
      case 5:
        {
          return BussinesType.TranferCIA;
        }
      case 6:
        {
          return BussinesType.BuyMore;
        }
      case 7:
        {
          return BussinesType.RegisService;
        }
      case 8:
        {
          return BussinesType.Corporate;
        }
      case 9:
        {
          return BussinesType.Bond;
        }
      case 10:
        {
          return BussinesType.Margin;
        }
      case 100:
        {
          return BussinesType.RegSmartOtp;
        }
      case 101:
        {
          return BussinesType.ResetPW;
        }
      case 102:
        {
          return BussinesType.ChangeInfo;
        }
      case 103:
        {
          return BussinesType.DelSmartOtp;
        }
    }

    return BussinesType.None;
  }

  bool get getAutoSMSOtpCode =>
      (allowSaveOtp ?? true) &&
      isSavedOtp &&
      isSubmitOtpSuccess &&
      isNotNullOrEmpty(sessionOTPCode);
}
