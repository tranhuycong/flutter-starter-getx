import 'dart:convert';

import 'package:flutter_lala_kids/network_module/http_client.dart';

import '../models/user_model.dart';

class AuthRepository {
  Future<bool> loginWithEmailPassword(String email, String password) async {
    if (email != 'test@gmail.com' || password != 'password') {
      throw Exception("Wrong email or password");
    }
    return true;
  }

  Future<UserModel> fetchUser() async {
    final response = await HttpClient.instance.fetchData("/users/1");
    print("Response - $response");
    return UserModel.fromJson(response);
  }
}
