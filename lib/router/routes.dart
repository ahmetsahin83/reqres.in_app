enum Routes {
  login,
  home,
}

extension RoutesExtension on Routes {
  String get path {
    return "/$name";
  }
}
