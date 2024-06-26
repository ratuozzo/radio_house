// ignore_for_file: avoid_setters_without_getters

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';

import 'request_state.dart';

abstract class RequestProvider<Value> with ChangeNotifier, NetworkLoggy {
  RequestProvider({
    RequestState<Value, Exception> initial = const RequestState.initial(),
  }) : _requestState = initial;

  RequestState<Value, Exception> _requestState;

  RequestState<Value, Exception> get state => _requestState;

  bool _mounted = true;

  set _state(RequestState<Value, Exception> newState) {
    if (newState == _requestState) {
      return;
    }
    _requestState = newState;

    if (_mounted) {
      notifyListeners();
    }
  }

  Future<RequestState<Value, Exception>> executeRequest<T>({
    required ValueGetter<Future<Value>> requestBuilder,
    Exception? Function(Exception)? errorHandler,
    Value Function(Value)? valueHandler,
  }) async {
    try {
      _state = _requestState.maybeMap(
        success: (result) => RequestState.loading(resultMaybe: result.value),
        orElse: RequestState<Value, Exception>.loading,
      );

      final value = await requestBuilder();
      return _state = RequestState.success(valueHandler?.call(value) ?? value);
    } catch (error, st) {
      if (kDebugMode) loggy.error('Request Error', error, st);
      final exception = (error is Exception) ? error : Exception();
      final stateException =
          errorHandler != null ? errorHandler(exception) : exception;
      if (stateException != null) {
        return _state = RequestState.failure(stateException);
      } else {
        return _state = const RequestState.initial();
      }
    }
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  void reset() => _state = const RequestState.initial();
}
