import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../common/custon_canvas.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Opacity(
              opacity: 0.8,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: CustomPaint(
                  painter: FondoPaint1(),
                ),
              ),
            ),
            Opacity(
              opacity: 0.4,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: CustomPaint(
                  painter: FondoPaint2(),
                ),
              ),
            ),
            Center(
              child: GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (loginController) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("ENTRAR", style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),),

                        SizedBox(height: 24,),
                        Form(
                          key: _formkey,
                          child: SizedBox(
                            width: size.width * 0.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  focusNode: _emailFocus,
                                  onFieldSubmitted: (email) {
                                    _emailFocus.unfocus();
                                    FocusScope.of(context)
                                        .requestFocus(_passFocus);
                                  },
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(left: 16),
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.green,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40.0))),
                                    hintText: 'E-MAIL',
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    suffixIcon: Icon(Icons.people),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextFormField(
                                  onFieldSubmitted: (email) {
                                    _passFocus.unfocus();
                                  },
                                  focusNode: _passFocus,
                                  obscureText: loginController.passObscure,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.only(left: 16),
                                      filled: true,
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.green,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40.0))),
                                      hintText: 'SENHA',
                                      hintStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          loginController.passObscure =
                                              !loginController.passObscure;
                                          loginController.update();
                                        },
                                        icon: loginController.passObscure
                                            ? const Icon(
                                                Icons.visibility_outlined,
                                                // color: Theme.of(context)
                                                //     .colorScheme
                                                //     .primary,
                                              )
                                            : const Icon(
                                                Icons.visibility_off_outlined,
                                                // color: Theme.of(context)
                                                //     .colorScheme
                                                //     .primary,
                                              ),
                                      )),
                                ),
                                SizedBox(height: 24,)
                                // TextButton(
                                //   onPressed: () {},
                                //   child: const Text(
                                //     "Esqueci minha senha",
                                //     style: TextStyle(
                                //       color: Colors.blue,
                                //       decoration: TextDecoration.underline,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 130,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                            child: const Text(
                              "ENTRAR",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Checkbox(
                        //         fillColor:
                        //             MaterialStateProperty.resolveWith<Color>(
                        //                 (states) {
                        //           if (states.contains(MaterialState.disabled)) {
                        //             return Colors.black;
                        //           }
                        //           return Colors.green;
                        //         }),
                        //         value: loginController.remembePassword,
                        //         onChanged: (value) {
                        //           loginController.remembePassword =
                        //               !loginController.remembePassword;
                        //           loginController.update();
                        //         }),
                        //     const Text(
                        //       "Lembrar senha",
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //   ],
                        // )
                        TextButton(
                                  onPressed: () {
                                      Navigator.pushNamed(context, "/signup");
                                  },
                                  child: const Text(
                                    "Não possui uma conta? Criar Conta",
                                    style: TextStyle(
                                     fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
