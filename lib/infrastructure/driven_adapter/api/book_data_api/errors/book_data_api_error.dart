class BookDataApiError implements Exception{

  @override
  String toString(){
    return 'Error al obtener la consulta de los libros';
  }
}