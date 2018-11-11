library flutter_app_sp.globals;

bool isLoggedIn = false;

class Singleton {
  static final Singleton _singleton = new Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}
