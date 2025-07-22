




import 'package:clean_architecture_weather_new_app/allpaths.dart';
import 'package:clean_architecture_weather_new_app/config/data/vallidations/vallidations.dart';
import 'package:clean_architecture_weather_new_app/views/introscreens/account/signupscreens.dart';
import '../../../bloc/signupbloc/signupbloc.dart';

class Forgetpasswordscreens extends StatefulWidget {
  const Forgetpasswordscreens({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Forgetpasswordscreens();
  }

}

class _Forgetpasswordscreens extends State<Forgetpasswordscreens>with TickerProviderStateMixin {
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
                SizedBox(height: 80,),
                Forgetuserpasswordbutton(
                  formkey: _formkey,
                  controller: _controller,
                  emailcontroller: emailcontroller,
                  context: context,
                ),
                SizedBox(height: 40,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


