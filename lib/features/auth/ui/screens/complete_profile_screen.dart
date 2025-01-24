import 'package:ecommerce_app_review/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = '/complete-profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileNumTEController = TextEditingController();
  final TextEditingController _cityNameTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 60),
              AppLogoWidget(
                width: 100,
                height: 100,
              ),
              SizedBox(height: 24),
              Text(
                'Complete Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8),
              Text(
                'Get started with us with your details',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
              ),
              SizedBox(height: 24),
              _buildCompleteProfileTextFormField(),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // if(_formKey.currentState!.validate()) {}
                },
                child: Text('Complete'),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteProfileTextFormField() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstNameTEController,
            decoration: InputDecoration(hintText: 'First Name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your first name';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastNameTEController,
            decoration: InputDecoration(hintText: 'Last Name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your last name';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.phone,
            maxLength: 11,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _mobileNumTEController,
            decoration: InputDecoration(hintText: 'Mobile'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your mobile number';
              }
              if(RegExp(r'^01[3-9\d{8}$]').hasMatch(value!) == false) {
                return 'Enter your valid mobile number';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cityNameTEController,
            decoration: InputDecoration(hintText: 'City Name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your city name';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            maxLines: 3,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _shippingAddressTEController,
            decoration: InputDecoration(hintText: 'Shipping address'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your shipping address';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileNumTEController.dispose();
    _cityNameTEController.dispose();
    _shippingAddressTEController.dispose();
    super.dispose();
  }
}
