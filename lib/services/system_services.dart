
class SystemServices {

  Stream<DateTime> timeNow() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 5));
      yield DateTime.now();
    }
  }

}
