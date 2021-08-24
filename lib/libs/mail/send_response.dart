import 'send_response_status.dart';

class SendResponse {
  final SendResponseStatus status;
  final String message;

  SendResponse({required this.status, this.message = ''});
}
