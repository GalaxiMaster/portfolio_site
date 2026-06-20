import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppBody {
  home('Home'),
  contact('Contact');

  final String label;
  const AppBody(this.label);
}

class AppBodyNotifier extends Notifier<AppBody> {
  AppBody? previousPage;

  @override
  AppBody build() => AppBody.home;

  void switchTo(AppBody body) => state = body;
}

final appBodyProvider = NotifierProvider<AppBodyNotifier, AppBody>(
  AppBodyNotifier.new,
);