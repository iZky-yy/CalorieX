import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import 'api_service.dart';
import 'shared_pref_service.dart';

class AuthService {

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

      if (response.statusCode == 200) {
        await SharedPrefService.saveToken(
          data['token'],
        );
      }

      return data;

    } catch (e) {
      return {
        'status': false,
        'message': 'Tidak dapat terhubung ke server. Pastikan API sudah berjalan.\nDetail: $e',
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

      return data;

    } catch (e) {
      return {
        'status': false,
        'message': 'Tidak dapat terhubung ke server. Pastikan API sudah berjalan.\nDetail: $e',
      };
    }
  }

  Future<UserModel?> getProfile() async {

    try {
      final token =
          await SharedPrefService.getToken();

      final response = await http.get(
        Uri.parse(
          '${ApiService.baseUrl}/profile',
        ),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return UserModel.fromJson(data['user']);
      }

      return null;

    } catch (e) {
      return null;
    }
  }
}
