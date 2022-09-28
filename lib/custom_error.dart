class CustomError implements Exception{
  final String error;
  final String code;

  const CustomError({
    required this.error,
    required this.code,
  });
}