class UserModel {
  String? name;
  String? description;
  String? url;

  UserModel({this.name, this.description, this.url});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['url'] = url;
    return data;
  }
}

class UserUtils {
  static List<UserModel> getDummyUsers() {
    return [
      UserModel(
          name: 'Ömer Yılmaz',
          description: 'Mobile Developer',
          url: 'https://github.com'),
      UserModel(
          name: 'Mustafa Aydoğdu',
          description: 'Java Developer',
          url: 'https://youtube.com'),
      UserModel(
          name: 'Selim Bugün',
          description: 'Python Developer',
          url: 'https://github.com'),
      UserModel(
          name: 'Mehmet İlhan',
          description: 'Student',
          url: 'https://github.com'),
    ];
  }
}