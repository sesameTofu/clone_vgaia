class CustomerBank {
  CustomerBank({
    this.regUserId,
    this.regDateTime,
    this.remarks,
    this.defaultFlg,
    this.bankAccoName,
    this.bankAccoNumber,
    this.updDateTime,
    this.bankAccoType,
    this.bankCd,
    this.countryCd,
    this.currCd,
    this.delCd,
    this.seqNo,
    this.custCd,
    this.bankBranchCd,
    this.updUserId,
  });
  CustomerBank.fromJson(Map<String?, dynamic> json) {
    regUserId = json['regUserId'] as String?;
    regDateTime = json['regDateTime'] as num?;
    remarks = json['remarks'] as String?;
    defaultFlg = json['defaultFlg'] as num?;
    bankAccoName = json['bankAccoName'] as String?;
    bankAccoNumber = json['bankAccoNumber'] as String?;
    updDateTime = json['updDateTime'] as num?;
    bankAccoType = json['bankAccoType'] as num?;
    bankCd = json['bankCd'] as String?;
    countryCd = json['countryCd'] as String?;
    currCd = json['currCd'] as String?;
    delCd = json['delCd'] as num?;
    seqNo = json['seqNo'] as num?;
    custCd = json['custCd'] as num?;
    bankBranchCd = json['bankBranchCd'] as String?;
    updUserId = json['updUserId'] as String?;
  }
  String? regUserId;
  num? regDateTime;
  String? remarks;
  num? defaultFlg;
  String? bankAccoName;
  String? bankAccoNumber;
  num? updDateTime;
  num? bankAccoType;
  String? bankCd;
  String? countryCd;
  String? currCd;
  num? delCd;
  num? seqNo;
  num? custCd;
  String? bankBranchCd;
  String? updUserId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['regUserId'] = regUserId;
    data['regDateTime'] = regDateTime;
    data['remarks'] = remarks;
    data['defaultFlg'] = defaultFlg;
    data['bankAccoName'] = bankAccoName;
    data['bankAccoNumber'] = bankAccoNumber;
    data['updDateTime'] = updDateTime;
    data['bankAccoType'] = bankAccoType;
    data['bankCd'] = bankCd;
    data['countryCd'] = countryCd;
    data['currCd'] = currCd;
    data['delCd'] = delCd;
    data['seqNo'] = seqNo;
    data['custCd'] = custCd;
    data['bankBranchCd'] = bankBranchCd;
    data['updUserId'] = updUserId;
    return data;
  }
}
