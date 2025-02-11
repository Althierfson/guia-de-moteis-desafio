abstract class Failure {
  String get message;
  @override
  String toString() => message;
}

class UnexpectedFailure extends Failure {
  @override
  String get message => 'Uma falha inesperada ocorreu! Tente novamente mais tarde.';
}

class ServerFailure extends Failure {
  @override
  String get message => 'Falha ao se conectar com o servidor! Tente novamente mais tarde.';
}

class LocalDatabaseFailure extends Failure {
  @override
  String get message => 'Falha oa se comunica com a base da dados local';
}

class NoInternetConnection extends Failure {
  @override
  String get message => "Você não tem acesso a internet";
}
