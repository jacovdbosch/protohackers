import 'dart:io';

void main(List<String> arguments) async {
  /// Start a TCP server socket we are going to handle the incoming messages
  /// on. The first implementation is a simple Echo server. This means we are
  /// going to accept requests via tcp, and any data that is being sent is
  /// going to be sent back as-is.
  var server = await ServerSocket.bind('127.0.0.1', 0);

  /// Print out the location of the TCP server.
  print("Started a server on: http://127.0.0.1:${server.port}");

  /// Listen to incoming socket client connections. Any logic needed for a new
  /// connection is handled by the Dart SDK, we are just going to handle
  /// those connections when they have been established.
  server.listen((socket) {

    /// Here we get a new connection, and start listening to that specific
    /// socket. Whenever data is sent to us by that socket we want to react
    /// to it.
    socket.listen((data) {
      socket.add(data);
      socket.close();
    });
  });
}
