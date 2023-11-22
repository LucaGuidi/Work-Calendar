class Failure {
  final String message;
  final String? translationKey;
  final int? status;
  final dynamic cause;

  const Failure(
    this.message, {
    this.translationKey,
    this.status,
    this.cause,
  });

  const Failure.generic()
      : message = 'An error occured. Try again',
        translationKey = 'ERR_GENERIC',
        status = null,
        cause = null;

  const Failure.missingPermission()
      : message = 'Missing permissions',
        translationKey = 'ERR_PERMISSIONS',
        status = null,
        cause = null;

  const Failure.network()
      : message = 'Network error',
        translationKey = 'ERR_NETWORK',
        status = null,
        cause = null;

  const Failure.serverError()
      : message = 'Internal server error',
        translationKey = 'SERVER_ERROR',
        status = null,
        cause = null;

  factory Failure.fromException(Exception e) => Failure(e.toString());

  factory Failure.fromError(dynamic e) {
    if (e is Exception) {
      return Failure.fromException(e);
    }
    return Failure(e.toString());
  }
}
