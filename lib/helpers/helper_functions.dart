import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{

  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN4";

  static Future<bool> saveUserLoggedInSharedPreference(bool isUserLoggedIn) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> getUserLoggedInSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferenceUserLoggedInKey);
  }

  static String getImgTipo(String tipo) {
    switch (tipo) {
      case 'Outro':
        return 'assets/imgs/outros.png';
        break;
      case 'Fruta':
        return 'assets/imgs/frutas.png';
        break;
      case 'Legume':
        return 'assets/imgs/outros.png';
        break;
      case 'Carne':
        return 'assets/imgs/carne.png';
        break;
      case 'Laticinio':
        return 'assets/imgs/laticinios.png';
        break;
      case 'Tempero':
        return 'assets/imgs/outros.png';
        break;
      case 'Doce':
        return 'assets/imgs/doce.png';
        break;
      case 'Bebida sem Alcool':
        return 'assets/imgs/drink_s.png';
        break;
      case 'Bebida com Alcool':
        return 'assets/imgs/drink_a.png';
        break;
      case 'Molho':
        return 'assets/imgs/outros.png';
        break;
      default:
        return 'assets/imgs/outros.png';
    }
    
  }
}