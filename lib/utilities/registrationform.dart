import 'package:reactive_forms/reactive_forms.dart';

final form = FormGroup(
    {'username': FormControl<String>(validators: [Validators.required]), 'password': FormControl<String>(validators: [Validators.required])});

