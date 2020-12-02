import '../models/Categoria.dart';
import '../repository/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriaService {
  Repository<Categoria, int> repository;

  CategoriaService(Repository<Categoria, int> repository) {
    this.repository = repository;
  }

  cadastrar(Categoria categoria) async {
    repository.cadastrar(categoria);
  }

  Future<List<Categoria>> buscarTodos() {
    return repository.buscarTodos("categoria");
  }

  alterar(Categoria categoria, String id) {
    repository.alterar('categoria', categoria, id);
  }

  excluir(String id) {
    repository.excluir("categoria", id);
  }
}
