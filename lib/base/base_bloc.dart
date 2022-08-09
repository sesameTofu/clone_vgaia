import 'dart:async';

abstract class Bloc {
  void init() {}

  void dispose() {}
}

abstract class LoadingPrefer {
  Stream<bool> get loadingStream;
}

mixin ProgressBlocMixin on Bloc implements LoadingPrefer {
  final StreamController<bool> _loadingController = StreamController<bool>();
  @override
  Stream<bool> get loadingStream => _loadingController.stream;

  set loading(bool show) => _loadingController.sink.add(show);

  @override
  void dispose() {
    _loadingController.close();
    super.dispose();
  }
}
