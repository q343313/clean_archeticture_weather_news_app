
import 'package:clean_architecture_weather_new_app/allpaths.dart';
import 'package:clean_architecture_weather_new_app/bloc/signupbloc/signupbloc.dart';
import 'package:clean_architecture_weather_new_app/config/components/customcheckboxwidgets.dart';
import 'package:clean_architecture_weather_new_app/config/data/vallidations/vallidations.dart';

class Signupscreens extends StatefulWidget {
  const Signupscreens({super.key});

  @override
  State<Signupscreens> createState() => _SignupscreensState();
}

class _SignupscreensState extends State<Signupscreens> with TickerProviderStateMixin{
  late AnimationController _container;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SignupBloc>().add(AgainInitial());
    _container = AnimationController(vsync: this,duration: Duration(seconds: 3))..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _container.dispose();
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: Form(
         key: _formkey,
         child: Center(
             child: Column(
               children: [
                 Decorationcontainers(text: "Create Account",),
                 SizedBox(height: 60,),
                 Textfieldwidget(
                   hinttext: 'Email',
                   validator: (value){
                     if(value == null ||value.isEmpty){
                       return "Please enter email";}
                    else if(!Vallidationsemails().isValidEmail(value.toString())){
                      return "Enter Vallid email";}
                    return null;
                   },
                   controller: emailcontroller,
                   preffixicon: Icon(Icons.email),
                   func: (value){
                     context.read<SignupBloc>().add(ChangeEmail(email: value));
                   },
                   textInputType: TextInputType.text,),
                 SizedBox(height: 10,),
                 BlocBuilder<SignupBloc, SignUpStates>(
                    builder: (context, state) {
                      return Textfieldwidget(
                   hinttext: 'Password',
                   suffixicon: IconButton(onPressed: (){
                     context.read<SignupBloc>().add(ShowOrHidePassword());
                   }, icon: Icon(state.showpassword?Icons.visibility_off:Icons.visibility)),
                   obstacttext: state.showpassword,
                   controller: passwordcontroller,
                   validator:(value)=>Vallidationsemails().vallidatepassword(value.toString()),
                   func: (value){
                     context.read<SignupBloc>().add(ChangePassword(password: value));
                   },
                   preffixicon: Icon(Icons.password),
                   textInputType: TextInputType.text,);
  },
),
                 Customcheckboxwidgets(),

                 SizedBox(height: 90,),
                 CustomAuthButton(
                   formkey: _formkey,
                   controller: _container,
                   emailcontroller: emailcontroller,
                   passwordcontroller: passwordcontroller,
                   context: context,
                 ),
                 SizedBox(height: 40,),
                 CustomGoogleSigninwidget(),
                 SizedBox(height: 60,),
                 AccountFloadtingRow(txt: "Already have account?",
                     buttonname: "Login", callback: (){
                       Navigator.pushReplacementNamed(context, RouteNames.loginscreen);
                     }),
               ],
             ),
           ),
       ),
     ),
    );
  }
}




