class Data {
  List<Countries> countries;

  Data({this.countries});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = new List<Countries>();
      json['countries'].forEach((v) {
        countries.add(new Countries.fromJson(v));
      });
    }
  }
}

class Countries {
  String name;
  String code;
  String currency;
  String phone;

  Countries({this.name, this.code, this.currency, this.phone});

  Countries.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    currency = json['currency'];
    phone = json['phone'];
  }
}
