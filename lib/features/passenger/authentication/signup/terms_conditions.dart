import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/custom_text.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  // Helper widget to show each term section nicely
  Widget _buildSection(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            content,
            style: TextStyle(
              fontSize: 16.sp,
              height: 1.5,
              color: Colors.black54,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // You can replace these strings with localized strings or resources if needed
    return Scaffold(
      appBar: const CustomAppBar(text: 'Terms & Conditions'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
                '1. Eligibility',
                'You must be at least 18 years old and legally capable of entering into a binding contract. '
                'By using the App, you represent and warrant that you meet this requirement.'),
            _buildSection(
              '2. Our Services',
              '[Your App Name] connects passengers with drivers for transportation services. '
              'We are a technology platform and do not operate or control the vehicles or drivers.',
            ),
            _buildSection(
              '3. User Accounts',
              'You must register and create an account to use the App. '
              'You agree to provide accurate and complete information. '
              'You are responsible for keeping your login credentials secure. '
              'You agree to notify us immediately of any unauthorized use of your account.',
            ),
            _buildSection(
              '4. Driver Responsibilities',
              'Drivers are independent contractors, not employees of [Your App Name]. Drivers agree to:\n'
              '- Maintain a valid driver’s license and insurance.\n'
              '- Comply with all local transportation laws.\n'
              '- Drive responsibly and respectfully.',
            ),
            _buildSection('5. Booking and Payment',
                'Ride fares are calculated based on time, distance, and other factors. '
                'Payment is processed automatically via the App. '
                'You agree to pay all charges incurred using your account, including applicable taxes and fees.'),
            _buildSection('6. Cancellation and No-Show Policy',
                'You may cancel a ride before it starts, but a cancellation fee may apply. '
                'If you are not present at the pickup location within a reasonable time, the driver may cancel the ride and you may be charged a no-show fee.'),
            _buildSection('7. User Conduct',
                'You agree not to:\n'
                '- Use the App for unlawful purposes.\n'
                '- Harass, abuse, or harm drivers or other users.\n'
                '- Impersonate anyone or misrepresent your identity.'),
            _buildSection(
              '8. Ratings and Feedback',
              'After each ride, users and drivers can rate each other. Your feedback helps us maintain service quality. Abusive or fake reviews may result in account suspension.',
            ),
            _buildSection(
              '9. Suspension and Termination',
              'We reserve the right to suspend or terminate your account at any time for violation of these Terms, fraudulent activity, or any behavior we deem inappropriate.',
            ),
            _buildSection(
              '10. Disclaimer',
              'We provide the App “as is” and do not guarantee availability, accuracy, or reliability. '
              'We are not liable for damages, delays, accidents, or disputes arising from the use of third-party transportation services.',
            ),
            _buildSection(
              '11. Limitation of Liability',
              'To the fullest extent permitted by law, we are not liable for indirect, incidental, or consequential damages arising from your use of the App.',
            ),
            _buildSection(
              '12. Privacy',
              'Your use of the App is also governed by our Privacy Policy. Please review it to understand how we collect, use, and protect your data.',
            ),
            _buildSection(
              '13. Modifications',
              'We may update these Terms at any time. Continued use of the App after changes means you accept the revised Terms.',
            ),
            _buildSection(
              '14. Governing Law',
              'These Terms are governed by the laws of [Your Country/State], without regard to conflict of law principles.',
            ),
            _buildSection(
              '15. Contact Us',
              'If you have any questions or concerns, contact us at:\n'
              'Email: [support@example.com]\n'
              'Phone: [+123-456-7890]\n\n'
              'Let me know if you\'d like a driver-specific version or a Privacy Policy too.',
            ),
          ],
        ),
      ),
    );
  }
}
