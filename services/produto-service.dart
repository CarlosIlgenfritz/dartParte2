import '../models/Produto.dart';
import '../repository/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProdutoService {
  Repository<Produto, int> repository;

  ProdutoService(Repository<Produto, int> repository) {
    this.repository = repository;
  }

  cadastrar(Produto produto) async {
    repository.cadastrar(produto);
  }

  Future<List<Produto>> buscarTodos() {
    return repository.buscarTodos("produto");
  }

  alterar(Produto produto, String id) {
    repository.alterar('produto', produto, id);
  }

  excluir(String id) {
    repository.excluir("produto", id);
  }
}
