class Produto {
  String categoriaId;
  String nome;
  int valor;
  String descricao;

  Produto({this.categoriaId, this.nome, this.valor, this.descricao});

  Produto.fromJson(Map<String, dynamic> json) {
    categoriaId = json['categoriaId'];
    nome = json['nome'];
    valor = json['valor'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['categoriaId'] = this.categoriaId;
    data['nome'] = this.nome;
    data['valor'] = this.valor;
    data['descricao'] = this.descricao;

    return data;
  }
}
