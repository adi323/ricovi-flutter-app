import 'package:ricovi/models/Loginstatus.dart';
import 'package:ricovi/models/SignupStatus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class authSave{
  //final SharedPreferences prefs = await SharedPreferences.getInstance();


  isloggedin()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isloggedIn");
  }

  loginUser(LoginStatus ls)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isloggedIn", ls.data!=null);
    await prefs.setString("email", ls.data!.email!);
    await prefs.setString("name", ls.data!.name!);
    await prefs.setString("phone", ls.data!.phone!);
    await prefs.setString("token", ls.data!.token!);


  }

  signupUser(String email)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isloggedIn", false);
    await prefs.setString("email", email);


  }

  savetoken(String token)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  gettoken()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  getname()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }

  getemail()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  updatename(String name,String phone)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
    await prefs.setString("phone", phone);
  }

}