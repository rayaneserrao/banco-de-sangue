abstract interface class ClientService {
  Future get(String uri);
  Future post(String uri, List<Object> value, {String contentType});
  Future patch(String uri, Object value);
  Future delete(String uri);
}
