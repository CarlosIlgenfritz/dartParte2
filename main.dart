import 'dart:io';

import 'models/Categoria.dart';
import 'repository/categoria-repository.dart';
import 'repository/repository.dart';
import 'services/categoria-service.dart';
import 'models/Produto.dart';
import 'repository/produto-repository.dart';
import 'services/produto-service.dart';

main() async {
  var opcao = "-1";

  while (opcao != "0") {
    print('Escolha uma opção.');
    print('Digite 1 para adicionar uma nova categora');
    print('Digite 2 para listas categorias');
    print('Digite 3 para alterar uma categoria');
    print('Digite 4 para  excluir uma categora');
    print('Digite 5 para adicionar um novo produto');
    print('Digite 6 para listas produtos');
    print('Digite 7 para alterar um produto');
    print('Digite 8 para excluir produto');
    print('Digite 0 para sair');

    CategoriaRepository repository = new CategoriaRepository();

    CategoriaService categoriaService = new CategoriaService(repository);

    opcao = stdin.readLineSync();

    if (opcao == "1") {
      print("Digite a descrição da categoria.");

      Categoria categoria = new Categoria();
      categoria.descricao = stdin.readLineSync();
      CategoriaRepository repository = new CategoriaRepository();

      CategoriaService categoriaService = new CategoriaService(repository);

      categoriaService.cadastrar(categoria);
      print("Categoria cadastrada!");
    }

    if (opcao == "2") {
      CategoriaRepository repository = new CategoriaRepository();

      CategoriaService categoriaService = new CategoriaService(repository);

      await categoriaService.buscarTodos();
    }

    if (opcao == "3") {
      CategoriaRepository repository = new CategoriaRepository();

      CategoriaService categoriaService = new CategoriaService(repository);

      await categoriaService.buscarTodos();

      print("Digite o Id da categoria que deseja alterar.");

      var idASerAlterado = stdin.readLineSync();

      print("Digite a descricao da categoria.");

      Categoria categoria = new Categoria();

      categoria.descricao = stdin.readLineSync();

      categoriaService.alterar(categoria, idASerAlterado);
    }

    if (opcao == "4") {
      CategoriaRepository repository = new CategoriaRepository();

      CategoriaService categoriaService = new CategoriaService(repository);

      await categoriaService.buscarTodos();

      print("Digite o Id da categoria que deseja excluir.");

      var idASerExcluido = stdin.readLineSync();

      categoriaService.excluir(idASerExcluido);
    }

    if (opcao == "5") {
      print(
          "Primeiro, escolha uma categoria para esse produto que será cadastrado.");

      await categoriaService.buscarTodos();

      var categoriaId = stdin.readLineSync();

      print("Digite a descrição do produto.(Tamanho mínimo são 10 letras)");
      var produtoDescricao = stdin.readLineSync();

      print("O nome do produto.");
      var nomeProduto = stdin.readLineSync();

      print("Digite o valor do produto.");
      var valorProduto = stdin.readLineSync();

      Produto produto = new Produto();

      produto.descricao = produtoDescricao;
      produto.nome = nomeProduto;
      produto.valor = int.parse(valorProduto);
      produto.categoriaId = categoriaId;

      ProdutoRepository produtoRepository = new ProdutoRepository();

      ProdutoService produtoService = new ProdutoService(produtoRepository);

      produtoService.cadastrar(produto);
    }

    if (opcao == "6") {
      ProdutoRepository produtoRepository = new ProdutoRepository();

      ProdutoService produtoService = new ProdutoService(produtoRepository);

      await produtoService.buscarTodos();
    }

    if (opcao == "7") {
      ProdutoRepository produtoRepository = new ProdutoRepository();

      ProdutoService produtoService = new ProdutoService(produtoRepository);

      print("Primeiro, vamos digitar os dados a serem subistituidos.");
      print("Selecione uma categoria.");

      await categoriaService.buscarTodos();

      var categoriaId = stdin.readLineSync();

      print("Digite a descrição do produto.");
      var produtoDescricao = stdin.readLineSync();

      print("O nome do produto.");
      var nomeProduto = stdin.readLineSync();

      print("Digite o valor do produto.");
      var valorProduto = stdin.readLineSync();

      Produto produto = new Produto();

      produto.descricao = produtoDescricao;
      produto.nome = nomeProduto;
      produto.valor = int.parse(valorProduto);
      produto.categoriaId = categoriaId;

      print("Agora, escolha o Id do produto que deseja alterar.");
      await produtoService.buscarTodos();
      var idDoProdutoASerAlterado = stdin.readLineSync();

      await produtoService.alterar(produto, idDoProdutoASerAlterado);
    }
    if (opcao == "8") {
      ProdutoRepository produtoRepository = new ProdutoRepository();

      ProdutoService produtoService = new ProdutoService(produtoRepository);

      await produtoService.buscarTodos();

      print("Agora, escolha o Id do produto que deseja excluir.");
      var idDoProdutoASerExcluido = stdin.readLineSync();

      produtoService.excluir(idDoProdutoASerExcluido);
    }
  }
}
