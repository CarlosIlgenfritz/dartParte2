import 'repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Categoria.dart';
import '../models/Produto.dart';

class RepositoryImpl<T, ID> implements Repository<T, ID> {
  List<T> _lista = List<T>();

  List<T> get lista => _lista;
  @override
  Future<T> cadastrar(T obj) async {
    if (obj is Categoria) {
      var bodyEncoded = json.encode(obj);
      var url = 'http://localhost:3000/adicionaCategoria';
      var response = await http.post(
        url,
        body: bodyEncoded,
        headers: {'Content-Type': 'application/json'},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

    if (obj is Produto) {
      var bodyEncoded = json.encode(obj);
      var url = 'http://localhost:3000/adicionaProduto';
      var response = await http.post(
        url,
        body: bodyEncoded,
        headers: {'Content-Type': 'application/json'},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    return null;
  }

  @override
  Future<T> alterar(String tipo, T obj, String id) async {
    if (tipo == "categoria") {
      var bodyEncoded = json.encode(obj);
      var url = 'http://localhost:3000/atualizaCategoria/${id}';
      var response = await http.put(
        url,
        body: bodyEncoded,
        headers: {'Content-Type': 'application/json'},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    if (tipo == "produto") {
      var bodyEncoded = json.encode(obj);
      var url = 'http://localhost:3000/atualizaProduto/${id}';
      var response = await http.put(
        url,
        body: bodyEncoded,
        headers: {'Content-Type': 'application/json'},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    return null;
  }

  @override
  T buscarPorID(ID o) {}

  @override
  Future<void> excluir(String tipo, String id) async {
    if (tipo == "categoria") {
      var url = 'http://localhost:3000/deletaCategoria/${id}';
      var response = await http.delete(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    if (tipo == "produto") {
      var url = 'http://localhost:3000/deletaProduto/${id}';
      var response = await http.delete(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    return null;
  }

  @override
  Future<List<T>> buscarTodos(String categoria) async {
    if (categoria == "categoria") {
      var url = 'http://localhost:3000/listaCategoria';
      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    if (categoria == "produto") {
      var url = 'http://localhost:3000/listaProduto';
      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    return null;
  }
}
