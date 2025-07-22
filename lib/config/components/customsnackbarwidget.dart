

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clean_architecture_weather_new_app/allpaths.dart';

class CustomSnackbarWidget{


  static Customsnackbar(BuildContext context,String title,String message,ContentType contenttype){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          elevation: 10,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
        content:AwesomeSnackbarContent(
            title: title,
            message: message,
            contentType: contenttype) ));
  }
}