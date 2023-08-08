import 'package:flutter/material.dart';
import 'package:zego_call/pages/home/home_logics.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class SendCallButton extends StatelessWidget {
  final bool isVideoCall;
  final TextEditingController inviteeUsersIDTextCtrl;
  final void Function(String code, String message, List<String>)?
  onCallFinished;

  const SendCallButton({
    required this.isVideoCall,
    required this.inviteeUsersIDTextCtrl,
    required this.onCallFinished,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: inviteeUsersIDTextCtrl,
      builder: (context, inviteeUserID, _) {
        final invitees =
        getInvitesFromTextCtrl(inviteeUsersIDTextCtrl.text.trim());

        return ZegoSendCallInvitationButton(
          isVideoCall: isVideoCall,
          invitees: invitees,
          resourceID: 'zego_data',
          iconSize: const Size(40, 40),
          buttonSize: const Size(50, 50),
          onPressed: onCallFinished,
        );
      },
    );
  }
}