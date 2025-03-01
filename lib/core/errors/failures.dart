abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailuer extends Failure {
  ServerFailuer(super.message);

}