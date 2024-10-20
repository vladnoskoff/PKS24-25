import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Adjusted for top padding
            const Text(
              'Эдуард',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              '+7 900 800-55-33',
              style: TextStyle(
                color: Color(0xFF898A8D),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'email@gmail.com',
              style: TextStyle(
                color: Color(0xFF898A8D),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 335, // Exact width as shown in the design
              child: Column(
                children: [
                  ProfileOption(
                    iconUrl: "http://test.noskov-steam.ru/app_pks/1.png",
                    title: 'Мои заказы',
                    onTap: () {
                      _showSnackBar(context, 'Мои заказы нажата');
                    },
                  ),
                  const Divider(height: 32, thickness: 1, color: Color.fromARGB(255, 255, 255, 255)), // Adding divider lines
                  ProfileOption(
                    iconUrl: "http://test.noskov-steam.ru/app_pks/2.png",
                    title: 'Медицинские карты',
                    onTap: () {
                      _showSnackBar(context, 'Медицинские карты нажата');
                    },
                  ),
                  const Divider(height: 32, thickness: 1, color: Color.fromARGB(255, 255, 255, 255)),
                  ProfileOption(
                    iconUrl: "http://test.noskov-steam.ru/app_pks/3.png",
                    title: 'Мои адреса',
                    onTap: () {
                      _showSnackBar(context, 'Мои адреса нажата');
                    },
                  ),
                  const Divider(height: 32, thickness: 1, color: Color.fromARGB(255, 255, 255, 255)),
                  ProfileOption(
                    iconUrl: "http://test.noskov-steam.ru/app_pks/4.png",
                    title: 'Настройки',
                    onTap: () {
                      _showSnackBar(context, 'Настройки нажата');
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Column(
                children: [
                  ProfileFooterLink(
                    text: 'Ответы на вопросы',
                    onTap: () {
                      _showSnackBar(context, 'Ответы на вопросы нажата');
                    },
                  ),
                  const SizedBox(height: 16),
                  ProfileFooterLink(
                    text: 'Политика конфиденциальности',
                    onTap: () {
                      _showSnackBar(context, 'Политика конфиденциальности нажата');
                    },
                  ),
                  const SizedBox(height: 16),
                  ProfileFooterLink(
                    text: 'Пользовательское соглашение',
                    onTap: () {
                      _showSnackBar(context, 'Пользовательское соглашение нажата');
                    },
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      _showSnackBar(context, 'Выход нажата');
                    },
                    child: const Text(
                      'Выход',
                      style: TextStyle(
                        color: Color(0xFFFC3434),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Adjusted for bottom padding
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    Key? key,
    required this.iconUrl,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8), // Adjust padding for balance
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(iconUrl, width: 32, height: 32),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileFooterLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const ProfileFooterLink({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF939396),
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
