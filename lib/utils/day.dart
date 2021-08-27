class Jour {
  int id;
  String versets;
  DateTime date;

  Jour();

  transformDate() {}

  fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.versets = map['versets'];
    this.date = DateTime.parse(map['date']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'versets': this.versets, 'date': this.date};
    if (id != null) map['id'] = this.id;
    return map;
  }
}
