class childrenDB {
  String name;
  String dob;
  String dadname;
  String momname;
  String address;
  String phonenumber;
  String sex;
  String clas;
  String id;

  childrenDB(
      {this.name,
      this.dob,
      this.dadname,
      this.momname,
      this.address,
      this.phonenumber,
      this.sex,
      this.clas,
      this.id});

  childrenDB.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dob = json['dob'];
    dadname = json['dadname'];
    momname = json['momname'];
    address = json['address'];
    phonenumber = json['phonenumber'];
    clas = json['clas'];
    sex = json['sex'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['dadname'] = this.dadname;
    data['momname'] = this.momname;
    data['address'] = this.address;
    data['phonenumber'] = this.phonenumber;
    data['sex'] = this.sex;
    data['clas'] = this.clas;
    data['id'] = this.id;
    return data;
  }
}
