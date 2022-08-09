class Srv4511ResultData1 {
  Srv4511ResultData1({
    this.timeStamp1,
    this.id1,
    this.active1,
    this.mobile,
    this.mobile2,
    this.mobile3,
    this.mobile4,
    this.mobile5,
    this.od00,
    this.pd00,
    this.tr00,
    this.ri00,
    this.ko00,
    this.password,
    this.changePassFlag,
    this.status,
    this.remarks,
  });

  factory Srv4511ResultData1.fromJson(Map<String, dynamic> json) =>
      Srv4511ResultData1(
          timeStamp1: json['timeStamp1'],
          id1: json['id1'],
          active1: json['active1'],
          mobile: json['mobile'],
          mobile2: json['mobile2'],
          mobile3: json['mobile3'],
          mobile4: json['mobile4'],
          mobile5: json['mobile5'],
          od00: json['od00'],
          pd00: json['pd00'],
          tr00: json['tr00'],
          ri00: json['ri00'],
          ko00: json['ko00'],
          password: json['password'],
          changePassFlag: json['changePassFlag'],
          status: json['status'],
          remarks: json['remarks']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'timeStamp1': timeStamp1,
        'id1': id1,
        'active1': active1,
        'mobile': mobile,
        'mobile2': mobile2,
        'mobile3': mobile3,
        'mobile4': mobile4,
        'mobile5': mobile5,
        'od00': od00,
        'pd00': pd00,
        'tr00': tr00,
        'ri00': ri00,
        'ko00': ko00,
        'password': password,
        'changePassFlag': changePassFlag,
        'status': status,
        'remarks': remarks,
      };

  String? timeStamp1;
  String? id1;
  String? active1;
  String? mobile;
  String? mobile2;
  String? mobile3;
  String? mobile4;
  String? mobile5;
  String? od00;
  String? pd00;
  String? tr00;
  String? ri00;
  String? ko00;
  String? password;
  String? changePassFlag;
  String? status;
  String? remarks;
}
