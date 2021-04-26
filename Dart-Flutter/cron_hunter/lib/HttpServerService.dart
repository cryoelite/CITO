import 'dart:io';
import 'dart:async';

class HttpServerService {
  final InternetAddress _address;
  final InternetAddressType _internetAddressType;
  final int _port;

  HttpServerService({
    required final String address,
    required final InternetAddressType internetAddressType,
    final int port = 4044,
  })  : _internetAddressType = internetAddressType,
        _port = port,
        _address = InternetAddress(address, type: internetAddressType);

  Future<void> startServer() async {
    final server = await HttpServer.bind(_address, _port);
    await for (var request in server) {
      request.response.writeln('Hewwwwo');
      await request.response.close();
    }
  }
}
