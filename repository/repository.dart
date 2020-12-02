class Repository<T, ID> {
  Future<T> cadastrar(T o) {
    return null;
  }

  Future<T> alterar(String i, T o, String id) {
    return null;
  }

  Future<void> excluir(String tipo, String id) {}

  T buscarPorID(ID o) {
    return null;
  }

  Future<List<T>> buscarTodos(String o) {
    return null;
  }
}
