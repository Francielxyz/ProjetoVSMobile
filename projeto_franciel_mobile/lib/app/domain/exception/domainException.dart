class DomainException implements Exception{
  String causa;

  DomainException(this.causa);

  @override
  String toString() => causa;
}