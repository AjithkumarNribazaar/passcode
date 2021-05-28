  class Post {
  String nETT;
  String bILLCOUNT;
  String sHBRANCHCODE;
  String mAX;

  Post({this.nETT, this.bILLCOUNT, this.sHBRANCHCODE, this.mAX});

  Post.fromJson(Map<String, dynamic> json) {
    nETT = json['NETT'];
    bILLCOUNT = json['BILLCOUNT'];
    sHBRANCHCODE = json['SH_BRANCHCODE'];
    mAX = json['MAX'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NETT'] = this.nETT;
    data['BILLCOUNT'] = this.bILLCOUNT;
    data['SH_BRANCHCODE'] = this.sHBRANCHCODE;
    data['MAX'] = this.mAX;
    return data;
  }
}
