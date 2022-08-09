class RightInfoInqData {
  RightInfoInqData({
    this.subAccoCd,
    this.displayNameType,
    this.begnumradeDate,
    this.ratesd,
    this.secCd,
    this.delCd,
    this.ratess,
    this.subAccoNo,
    this.recAmt,
    this.recQty,
    this.ratess1,
    this.ratesd1,
    this.rightExcDate,
    this.ownerFixDate,
    this.ownQty,
    this.remarks,
    this.secRentention,
    this.rightName,
    this.rightType,
    this.paymentStatus,
    this.rightTypeDisplay,
    this.rateDisplay,
    this.ownerFixDateDisplay,
    this.rightExcDateDisplay,
    this.begnumradeDateDisplay,
  });

  RightInfoInqData.fromJson(Map<String, dynamic> json) {
    subAccoCd = json['subAccoCd'] as num?;
    displayNameType = json['displayNameType'] as String?;
    begnumradeDate = json['begnumradeDate'] as num?;
    ratesd = json['ratesd'] as num?;
    secCd = json['secCd'] as String?;
    delCd = json['delCd'] as num?;
    ratess = json['ratess'] as num?;
    subAccoNo = json['subAccoNo'] as String?;
    recAmt = json['recAmt'] as num?;
    recQty = json['recQty'] as num?;
    ratess1 = json['ratess1'] as num?;
    ratesd1 = json['ratesd1'] as num?;
    rightExcDate = json['rightExcDate'] as num?;
    ownerFixDate = json['ownerFixDate'] as num?;
    ownQty = json['ownQty'] as num?;
    remarks = json['remarks'] as String?;
    secRentention = json['secRentention'] as num?;
    rightName = json['rightName'] as String?;
    rightType = json['rightType'] as num?;
    paymentStatus = json['paymentStatus'] as String?;
    rightTypeDisplay = json['rightTypeDisplay'] as String?;
    rateDisplay = json['rateDisplay'] as String?;
    ownerFixDateDisplay = json['ownerFixDateDisplay'] as String?;
    rightExcDateDisplay = json['rightExcDateDisplay'] as String?;
    begnumradeDateDisplay = json['begnumradeDateDisplay'] as String?;
  }

  num? subAccoCd;
  String? displayNameType;
  num? begnumradeDate;
  num? ratesd;
  String? secCd;
  num? delCd;
  num? ratess;
  String? subAccoNo;
  num? recAmt;
  num? recQty;
  num? ratess1;
  num? ratesd1;
  num? rightExcDate;
  num? ownerFixDate;
  num? ownQty;
  String? remarks;
  num? secRentention;
  String? rightName;
  num? rightType;
  String? paymentStatus;
  String? rightTypeDisplay;
  String? rateDisplay;
  String? ownerFixDateDisplay;
  String? rightExcDateDisplay;
  String? begnumradeDateDisplay;

  Map<String?, dynamic> toJson() => <String, dynamic>{
        'subAccoCd': subAccoCd,
        'displayNameType': displayNameType,
        'begnumradeDate': begnumradeDate,
        'ratesd': ratesd,
        'secCd': secCd,
        'delCd': delCd,
        'ratess': ratess,
        'subAccoNo': subAccoNo,
        'recAmt': recAmt,
        'recQty': recQty,
        'ratess1': ratess1,
        'ratesd1': ratesd1,
        'rightExcDate': rightExcDate,
        'ownerFixDate': ownerFixDate,
        'ownQty': ownQty,
        'remarks': remarks,
        'secRentention': secRentention,
        'rightName': rightName,
        'rightType': rightType,
        'paymentStatus': paymentStatus,
        'rightTypeDisplay': rightTypeDisplay,
        'rateDisplay': rateDisplay,
        'ownerFixDateDisplay': ownerFixDateDisplay,
        'rightExcDateDisplay': rightExcDateDisplay,
        'begnumradeDateDisplay': begnumradeDateDisplay,
      };

  String? get rightTypeName => rightTypeNameMapping[rightType];

  static Map<num, String> rightTypeNameMapping = <num, String>{
    1: 'Tiền mặt',
    2: 'Cổ tức cổ phiếu',
    3: 'Cổ phiếu thường',
    4: 'Đăng ký phát hành thêm',
    5: 'Trái phiếu chuyển đổi',
    6: 'Sát nhập',
    7: 'Chia tách',
    8: 'Hủy niêm yết',
    9: 'Thay đổi loại hình',
    10: 'Đăng ký lưu ký',
    11: 'Biểu quyết',
    12: 'Hoàn trả vốn góp',
    13: 'Đáo hạn trái phiếu',
    14: 'Mua lại vốn góp của TCPH',
    15: 'Quyền mua trái phiếu chuyển đổi',
  };
}
