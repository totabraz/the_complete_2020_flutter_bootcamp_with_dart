


import 'dart:convert';

import 'package:http/http.dart' as http;

class MyRequest {
    Map<String, String> mapHeader = {"Authorization":"Y29tbXVuaWNhcjpwbGNrMDcxNQ=="};
    Map<String, String> mapBody = Map();

    String apiURL = "https://api.afinandoocerebro.com.br/api/listar-jogos-treino";
    String jsonHeaders = '{"Authorization": "Y29tbXVuaWNhcjpwbGNrMDcxNQ=="}';
    String jsonBody ='{ "id_usuario": "65", "token": "1addea5e78f5419d9394ea297f9a5249" }';

    MyRequest(){
      mapHeader["Authorization"] = "Y29tbXVuaWNhcjpwbGNrMDcxNQ==";
      mapBody["id_usuario"] = "65";
      mapBody["token"] = "1addea5e78f5419d9394ea297f9a5249";
      print("construtor");
    }


    makePostRequest() async {

      Map<String, String> headers = { "Authorization": "Y29tbXVuaWNhcjpwbGNrMDcxNQ==" };

      Map<String, dynamic> body = { 'token': '1addea5e78f5419d9394ea297f9a5249', 'id_usuario': '65'};

      http.Response myReq = await http.post( 'https://api.afinandoocerebro.com.br/api/listar-jogos-treino',headers: {'Authorization': 'Y29tbXVuaWNhcjpwbGNrMDcxNQ=='}, body: body);

      print(myReq.statusCode);
      print(jsonDecode(myReq.body)['jogos']);

    }


  }
