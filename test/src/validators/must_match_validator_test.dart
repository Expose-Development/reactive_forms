import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  group('MustMatch Validator Tests', () {
    test('FormGroup invalid if passwords mismatch', () {
      final form = FormGroup({
        'password': FormControl(value: '1234'),
        'passwordConfirmation': FormControl(value: '123'),
      }, validators: [
        Validators.mustMatch('password', 'passwordConfirmation'),
      ]);

      expect(form.invalid, true);
      expect(
        form.errors['passwordConfirmation'][ValidationMessage.mustMatch],
        true,
      );
    });

    test('FormGroup valid if passwords match', () {
      final form = FormGroup({
        'password': FormControl(value: '1234'),
        'passwordConfirmation': FormControl(value: '123'),
      }, validators: [
        Validators.mustMatch('password', 'passwordConfirmation'),
      ]);

      final passwordConfirmation = form.control('passwordConfirmation');
      passwordConfirmation.value = '1234';

      expect(form.valid, true);
      expect(form.hasErrors, false);
    });
  });
}
