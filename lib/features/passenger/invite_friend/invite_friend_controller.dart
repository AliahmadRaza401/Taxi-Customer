import 'package:get/get.dart';

class InviteFriendController extends GetxController {
  var inviteCode = "AVB2454".obs;

  void onInvitePressed() {
    // Your logic for invite pressed, e.g. calling an API or navigating.
    print("Invite pressed with code: ${inviteCode.value}");
    Get.snackbar('Invite', 'Invite code sent: ${inviteCode.value}');
  }


  void onInvite(String contactName) {
    Get.snackbar('Invite Sent', 'You invited $contactName');
  }







   var suggestedContacts = [
    Contact(name: "Johnny Rios", initials: "JR", invited: false),
    Contact(name: "Johnny Rios", initials: "Mk", invited: true),
    Contact(name: "Johnny Rios", initials: "JR", invited: true),
    Contact(name: "Johnny Rios", initials: "JR", invited: false),
    Contact(name: "Johnny Rios", initials: "JR", invited: false),
    Contact(name: "Johnny Rios", initials: "JR", invited: false),
  ].obs;

  void inviteContact(int index) {
    if (!suggestedContacts[index].invited) {
      suggestedContacts[index] = suggestedContacts[index].copyWith(invited: true);
      Get.snackbar('Invite Sent', 'You invited ${suggestedContacts[index].name}');
    }
  }

  // Invite via sharing method placeholders
  void inviteViaWhatsApp() {
    Get.snackbar('Invite', 'Invite sent via WhatsApp');
  }

  void inviteViaMessenger() {
    Get.snackbar('Invite', 'Invite sent via Messenger');
  }

  void inviteViaInstagram() {
    Get.snackbar('Invite', 'Invite sent via Instagram');
  }

  void copyLink() {
    Get.snackbar('Invite', 'Invite link copied');
  }
}

class Contact {
  final String name;
  final String initials;
  final bool invited;

  Contact({required this.name, required this.initials, this.invited = false});

  Contact copyWith({String? name, String? initials, bool? invited}) {
    return Contact(
      name: name ?? this.name,
      initials: initials ?? this.initials,
      invited: invited ?? this.invited,
    );
  }

}
