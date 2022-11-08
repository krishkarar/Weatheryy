import 'package:http/http.dart' as http;
import 'dart:convert';

class networkingHelper{
  networkingHelper(this.url);

  final String url;

  Future getData() async{
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode==200){
      String data = response.body;
      
      return jsonDecode(data); 
    }
    else{
      print(response.statusCode);
    }
  }
}

//
// var temperature = json.decode(data)['main']['temp'];
// var id = json.decode(data)['weather'][0]['id'];
// var name = json.decode(data)['name'];
//
// print(temperature);
// print(id);
// print(name);