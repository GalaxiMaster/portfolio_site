import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppPage {
  home('Home', '/'),
  contact('Contact', '/contact');
  
  final String name;
  final String route;
  const AppPage(this.name, this.route);
}

class AppBodyNotifier extends Notifier<AppPage> {
  AppPage? previousPage;

  @override
  AppPage build() => AppPage.home;

  void switchTo(AppPage body) => state = body;
}

final appBodyProvider = NotifierProvider<AppBodyNotifier, AppPage>(
  AppBodyNotifier.new,
);