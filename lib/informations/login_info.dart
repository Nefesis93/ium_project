/*
file che mantiente le informazioni di login di un utente
*/
class UserLogin {
  static final UserLogin _user = UserLogin._internal();

  bool _isLoggedIn = true;

  UserLogin._internal();

  factory UserLogin() {
    return _user;
  }

  void login() {
    _isLoggedIn = true;
  }

  void logout() {
    _isLoggedIn = false;
  }

  bool getLoginInfo() {
    return _isLoggedIn;
  }
}