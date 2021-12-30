import 'package:supabase/supabase.dart';

abstract class AppDataBase {
  Future<void> login({required String email, required String password});
  Future<void> createAccount({
    required String email,
    required password,
    required name,
  });
}
