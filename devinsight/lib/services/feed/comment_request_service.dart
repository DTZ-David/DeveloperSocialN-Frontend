import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:devinsight/models/publication/comment_request.dart';

import '../../config/constants/app.dart';

class CommentRequestService {
  Future<void> sendComment(CommentRequest request, String token) async {
    final url = Uri.parse('${AppConfig.baseUrl}/userposts/addcomment');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'postId': request.postId,
        'commentText': request.commentText,
        'interactionType': _mapInteractionType(request.interactionType),
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al enviar comentario');
    }
  }

  int _mapInteractionType(String type) {
    switch (type.toLowerCase()) {
      case 'comment':
        return 0;
      case 'careful':
        return 1;
      case 'verify':
        return 2;
      default:
        return 0;
    }
  }
}
