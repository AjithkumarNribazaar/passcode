class Post {
  String cARDAMOUNT;
  String cASHAMOUNT;
  String oNLINEAMT;
  String cOMPLEMENTRY;
  String nETT;
  String bILLCOUNT;

  Post(
      {this.cARDAMOUNT,
        this.cASHAMOUNT,
        this.oNLINEAMT,
        this.cOMPLEMENTRY,
        this.nETT,
        this.bILLCOUNT});

  Post.fromJson(Map<String, dynamic> json) {
    cARDAMOUNT = json['CARDAMOUNT'];
    cASHAMOUNT = json['CASHAMOUNT'];
    oNLINEAMT = json['ONLINEAMT'];
    cOMPLEMENTRY = json['COMPLEMENTRY'];
    nETT = json['NETT'];
    bILLCOUNT = json['BILLCOUNT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CARDAMOUNT'] = this.cARDAMOUNT;
    data['CASHAMOUNT'] = this.cASHAMOUNT;
    data['ONLINEAMT'] = this.oNLINEAMT;
    data['COMPLEMENTRY'] = this.cOMPLEMENTRY;
    data['NETT'] = this.nETT;
    data['BILLCOUNT'] = this.bILLCOUNT;
    return data;
  }
}