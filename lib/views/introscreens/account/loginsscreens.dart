


import 'package:clean_architecture_weather_new_app/allpaths.dart';
import 'package:clean_architecture_weather_new_app/config/data/vallidations/vallidations.dart';
import '../../../bloc/signupbloc/signupbloc.dart';

class Loginsscreens extends StatefulWidget {
  const Loginsscreens({super.key});

  @override
  State<Loginsscreens> createState() => _LoginsscreensState();
}

class _LoginsscreensState extends State<Loginsscreens>with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 3))..repeat();
  }
  TextEditingController emailcontroller  = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              children: [
                Decorationcontainers(text: "WelCome Back",),
                SizedBox(height: 60,),
                BlocBuilder<SignupBloc, SignUpStates>(
                  buildWhen: (previews,current)=>previews.email != current.email,
                builder: (context, state) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    emailcontroller.text = state.email;
                  });
                  return Textfieldwidget(
                  hinttext: 'Email',
                  controller: emailcontroller,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return  "Please enter email";
                    }else if(!Vallidationsemails().isValidEmail(value.toString())){
                      return "Please enter vallid email";
                    }
                    return null;
                  },

                  preffixicon: Icon(Icons.email),
                  func: (value){
                    context.read<SignupBloc>().add(ChangeEmail(email:value));
                  },
                  textInputType: TextInputType.text,);
  },
),
                SizedBox(height: 10,),
                BlocBuilder<SignupBloc, SignUpStates>(
                  builder: (context, state) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      passwordcontroller.text = state.password;
                    });
                    return Textfieldwidget(
                      hinttext: 'Password',
                      suffixicon: IconButton(onPressed: (){
                        context.read<SignupBloc>().add(ShowOrHidePassword());
                      }, icon: Icon(state.showpassword?Icons.visibility_off:Icons.visibility)),
                      obstacttext: state.showpassword,
                      controller: passwordcontroller,
                      validator: (value)=>Vallidationsemails().vallidatepassword(value.toString()),
                      func: (value){
                        context.read<SignupBloc>().add(ChangePassword(password: value));
                      },
                      preffixicon: Icon(Icons.password),
                      textInputType: TextInputType.text,);
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 48.0),
                  child: Align(alignment: Alignment.topRight,
                  child: Textbuttonwidgets(callback: (){
                    Navigator.pushNamed(context, RouteNames.forgetpassword);
                  }, title: "Forget Password?",),),
                ),

                SizedBox(height: 80,),
                LoginButtonwidget(
                  formkey: _formkey,
                  controller: _controller,
                  emailcontroller: emailcontroller,
                  passwordcontroller: passwordcontroller,
                  context: context,
                ),
                SizedBox(height: 40,),
                CustomGoogleSigninwidget(),
                SizedBox(height: 70,),
                AccountFloadtingRow(txt: "Don't have account?",
                    buttonname: "Signup", callback: (){
                      Navigator.pushReplacementNamed(context, RouteNames.signupscreen);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


