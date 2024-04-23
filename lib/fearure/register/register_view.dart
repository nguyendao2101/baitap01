import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/themes/theme_controller.dart';

import '../login/login_view.dart';
import 'register_controller.dart';

class Register extends StatelessWidget {
  const Register({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    final textEditingControllers = TextEditingControllers();

    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;
    return Obx(
      () => Scaffold(
        backgroundColor: themeData.value.color.lightBackground,
        body: SafeArea(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            themeController.changeTheme();
                          },
                          child: Text(
                            "Change Theme",
                            style: themeData.value.text.h14,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 92, 73, 73)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // user name
                    TextFormField(
                      controller: textEditingControllers.email,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Email',
                        suffixIcon: const Icon(Icons.email),
                      ),
                      onChanged: controller.onChangeUsername,
                      validator: controller.validatorUsername,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //password
                    Obx(
                      () => TextFormField(
                        controller: textEditingControllers.passWord,
                        obscureText: controller.isObscured
                            .value, // Sử dụng giá trị từ controller để ẩn hoặc hiện mật khẩu
                        decoration: InputDecoration(
                          labelText: 'Password',
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller
                                  .toggleObscureText(); // Khi người dùng nhấn vào biểu tượng, toggleObscureText được gọi để thay đổi trạng thái ẩn/hiện mật khẩu
                            },
                            child: Icon(controller.isObscured.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                        onChanged: controller.onChangePassword,
                        validator: controller.validatorPassword,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // entry your password
                    // TextFormField(
                    //   controller: textEditingControllers.entryPassword,
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     labelText: 'Entry your Password',
                    //     enabledBorder: const OutlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.black),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.grey.shade400),
                    //     ),
                    //     fillColor: Colors.grey.shade200,
                    //     filled: true,
                    //     hintText: 'Entry your Password',
                    //   ),
                    //   onChanged: controller.onChangeConfirmPassword,
                    //   validator: controller.validatorConfirmPassword,
                    // ),
                    Obx(
                      () => TextFormField(
                        controller: textEditingControllers.entryPassword,
                        obscureText: controller.isEntryPasswordObscured.value,
                        decoration: InputDecoration(
                          labelText: 'Entry your Password',
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Entry your Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.toggleEntryPasswordObscureText();
                            },
                            child: Icon(controller.isEntryPasswordObscured.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                        onChanged: controller.onChangeConfirmPassword,
                        validator: controller.validatorConfirmPassword,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // ho ten
                    TextFormField(
                      controller: textEditingControllers.hoTen,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Full Name',
                      ),
                      onChanged: controller.onChangeCheckName,
                      validator: controller.validatorCheck,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // dia chi va gioi tinh
                    Row(
                      children: [
                        //gioi tinh
                        Expanded(
                          child: TextFormField(
                            controller: textEditingControllers.sex,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Sex',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Sex',
                            ),
                            onChanged: controller.onChangeCheckSex,
                            validator: controller.validatorCheck,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        // dia chi
                        Expanded(
                          child: TextFormField(
                            controller: textEditingControllers.addRess,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Address',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Address',
                            ),
                            onChanged: controller.onChangeCheckAdress,
                            validator: controller.validatorCheck,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        controller.signUp(
                          textEditingControllers.email.text,
                          textEditingControllers.passWord.text,
                          textEditingControllers.entryPassword.text,
                          textEditingControllers.hoTen.text,
                          textEditingControllers.addRess.text,
                          textEditingControllers.sex.text,
                          () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyHomePage(
                                  title: '',
                                ),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                        );
                      },
                      child: const Text('Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextEditingControllers {
  final TextEditingController email = TextEditingController();
  final TextEditingController passWord = TextEditingController();
  final TextEditingController entryPassword = TextEditingController();
  final TextEditingController hoTen = TextEditingController();
  final TextEditingController addRess = TextEditingController();
  final TextEditingController sex = TextEditingController();
}
