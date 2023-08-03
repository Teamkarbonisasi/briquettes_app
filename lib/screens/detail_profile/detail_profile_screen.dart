import 'package:bricket_app/providers/detail_profile_provider.dart';
import 'package:bricket_app/screens/detail_profile/detail_profile_appbar.dart';
import 'package:bricket_app/shared/theme.dart';
import 'package:bricket_app/widgets/inputs/input_text_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailProfileScreen extends StatelessWidget {
  const DetailProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailProfileProvider(context),
      child: Consumer<DetailProfileProvider>(
        builder: (context, state, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size(double.maxFinite, 80),
              child: DetailProfileAppbar(
                isEdit: state.getIsEdit,
                onEdit: () {
                  state.setIsEdit = true;
                },
                onSave: () => state.handleUpdate(context),
              ),
            ),
            body: state.getLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: secondaryColor,
                        child: InputTextCustom(
                          usingLabel: true,
                          label: "Nama Depan",
                          initialValue: state.getFisrtName,
                          disabled: !state.getIsEdit,
                          backgroundColor: Colors.white,
                          onChanged: (value) => state.setFirstName = value,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: secondaryColor,
                        child: InputTextCustom(
                          usingLabel: true,
                          label: "Nama Belakang",
                          initialValue: state.getLastName,
                          disabled: !state.getIsEdit,
                          backgroundColor: Colors.white,
                          onChanged: (value) => state.setLastName = value,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: secondaryColor,
                        child: InputTextCustom(
                          usingLabel: true,
                          label: "Email",
                          initialValue: state.getEmail,
                          disabled: true,
                          backgroundColor: Colors.white,
                          onChanged: (value) => state.setEmail = value,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: secondaryColor,
                        child: InputTextCustom(
                          usingLabel: true,
                          label: "nomor HP",
                          initialValue: state.getPhoneNumber,
                          disabled: !state.getIsEdit,
                          backgroundColor: Colors.white,
                          onChanged: (value) => state.setPhoneNumber = value,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
