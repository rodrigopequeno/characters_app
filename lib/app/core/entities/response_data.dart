class ResponseData<T> {
  final bool haveMore;
  final List<T> result;

  ResponseData({
    required this.haveMore,
    required this.result,
  });
}
