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
    1: 'Ti???n m???t',
    2: 'C??? t???c c??? phi???u',
    3: 'C??? phi???u th?????ng',
    4: '????ng k?? ph??t h??nh th??m',
    5: 'Tr??i phi???u chuy???n ?????i',
    6: 'S??t nh???p',
    7: 'Chia t??ch',
    8: 'H???y ni??m y???t',
    9: 'Thay ?????i lo???i h??nh',
    10: '????ng k?? l??u k??',
    11: 'Bi???u quy???t',
    12: 'Ho??n tr??? v???n g??p',
    13: '????o h???n tr??i phi???u',
    14: 'Mua l???i v???n g??p c???a TCPH',
    15: 'Quy???n mua tr??i phi???u chuy???n ?????i',
  };
}
