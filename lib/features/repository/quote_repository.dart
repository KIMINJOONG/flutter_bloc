import 'package:flutter_bloc_study/models/quote_model.dart';

import '../../network/network_helper.dart';
import '../../network/network_service.dart';

class QuoteRepository {
  final String _baseUrl = "https://api.quotable.io/random";

  Future<QuoteModel> getQuoute() async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get, url: _baseUrl);

    return NetworkHelper.filterResponse(
      callBack: (json) => QuoteModel.fromJson(json),
      response: response,
      onFailureCallBackWithMessage: (errorType, message) =>
          throw Exception('An Error has happend. $errorType - $message'),
    );
  }
}
