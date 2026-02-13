abstract class Failure{
  final String errorMessage;
  const Failure(this.errorMessage);

}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}