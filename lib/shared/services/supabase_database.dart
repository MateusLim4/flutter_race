import 'package:supabase/supabase.dart';

import 'app_database.dart';

class SupabaseDataBase implements AppDataBase {
  late final SupabaseClient client;

  //Construtor da classe abstrata
  SupabaseDatabase() {
    init();
  }

  void init() {
    client = SupabaseClient(
      const String.fromEnvironment('SUPABASEURL'),
      const String.fromEnvironment('SUPABASEKEY'),
    );
  }

  @override
  Future<void> createAccount(
      {required String email, required password, required name}) {
    // TODO: implement createAccount
    throw UnimplementedError();
  }

  @override
  Future<void> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
