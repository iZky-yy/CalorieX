import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import 'api_service.dart';
import 'shared_pref_service.dart';

class AuthService {

  // LOGIN
  Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {

    try {

      final response = await http.post(

        Uri.parse(
          '${ApiService.baseUrl}/login',
        ),

        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },

        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 &&
          data['status'] == true) {

        await SharedPrefService.saveToken(
          data['token'],
        );

        return {
          'status': true,
          'message': data['message'],
        };
      }

      return {
        'status': false,
        'message': data['message'],
      };

    } catch (e) {

      return {
        'status': false,
        'message': 'Server tidak dapat diakses',
      };
    }
  }

  Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
  ) async {

    try {

      final response = await http.post(

        Uri.parse(
          '${ApiService.baseUrl}/register',
        ),

        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },

        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 ||
          response.statusCode == 201) {

        return {
          'status': true,
          'message': data['message'],
        };
      }

      return {
        'status': false,
        'message': data['message'],
      };

    } catch (e) {

      return {
        'status': false,
        'message': 'Server tidak dapat diakses',
      };
    }
  }

  Future<UserModel?> getProfile() async {

    try {

      final token =
          await SharedPrefService.getToken();

      final response = await http.get(

        Uri.parse(
          '${ApiService.baseUrl}/user',
        ),

        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {

        return UserModel.fromJson(data);
      }

      return null;

    } catch (e) {

      return null;
    }
  }
}