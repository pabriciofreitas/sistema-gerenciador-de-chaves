import 'package:brasil_fields/brasil_fields.dart';
import 'package:chave/signup/signup_controler.dart';
import 'package:chave/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../common/custon_canvas.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  final FocusNode _nomeFocus = FocusNode();
  final FocusNode _cpfFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();
  final FocusNode _pass2Focus = FocusNode();
 
  final TextEditingController _nomeTextFormFieldController = TextEditingController();
  final TextEditingController _cpfTextEditingController = TextEditingController();
  final TextEditingController _phoneTextEditingController = TextEditingController();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passTextEditingController = TextEditingController();
  final TextEditingController _pass2TextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: SafeArea(
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
                child: GetBuilder<SignUpController>(
                    init: SignUpController(),
                    builder: (signUpController) {
                      return SingleChildScrollView(
                        child: 
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("CADASTRO", style: TextStyle(
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
                                        validator: (value) {
                                          if(value==null || value.isEmpty){
                                            return "Digite seu nome";
                                          }
                                        },
                                        controller: _nomeTextFormFieldController,
                                        focusNode: _nomeFocus,
                                        onFieldSubmitted: (nome) {
                                          _nomeFocus.unfocus();
                                          FocusScope.of(context)
                                              .requestFocus(_cpfFocus);
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
                                          hintText: 'NOME',
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
                                          validator: (value) {
                                          if(value==null || value.isEmpty){
                                            return "Digite seu CPF!";
                                          }else if(!UtilBrasilFields.isCPFValido(value)){
                                            return "Digite um CPF válido!";
                                          }else{
                                            return null;
                                          }
                                        },
                                           controller: _cpfTextEditingController,
                                        inputFormatters: [
                                            // obrigatório
                                            FilteringTextInputFormatter.digitsOnly,
                                            CpfInputFormatter(),
                                          ],
                                          keyboardType: TextInputType.number,
                                        focusNode: _cpfFocus,
                                        onFieldSubmitted: (cpf) {
                                          _cpfFocus.unfocus();
                                          FocusScope.of(context)
                                              .requestFocus(_emailFocus);
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
                                          hintText: 'CPF',
                                          
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
                                          validator: (value) {
                                          if(value==null || value.isEmpty){
                                            return "Digite um contato!";
                                          }else if(value.length <14){
                                            return "Digite um contato válido";
                                          }else{
                                            return null;
                                          }
                                    
                                        },
                                           controller: _phoneTextEditingController,
                                        inputFormatters: [
                                            // obrigatório
                                            FilteringTextInputFormatter.digitsOnly,
                                            TelefoneInputFormatter(),
                                          ],
                                          keyboardType: TextInputType.number,
                                        focusNode: _phoneFocus,
                                        onFieldSubmitted: (phone) {
                                          _phoneFocus.unfocus();
                                          FocusScope.of(context)
                                              .requestFocus(_emailFocus);
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
                                          hintText: 'CONTATO',
                                          
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
                                         validator: (text) {
                                              if (text!.isEmpty ||
                                                  !text.contains("@")) {
                                                return "E-mail inválido!";
                                              } else {
                                                return null;
                                              }
                                        },
                                              controller: _emailTextEditingController,
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
                                        validator: (value){
                                           if(value==null || value.isEmpty){
                                            return "Digite sua senha";
                                          }else if(value.length<6){
                                            return "No mínimo 6 caracter";
                                          }
                                        },
                                         controller: _passTextEditingController,
                                        onFieldSubmitted: (pass) {
                                          _passFocus.unfocus();
                                              FocusScope.of(context)
                                              .requestFocus(_pass2Focus);
                                        },
                                        focusNode: _passFocus,
                                        obscureText: signUpController.passObscure,
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
                                                signUpController.passObscure =
                                                    !signUpController.passObscure;
                                                signUpController.update();
                                              },
                                              icon: signUpController.passObscure
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
                                       const SizedBox(
                                        height: 24,
                                      ),
                                      TextFormField(
                                         validator: (value){
                                           if(value==null || value.isEmpty){
                                            return "Digite sua senha novamente";
                                          }else if(value.length<6){
                                            return "No mínimo 6 caracter";
                                          }else if(value !=_passTextEditingController.text){
                                            return "Senha diferente";
                                          }
                                        },
                                         controller: _pass2TextEditingController,
                                        onFieldSubmitted: (pass2) {
                                          _pass2Focus.unfocus();
                                        },
                                        focusNode: _pass2Focus,
                                        obscureText: signUpController.passObscure,
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
                                            hintText: 'REPETIR SENHA',
                                            hintStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                signUpController.passObscure =
                                                    !signUpController.passObscure;
                                                signUpController.update();
                                              },
                                              icon: signUpController.passObscure
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
                               SizedBox(height: 24,),
                              SizedBox(
                                width: 130,
                                child: ElevatedButton(
                                  onPressed: ()async {
                                   if(!signUpController.isloading){
                                    signUpController.isloading=true;
                                    signUpController.update();
                                    FocusScope.of(context).unfocus();
                                    if(_formkey.currentState!.validate()){
                                      try{
                                    await signUpController.signUp(pass: _phoneTextEditingController.text , userModel: UserModel(phone: _phoneTextEditingController.text, cpf: _cpfTextEditingController.text, email: _emailTextEditingController.text.toLowerCase(), validator: false, name: _nomeTextFormFieldController.text));
                                   await Get.dialog(AlertDialog(
                                      content: Text("Cadastrado com sucesso espere ser aprovado!"),
                                    ));
                                    Navigator.pop(context);
                                   }catch(e){
                                      Get.snackbar(
                                              'Erro',
                                              e.toString(),
                                              colorText: Colors.white,
                                              duration:
                                                  const Duration(seconds: 2),
                                              backgroundColor:
                                                  const Color(0xff251230),
                                            );
                                   }
                                   }
                                    signUpController.isloading=false;
                                    signUpController.update();
                                  }},
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ))),
                                  child: signUpController.isloading? CircularProgressIndicator(): const Text(
                                    "CADASTRAR",
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
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Já tem uma conta? Entrar na Conta",
                                          style: TextStyle(
                                           fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                            ],
                          ),
                      
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Get.snackbar(
//                                               'Erro',
//                                               e,
//                                               colorText: Colors.white,
//                                               duration:
//                                                   const Duration(seconds: 2),
//                                               backgroundColor:
//                                                   const Color(0xff251230),
//                                             );