//User Model
class UserModel {
  final String id;
  final String email;
  final String name;
  final String username;

  UserModel({required this.id, required this.email, required this.name, required this.username});

  factory UserModel.fromJson(Map data) {
    return UserModel(
      id: data['id'].toString(),
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      username: data['username'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {"id": id, "email": email, "name": name, "username": username};
}
