class ConModel {
  ConModel({
    String? name,
    String? link,
    String? start,
    String? end,
    String? location,}){
    _name = name;
    _link = link;
    _start = start;
    _end = end;
    _location = location;
  }

  ConModel.fromJson(dynamic json) {
    _name = json['name'];
    _link = json['link'];
    _start = json['start'];
    _end = json['end'];
    _location = json['location'];
  }
  String? _name;
  String? _link;
  String? _start;
  String? _end;
  String? _location;

  String? get name => _name;
  String? get link => _link;
  String? get start => _start;
  String? get end => _end;
  String? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['link'] = _link;
    map['start'] = _start;
    map['end'] = _end;
    map['location'] = _location;
    return map;
  }
}