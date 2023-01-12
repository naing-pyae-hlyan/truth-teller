void doAfterBuild({
  required Function() callback,
  Duration duration = Duration.zero,
}) =>
    Future.delayed(duration, callback);


