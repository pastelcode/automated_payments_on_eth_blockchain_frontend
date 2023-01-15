part of 'main.dart';

/// A bloc observer for all blocs in application.
class ApplicationBlocObserver extends BlocObserver {
  @override
  void onEvent(
    Bloc<dynamic, dynamic> bloc,
    Object? event,
  ) {
    super.onEvent(
      bloc,
      event,
    );
    log(
      'Event: $event',
      name: '${bloc.runtimeType}',
    );
  }

  @override
  void onChange(
    BlocBase<dynamic> bloc,
    Change<dynamic> change,
  ) {
    super.onChange(
      bloc,
      change,
    );
    log(
      '$change',
      name: '${bloc.runtimeType}',
    );
  }

  @override
  void onError(
    BlocBase<dynamic> bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    log(
      'Error: $error\nStack trace: $stackTrace',
      name: '${bloc.runtimeType}',
    );
    super.onError(
      bloc,
      error,
      stackTrace,
    );
  }
}
