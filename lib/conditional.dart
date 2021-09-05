void postMessage() {
  throw UnimplementedError(
      "postMessage() not implemented for non-html clients.");
}

void configureApp() {
  // noop
}

String redirectUrl() {
  return "com.diplicity.diplodocus:/OAuth2";
}
