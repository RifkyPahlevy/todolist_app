class Todo {
  int? id;
  String? kegiatan;
  String? waktu;

  Todo({this.id, this.kegiatan, this.waktu});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kegiatan = json['kegiatan'];
    waktu = json['waktu'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['kegiatan'] = kegiatan;
    data['waktu'] = waktu;
    return data;
  }

  static List<Todo> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => Todo.fromJson(e)).toList();
  }
}
