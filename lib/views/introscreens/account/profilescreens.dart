


import 'package:clean_architecture_weather_new_app/bloc/imagebloc/imagesbloc.dart';
import 'package:clean_architecture_weather_new_app/bloc/signupbloc/signupbloc.dart';
import 'package:clean_architecture_weather_new_app/config/components/elevatedbuttonwidget.dart';
import 'package:clean_architecture_weather_new_app/config/data/vallidations/vallidations.dart';
import '../../../allpaths.dart';
import '../../../config/components/customiamgeavatar.dart';

class Profilescreens extends StatefulWidget {
  const Profilescreens({super.key});

  @override
  State<Profilescreens> createState() => _ProfilescreensState();
}

class _ProfilescreensState extends State<Profilescreens> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController userbiocontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Decorationcontainers(text: "Add Profile Data",),
                SizedBox(height: 50,),
                BlocBuilder<ImageBloc,ImageStates>(builder: (context,state){
                  final image = state.imagefile;
                  if(image != null && image.path.isNotEmpty){
                    context.read<SignupBloc>().add(ChangeUserImage(userimage: image.path));
                  }
                  return InkWell(
                    onTap:(){
                      showimagedialog(context);},
                    child:image == null || image.path.isEmpty?CustomContImage() :Customiamgeavatar(image: image.path.toString()??"",),
                  );
                }),
                SizedBox(height: 20,),
                Textfieldwidget(hinttext: "UserName",
                    controller: usernamecontroller,
                    validator: (value)=>Vallidationsemails.usernamevallidation(value.toString()),
                    preffixicon: Icon(Icons.person_remove),
                    func: (value){
                      context.read<SignupBloc>().add(ChangeUserName(username: value));
                    },
                    textInputType: TextInputType.text),
                SizedBox(height: 10,),
                Textfieldwidget(hinttext: "UserBio",
                    height: 100,
                    controller: userbiocontroller,
                    validator: (value)=>Vallidationsemails.Userbiovallidation(value.toString()),
                    preffixicon: Icon(Icons.account_circle_rounded),
                    func: (value){
                  context.read<SignupBloc>().add(ChangeUserBio(userbio: value));
                    },
                    textInputType: TextInputType.text)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: AddProfileDataButton(userbiocontroller: userbiocontroller,
          usernamecontroller: usernamecontroller, formkey: _formkey),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}

class AddProfileDataButton extends StatelessWidget {
  const AddProfileDataButton({super.key,required this.userbiocontroller,required this.usernamecontroller,required this.formkey});

  final GlobalKey<FormState>formkey;
  final TextEditingController usernamecontroller;
  final TextEditingController userbiocontroller;

  @override
  Widget build(BuildContext context) {
    return  Elevatedbuttonwidget(
        child:
        Text("Add Profile",
          style: TextStyle(
              fontSize: 23,
              fontFamily: "semibold",
              color: AppColors.scaffoldlightmode
          ),
        ), callback: (){
      if(formkey.currentState!.validate()){
        context.read<SignupBloc>().add(UserDataSaveHive());
        Navigator.pushReplacementNamed(context, RouteNames.navigation);
        context.read<ImageBloc>().add(DeleteImage());
        usernamecontroller.clear();
        userbiocontroller.clear();
      }
    });
  }
}




