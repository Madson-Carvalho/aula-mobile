import 'package:flutter/material.dart';
import 'package:pagination/components/custom_password_input.dart';
import 'package:pagination/services/auth_service.dart';
import 'package:pagination/views/register_page.dart';

import '../components/custom_button.dart';
import '../components/custom_input.dart';
import '../components/social_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 180,
            ),
            CustomInput(
              controller: TextEditingController(),
              labelText: 'Email',
              icon: const Icon(Icons.email),
            ),
            const CustomPasswordInput(
              labelText: 'Password',
            ),
            CustomButton(titleButton: "Sign in"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Ainda não tem uma conta?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text("Cadastre-se"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Esqueceu a senha?"),
                TextButton(
                  onPressed: () async {
                    await FirebaseAuthService().recoverPassword();
                  },
                  child: const Text("Resetar senha"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialAuth(
                    imgLink:
                        "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAb1BMVEU7V53///8hRZUzUZri5vCFlL44VZxJY6Tc4e1xg7QlSJbO1OQoSpcxUJrq7fRofLGqtNFfdK2QncNCXaDJ0OK/x93U2eijrs62v9jf5O/w8vdTa6jp6/NdcqyCkb2tt9OLmcF4ibiXpMgAMIwUPpG0mXQbAAAEFElEQVR4nO3dbZOaMBSGYTDuASHhVV11Xatt//9vLKzrTDtt2Sgm5yTz3B+6MztdhmuCIgQwST8ru7pPYqmvu/IGS64/mkwbIu4Ve1pERmfNb8Kq1fHobpFuq5swV4p7dZykKL8Kq4g2zz8jqj6EbZwjOKbaUdho7vVwmG4GYRbrNjpGWZqUMQ/hMIhl0hnulXCa6ZI65o102EzrpI9cGM9H0f8V9wAihBBCCCGEEEIIeYw+416P50ekjC60MUYp85HWuiiGf/T4q8DRZLTp25dmU+bL6nDteFzu82253uya1+60at/64X+FiSRT9C+bZfplh+M2xLOhRr83FrrPwptW0kmXW/MCFGpqDvf4QhOa5PU+XmBC0qc7xy8woaH1/b6QhHr1wAAGJCTdPeQLRkjFtweBgQip2DwKDENIevcwMAxhcf9eMCyhPs8AhiBUb3OAQQjtjyPCFD6+nwhESO08oHzh4q6DwQCF5jQTKF1IZt7bjHyhucwFShfqua9C6UKqZwOFC+d84g5DWMwHyhaqVezCZ2ykooWkjrEL5x02BSA0dx75Vvm2/DvJc093vAyr3Skzxb8Sfb+P9Qea/KK0CnK+1/IkdzfwuFf1oejdDtiK3hCnstzfr8K970xZzVTsCu71fDzTWAAPId+1ZLWz2AX7IhzSNhOidcj3YBdbC6EJeCO1Oo+YL7jXck6L/dfCTcgvQythE+7OcGhhcar0e/TCc8hvpVbCFwhFByGE8oMQQvlBCKH8IIRQfhBCKD8IIZRfHEKayEpoppYg4VbnbCKbK9jP/dQSxniJ9Iyruqbb806gPuW6tenW0Qu/8U7deBAyT2x4EF54dycehO+876UehMxPCHYvrJjn+d0Lc+ZZcPdC7nl+90LueX73wnP0whXz0ZV74Rvz0ZNz4YHX50F45L7szblwy31RmHMh9+7QvfCV+6Iw58IT96k458KW+1SbcyGzz73wwP1G41y4ZL9G2rWwZL/bxLWQ+VSiByH/NdKuhcynEj0I2XeHzoX8XzbmWHjgv7XUsZD7VKJ74ZpfSPU+n8gCcZz48z3/zmIYxMVEPyzue7r8nFiAAOB0cVyLMRWEEMoPQgjlByGE8oMQQvlBCKH8IIRQfhBCKD8IIZQfhBDKD0II5QchhPKDEEL5QQih/CCEUH4QQig/CCGUH4QQyg9CCOUHIYTygxBC+UEIofwghFB+EEIoPwghlJ83ISVMj3nxJaQ+qSMX1knH8wgNX0LTJSXPc158CXWZpDxf9OFJSFmapA3LIHoS6mYQpi3HbsePULXpKKw4vnPHi5Co+hCmufI/ij6ESo1PoxqFadVq38PoXki6rdKbME2bTBuvG6tbIZHRWXNdSnJbXNnV/TMJX+RW2NddeVvKL/6zTK7YZprIAAAAAElFTkSuQmCC"),
                SocialAuth(
                    imgLink:
                        "data:image/png;base64,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"),
                SocialAuth(
                    imgLink:
                        "data:image/png;base64,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"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
