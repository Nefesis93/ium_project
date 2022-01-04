/*
file che contiene tutte le variabili globali che utilizzaremo nell'app
*/
class UserLogin {
  static final UserLogin user = UserLogin._internal();

  bool isLoggedIn = false;

  UserLogin._internal();

  factory UserLogin() {
    return user;
  }

  void login() {
    isLoggedIn = true;
  }

  void logout() {
    isLoggedIn = false;
  }

  bool getLoginInfo() {
    return isLoggedIn;
  }
}