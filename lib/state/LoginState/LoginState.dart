
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginState, bool>((ref) {
  return LoginState();
});

class LoginState extends StateNotifier<bool> {
  LoginState(): super(true);

  void toggle() => state = !state;
}