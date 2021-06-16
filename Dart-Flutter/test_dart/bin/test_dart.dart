import 'dart:h';
void main() async {
  final queryParams = {'q': 'database', 'data': 'cow'};
  final url = 'www.techopedia.com';
  final charactersPath = '/search.aspx';
  final uri = Uri.https(url, charactersPath, queryParams);
  uri.queryParameters.forEach((key, value) {
    print('$key key with $value value');
  });
}
