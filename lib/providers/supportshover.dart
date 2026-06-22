import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mouseConnectedProvider = NotifierProvider<MouseConnectedNotifier, bool>(
  MouseConnectedNotifier.new,
);

class MouseConnectedNotifier extends Notifier<bool> {
  @override
  bool build() {
    final tracker = RendererBinding.instance.mouseTracker;

    void listener() => state = tracker.mouseIsConnected;
    tracker.addListener(listener);
    ref.onDispose(() => tracker.removeListener(listener));

    return tracker.mouseIsConnected;
  }
}