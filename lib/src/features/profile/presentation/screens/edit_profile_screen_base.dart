import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:kofu/src/constants/app_sizes.dart';
import 'package:kofu/src/features/authentication/common_widgets/auth_validators.dart';
import 'package:kofu/src/features/profile/domain/profile_response.dart';
import 'package:kofu/src/features/profile/presentation/providers/edit_profile_controller_provider.dart';
import 'package:kofu/src/routing/app_router.dart';
import 'package:kofu/src/utils/async_value_ui.dart';

class EditProfileScreenBase extends ConsumerStatefulWidget {
  const EditProfileScreenBase({
    super.key,
    required this.profile,
  });
  final ProfileResponse profile;

  @override
  ConsumerState<EditProfileScreenBase> createState() =>
      _EditProfileScreenBaseState();
}

class _EditProfileScreenBaseState extends ConsumerState<EditProfileScreenBase>
    with EmailAndPasswordValidators {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  String get username => _usernameController.text;
  String get email => _emailController.text;
  String get name => _nameController.text;

  final cancelTokenEdit = CancelToken();

  var _submitted = false;

  late ProfileResponse profile;
  @override
  void initState() {
    profile = widget.profile;
    _usernameController.text = profile.item?.username ?? '';
    _emailController.text = profile.item?.email ?? '';
    _nameController.text = profile.item?.name ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      final controller =
          ref.read(editProfileCOntrollerNotifierProvider.notifier);
      await controller.updateProfile(
        username,
        email,
        name,
      );
    }
  }

  void _usernameEditingComplete() {
    if (!canSubmitUsername(username)) {
      _node.previousFocus();
      return;
    }
    _submit();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      editProfileCOntrollerNotifierProvider,
      (_, state) {
        state.showAlertDialogOnError(context);
      },
    );
    final state = ref.watch(editProfileCOntrollerNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Image.asset('assets/icons/back.png'),
          onTap: () => context.goNamed(AppRoute.profile.name),
        ),
        centerTitle: true,
        title: const Text('Personal information'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: FocusScope(
          node: _node,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: Sizes.p8),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapH8,
                          Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          gapH8,
                          Container(
                            margin: const EdgeInsets.only(bottom: Sizes.p4),
                            padding: const EdgeInsets.only(left: Sizes.p16),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: TextFormField(
                              validator: (username) => !_submitted
                                  ? null
                                  : usernameErrorText(username ?? ''),
                              onEditingComplete: () =>
                                  _usernameEditingComplete(),
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                hintText: 'Username',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          gapH8,
                          Container(
                            margin: const EdgeInsets.only(bottom: Sizes.p4),
                            padding: const EdgeInsets.only(left: Sizes.p16),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          gapH8,
                          Container(
                            margin: const EdgeInsets.only(bottom: Sizes.p4),
                            padding: const EdgeInsets.only(left: Sizes.p16),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Text(
                            'Phone',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          gapH8,
                          Container(
                            margin: const EdgeInsets.only(bottom: Sizes.p4),
                            padding: const EdgeInsets.only(left: Sizes.p16),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: TextFormField(
                              initialValue: '98761234',
                              decoration: const InputDecoration(
                                hintText: 'Phone',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Text(
                            'Address',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          gapH8,
                          Container(
                            margin: const EdgeInsets.only(bottom: Sizes.p4),
                            padding: const EdgeInsets.only(left: Sizes.p16),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: TextFormField(
                              maxLines: 10,
                              initialValue:
                                  'Address detail: lorem ipsum dolor sit amet consectetur adipicscing',
                              decoration: const InputDecoration(
                                hintText: 'Address',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          gapH8,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () => _submit(),
            child: state.isLoading
                ? const CircularProgressIndicator()
                : const Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
          ),
        ),
      ),
    );
  }
}
