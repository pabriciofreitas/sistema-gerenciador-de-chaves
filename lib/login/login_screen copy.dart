import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

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
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Esqueci minha senha",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors.black;
                                  }
                                  return Colors.green;
                                }),
                                value: loginController.remembePassword,
                                onChanged: (value) {
                                  loginController.remembePassword =
                                      !loginController.remembePassword;
                                  loginController.update();
                                }),
                            const Text(
                              "Lembrar senha",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )
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

class FondoPaint1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    curva1(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void curva1(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.green;
    paint.style = PaintingStyle
        .fill; // .stroke es para dibujar una linea y  .fill es para pintar todo
    paint.strokeWidth = 10.0;

    final path = Path();

    /*
    (0,0)-(0,size.heigth)-(size.width,size.heigth)-(size.width,0)
     */

    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.17,
        size.width * 0.5, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.27, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.moveTo(0, size.height * 0.9); //salto del pincel o lapiz
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height); //verde forte baixo
    path.lineTo(size.width, size.height * 0.85); //verde forte baixo
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.2, size.height * 0.88, 0, size.height * 0.9);

    canvas.drawPath(path, paint); //esto es lo que permite que se dibuje todo
  }
}

class FondoPaint2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    curva1(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  //
  void curva1(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.green;
    paint.style = PaintingStyle
        .fill; // .stroke es para dibujar una linea y  .fill es para pintar todo
    paint.strokeWidth = 10.0;

    final path = Path();

    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.3, size.height * 0.25, size.width, size.height * 0.25);

    path.moveTo(0, size.height * 0.9);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.47);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.8, 0, size.height * 0.9);

    canvas.drawPath(path, paint);
  }
}
