import 'package:clean_architecture_weather_new_app/allpaths.dart';
import 'package:clean_architecture_weather_new_app/bloc/signupbloc/signupbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Customcheckboxwidgets extends StatelessWidget {
  const Customcheckboxwidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignUpStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: InkWell(
          onTap: (){
            context.read<SignupBloc>().add(UserCheckBoxButtone());
          },
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(value: state.checkbox,
                    onChanged: (value) {}),
                Customtextwidget(
                    text: "i agree to accept all the term and condition and privicy\n of this app.",
                    fontsize: 12)
              ],
            ),
          ),
        );
      },
    );
  }
}
