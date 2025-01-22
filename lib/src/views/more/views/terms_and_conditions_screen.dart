import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndPrivacyScreen extends StatefulWidget {
  const TermsAndPrivacyScreen({super.key});

  @override
  State<TermsAndPrivacyScreen> createState() => _TermsAndPrivacyScreenState();
}

class _TermsAndPrivacyScreenState extends State<TermsAndPrivacyScreen> {
  @override
  void initState() {
    super.initState();
    _launchURL();
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(
        'https://hazel-wallaby-265.notion.site/Study-Duck-183954afbc8480ed96c2dac4049616df');

    try {
      final canLaunchResult = await canLaunchUrl(url);
      if (!canLaunchResult) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('이 URL을 실행할 수 없습니다'),
              duration: Duration(seconds: 2),
            ),
          );
        }
        Navigator.pop(context);
        return;
      }

      final launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );

      // 브라우저를 닫으면 전페이지으로 복귀
      if (launched) {
        if (context.mounted) {
          Navigator.pop(context);
        }
      } else if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('URL을 열 수 없습니다: ${url.toString()}'),
            duration: const Duration(seconds: 2),
          ),
        );
        Navigator.pop(context); // URL 실행 실패 시 복귀
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('오류가 발생했습니다: ${e.toString()}'),
            duration: const Duration(seconds: 2),
          ),
        );
        Navigator.pop(context); // 오류 발생 시 복귀
      }
      debugPrint('URL 실행 중 오류 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Privacy'),
      ),
      body: const Center(
        child: Text('URL을 실행 중입니다...'),
      ),
    );
  }
}
