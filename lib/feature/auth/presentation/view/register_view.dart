import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/auth_entity.dart';
import '../auth_viewmodel/auth_viewmodel.dart';


class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _gap = const SizedBox(height: 8);

  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: 'Bhawana');
  final _lnameController = TextEditingController(text: 'Shahi');
  final _emailController = TextEditingController(text: 'B@gmail.com');
  // final _usernameController = TextEditingController(text: 'bhawana');
  final _passwordController = TextEditingController(text: 'bhawana12');

  // final _fnameController = TextEditingController();
  // final _lnameController = TextEditingController();
  // final _phoneController = TextEditingController();
  // final _usernameController = TextEditingController();
  // final _passwordController = TextEditingController();
  //
  bool isObscure = true;
  // BatchEntity? selectedBatch;
  // List<CourseEntity>lstCourseSelected=[];
  @override
  Widget build(BuildContext context) {
    // final isConnected = ref.watch(connectivityStatusProvider);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (isConnected == ConnectivityStatus.isDisconnected) {
    //     showSnackBar(
    //         message: 'No Internet Connection',
    //         context: context,
    //         color: Colors.red);
    //   } else if (isConnected == ConnectivityStatus.isConnected) {
    //     showSnackBar(message: 'You are online', context: context);
    //   }

      if (ref.watch(authViewModelProvider).showMessage!) {
        showSnackBar(
            message: 'Student Registerd Successfully', context: context);
        ref.read(authViewModelProvider.notifier).resetMessage();
      }

    // final batchState= ref.watch(batchViewModelProvider);
    // final courseState= ref.watch(courseViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[300],
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.camera),
                                label: const Text('Camera'),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.image),
                                label: const Text('Gallery'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: const SizedBox(
                      height:300,
                      width: 300,
                      child: ClipOval(
                        child: Image(
                          width: 300, // Set the desired width
                          height: 300, // Set the desired height
                           // Adjust the BoxFit as needed
                          image: AssetImage('assets/images/logos.png'),
                          // image: _img != null
                          //   ? FileImage(_img!)
                          //   : AssetImage('assets/images/profile.png'),
                        ),
                      ),

                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _fnameController,
                    decoration: const InputDecoration(

                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _lnameController,
                    decoration: const InputDecoration(

                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  // TextFormField(
                  //   controller: _emailController,
                  //   decoration: const InputDecoration(
                  //
                  //   ),
                  //   validator: ((value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter email';
                  //     }
                  //     return null;
                  //   }),
                  // ),
                  // _gap,
                  // DropDown
                  // batchState.isLoading
                  // ? const Center(child: CircularProgressIndicator())
                  // :DropdownButtonFormField(
                  //     hint:const Text('Select Batch') ,
                  //     items: batchState.batches
                  // .map((batch) => DropdownMenuItem<BatchEntity>
                  //       (value: batch,
                  //     child: Text(batch.batchName),),
                  //     )
                  // .toList(),
                  // onChanged: (value){
                  //       selectedBatch=value;
                  // },
                  // decoration: const InputDecoration(
                  //   labelText: 'Select Batch',
                  // ),),
                  // _gap,
                  // // Multi Checkbox
                  // courseState.isLoading
                  // ? const Center(
                  //   child: CircularProgressIndicator(),
                  // )
                  // : MultiSelectDialogField(
                  //     title: const Text('Select Course(s)'),
                  //     items: courseState.courses
                  // .map((course) => MultiSelectItem(
                  //         course,
                  //         course.courseName,
                  //     ),
                  //     )
                  // .toList(),
                  // listType: MultiSelectListType.CHIP,
                  // buttonText: const Text('Select course(s)'),
                  // buttonIcon: const Icon(Icons.search),
                  // onConfirm: (values){
                  //       lstCourseSelected.clear();
                  //       lstCourseSelected.addAll(values);
                  // },
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: Colors.grey,
                  //   ),
                  //   borderRadius: BorderRadius.circular(5),
                  // ),
                  // validator: ((value){
                  //   if(value == null || value.isEmpty){
                  //     return 'Please select course(s)';
                  //   }
                  //   return null;
                  // })),
                   _gap,
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'email',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isObscure,
                    decoration: InputDecoration(

                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }),
                  ),
                  _gap,

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          final entity = AuthEntity(
                            fname: _fnameController.text.trim(),
                            lname: _lnameController.text.trim(),
                            // phone: _phoneController.text.trim(),
                            // batch: selectedBatch!,
                            // courses: _lstCourseSelected,
                            // image:
                            // ref.read(authViewModelProvider).imageName ?? '',
                            email:
                            _emailController.text.trim().toLowerCase(),
                            password: _emailController.text,
                          );
                          // Register user
                          ref
                              .read(authViewModelProvider.notifier)
                              .registerStudent(entity);
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
