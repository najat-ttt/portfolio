import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF245461)),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F5FB),
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Personal Portfolio'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 700;

                  return Column(
                    children: [
                      _HeaderSection(isWide: isWide),
                      const SizedBox(height: 24),
                      const _AboutSection(),
                      const SizedBox(height: 24),
                      const _EducationSection(),
                      const SizedBox(height: 24),
                      const _SkillsSection(),
                      const SizedBox(height: 24),
                      const _AchievementsSection(),
                      const SizedBox(height: 24),
                      const _SocialSection(),
                      const SizedBox(height: 24),
                      const _ContactSection(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final profileImage = Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        shape: BoxShape.circle
      ),
      child: CircleAvatar(
        radius: 70,
        backgroundColor: Colors.white,
        child: ClipOval(
          child: Image.asset(
            'assets/profile.jpg',
            width: 132,
            height: 132,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    final details = Column(
      crossAxisAlignment: isWide
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text('Sheikh Siam Najat', style: theme.textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text(
          'CSE Student | Flutter Developer',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on, size: 18),
            SizedBox(width: 5),
            Text('Rajshahi, Bangladesh'),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _ContactSection(),
                  ),
                );
              },
              icon: const Icon(Icons.email),
              label: const Text('Contact Me'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('Resume'),
            ),
          ],
        ),
      ],
    );

    return _Card(
      child: isWide
          ? Row(
              children: [
                profileImage,
                const SizedBox(width: 30),
                Expanded(child: details),
              ],
            )
          : Column(
              children: [profileImage, const SizedBox(height: 20), details],
            ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: Icons.person, title: 'About Me'),
          SizedBox(height: 12),
          Text(
            'I am Sheikh Siam Najat, a Computer Science and Engineering '
            'student at RUET. I am passionate about Flutter development, '
            'software engineering, and building responsive applications. '
            'I enjoy solving real-world problems through technology and '
            'continuously learning new tools and frameworks.',
            style: TextStyle(fontSize: 15, height: 1.6),
          ),
        ],
      ),
    );
  }
}

class _EducationSection extends StatelessWidget {
  const _EducationSection();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: Icons.school, title: 'Education'),
          SizedBox(height: 12),
          Text(
            'Bachelor of Science in Computer Science & Engineering\n'
            'Rajshahi University of Engineering & Technology (RUET)\n'
            '2023 - Present',
            style: TextStyle(height: 1.6),
          ),
        ],
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  @override
  Widget build(BuildContext context) {
    const skills = [
      'Flutter',
      'Dart',
      'Firebase',
      'Git',
      'UI Design',
      'C++',
      'C'
    ];

    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(icon: Icons.star, title: 'Skills'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills.map((skill) => _SkillChip(label: skill)).toList(),
          ),
        ],
      ),
    );
  }
}

class _AchievementsSection extends StatelessWidget {
  const _AchievementsSection();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: Icons.emoji_events, title: 'Achievements'),
          SizedBox(height: 12),
          Text('• Developed Student Attendance Management System (SAMS)'),
          SizedBox(height: 8),
          Text('• Built multiple Flutter and Firebase applications'),
          SizedBox(height: 8),
          Text('• Active participant in software development projects'),
        ],
      ),
    );
  }
}

class _SocialSection extends StatelessWidget {
  const _SocialSection();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: Icons.public, title: 'Social Links'),
          SizedBox(height: 12),
          _ContactRow(icon: Icons.code_rounded, text: 'github.com/najat-ttt'),
          SizedBox(height: 12),
          _ContactRow(icon: Icons.business, text: 'linkedin.com/in/sheikh-siam-najat-82584b281',),
        ],
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: Icons.contact_mail, title: 'Contact'),
          SizedBox(height: 12),
          _ContactRow(icon: Icons.email, text: 'shiekhsiamnajat@gmail.com'),
          SizedBox(height: 12),
          _ContactRow(icon: Icons.phone, text: '+880 1XXXXXXXXX'),
          SizedBox(height: 12),
          _ContactRow(icon: Icons.location_city, text: 'Rajshahi, Bangladesh'),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Text(title, style: theme.textTheme.titleLarge),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  const _SkillChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
      ],
    );
  }
}
