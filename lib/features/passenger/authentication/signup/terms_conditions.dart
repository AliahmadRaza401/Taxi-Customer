import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/custom_text.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Terms & Conditions'),
      body: Column(
        children: [
          CText(
            text: '''1. Eligibility
You must be at least 18 years old and legally capable of entering into a binding contract. By using the App, you represent and warrant that you meet this requirement.
2. Our Services
[Your App Name] connects passengers with drivers for transportation services. We are a technology platform and do not operate or control the vehicles or drivers.
3. User Accounts
You must register and create an account to use the App.
You agree to provide accurate and complete information.
You are responsible for keeping your login credentials secure.
You agree to notify us immediately of any unauthorized use of your account.
4. Driver Responsibilities
Drivers are independent contractors, not employees of [Your App Name]. Drivers agree to:
Maintain a valid driver’s license and insurance.
Comply with all local transportation laws.
Drive responsibly and respectfully.
5. Booking and Payment
Ride fares are calculated based on time, distance, and other factors.
Payment is processed automatically via the App.
You agree to pay all charges incurred using your account, including applicable taxes and fees.
6. Cancellation and No-Show Policy
You may cancel a ride before it starts, but a cancellation fee may apply.
If you are not present at the pickup location within a reasonable time, the driver may cancel the ride and you may be charged a no-show fee.
7. User Conduct
You agree not to:
Use the App for unlawful purposes.
Harass, abuse, or harm drivers or other users.
Impersonate anyone or misrepresent your identity.
8. Ratings and Feedback
After each ride, users and drivers can rate each other. Your feedback helps us maintain service quality. Abusive or fake reviews may result in account suspension.
9. Suspension and Termination
We reserve the right to suspend or terminate your account at any time for violation of these Terms, fraudulent activity, or any behavior we deem inappropriate.
10. Disclaimer
We provide the App “as is” and do not guarantee availability, accuracy, or reliability. We are not liable for damages, delays, accidents, or disputes arising from the use of third-party transportation services.
11. Limitation of Liability
To the fullest extent permitted by law, we are not liable for indirect, incidental, or consequential damages arising from your use of the App.
12. Privacy
Your use of the App is also governed by our Privacy Policy. Please review it to understand how we collect, use, and protect your data.
13. Modifications
We may update these Terms at any time. Continued use of the App after changes means you accept the revised Terms.
14. Governing Law
These Terms are governed by the laws of [Your Country/State], without regard to conflict of law principles.
15. Contact Us
If you have any questions or concerns, contact us at: Email: [support@example.com] Phone: [+123-456-7890]
Let me know if you'd like a driver-specific version or a Privacy Policy too.''',
            fontSize: 16.sp,
          ),
        ],
      ),
    );
  }
}
