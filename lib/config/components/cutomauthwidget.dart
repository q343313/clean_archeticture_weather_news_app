



import '../../allpaths.dart';

class AccountFloadtingRow extends StatelessWidget {
  const AccountFloadtingRow({super.key,required this.txt,required this.buttonname,required this.callback});

  final String txt;
  final String buttonname;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Customtextwidget(text: txt,
          fontsize: 20,
          fontfamily: "semibold",
        ),
        Textbuttonwidgets(callback:callback, title: buttonname),


      ],
    );
  }
}


class CustomGoogleSigninwidget extends StatelessWidget {
  const CustomGoogleSigninwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customtextwidget(text: "OR", fontsize: 20,fontfamily: "bold",),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCircleAvatar(radius: 20,image: "go1.jpg",),
            SizedBox(width: 5,),
            CustomCircleAvatar(radius: 20,image: "ph1.png",)
          ],
        )
      ],
    );
  }
}



class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key,required this.radius,this.image,this.color,this.callback});

  final String?image;
  final Color? color;
  final double?radius;
  final VoidCallback?callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: CircleAvatar(
        backgroundColor: color,
        backgroundImage: AssetImage("assets/images/$image"),
        radius: radius,
      ),
    );
  }
}