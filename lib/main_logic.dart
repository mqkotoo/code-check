import 'dart:convert';
import 'package:http/http.dart' as http;

import 'data/repository_data.dart';

class Logic{

  Future<RepositoryData> getRepositoryData(String repositoryData) async{


    final apiUrl = 'https://api.github.com/search/repositories?q=$repositoryData';

    final apiUri = Uri.parse(apiUrl);

    http.Response response = await http.get(apiUri);

    if(response.statusCode != 200) {
      throw Exception("No repository data!: $repositoryData");
    }

    var jsonData = json.decode(response.body);


    return RepositoryData.fromJson(jsonData);

  }

  bool willProceed(String repositoryData) {
    return repositoryData.isNotEmpty;
  }

}