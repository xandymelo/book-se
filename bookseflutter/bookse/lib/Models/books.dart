class Book {
  late String isbn13;
  late String isbn10;
  late String titulo;
  late String subtitulo;
  late String autor;
  late String categoria;
  late String thumbmail;
  late String descricao;
  late int ano_publicacao;
  late double media_nota;
  late int num_paginas;
  late int quantidade_avaliacoes;

  Book(
      this.isbn13,
      this.isbn10,
      this.titulo,
      this.subtitulo,
      this.autor,
      this.categoria,
      this.thumbmail,
      this.descricao,
      this.ano_publicacao,
      this.media_nota,
      this.num_paginas,
      this.quantidade_avaliacoes);
}

//isbn13,isbn10,title,subtitle,authors,categories,thumbnail,description,published_year,average_rating,num_pages,ratings_count