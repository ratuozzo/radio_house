import 'package:flutter_hooks/flutter_hooks.dart';

import 'use_async_effect_hook.dart';

/// Hook that executes the provided [callback] once.
void useInit(void Function() callback) {
  useEffect(
    () {
      callback();
      return null;
    },
    [],
  );
}

/// Hook that executes the provided [callback] once asynchronously.
void useInitAsync(void Function() callback) {
  useAsyncEffect(
    () async {
      callback();
      return null;
    },
    [],
  );
}
