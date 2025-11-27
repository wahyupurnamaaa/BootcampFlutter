import 'package:flutter/material.dart';
import 'detail_news_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.menu,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'NewsApp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            // Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Featured News Card
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailNewsPage(
                            title: 'Microsoft launches Copilot+, a new AI-infused tool for designers',
                            category: 'TECHNOLOGY',
                            author: 'Samuel Newtor',
                            date: '8 hours ago',
                            content: '''Microsoft has launched Copilot+, a revolutionary AI-powered tool designed specifically for designers and creative professionals. This new tool integrates seamlessly with popular design software and provides intelligent suggestions to enhance productivity.

The tool leverages advanced machine learning algorithms to understand design patterns and user preferences, offering contextual recommendations that help designers work more efficiently. Features include automated layout suggestions, color palette generation, and intelligent asset management.

Industry experts are calling this a game-changer for the design community, as it reduces repetitive tasks and allows designers to focus more on creative aspects of their work. The tool is currently in beta and will be available to all Microsoft 365 subscribers starting next month.

Early adopters have reported significant improvements in their workflow, with some claiming productivity increases of up to 40%. The tool also includes collaboration features, making it easier for design teams to work together on complex projects.

Microsoft plans to continuously update Copilot+ with new features based on user feedback and emerging AI technologies. The company sees this as part of their broader strategy to integrate AI across all their productivity tools.''',
                            imageUrl: '',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF4A90E2),
                            Color(0xFF5B9FED),
                          ],
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.6),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF5B9FED),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'TECHNOLOGY',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Microsoft launches Copilot+, a new AI-infused tool for designers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.comment,
                                  color: Colors.white70,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  '0',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Icon(
                                  Icons.bookmark_border,
                                  color: Colors.white70,
                                  size: 16,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.share,
                                  color: Colors.white70,
                                  size: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Latest News Section
                  const Text(
                    'Latest News',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // News List Items
                  _buildNewsItem(
                    context,
                    'Insurtech startup PolicyBazaar gets \$54 million — Series B',
                    'TECHNOLOGY',
                    'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=400',
                  ),
                  _buildNewsItem(
                    context,
                    'The IPO parade continues as Wish files, Bumble',
                    'FINANCE',
                    'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=400',
                  ),
                  _buildNewsItem(
                    context,
                    'Hypatos gets \$11M for deep learning approach',
                    'TECHNOLOGY',
                    'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=400',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsItem(
    BuildContext context,
    String title,
    String category,
    String imageUrl,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailNewsPage(
              title: title,
              category: category,
              author: 'News Editor',
              date: '5 hours ago',
              content: '''This is a detailed article about $title.

The story unfolds as industry leaders and experts weigh in on this significant development. This breakthrough has the potential to reshape the landscape of modern business and technology.

In recent months, we've seen unprecedented growth in this sector, with major players making strategic moves to position themselves at the forefront of innovation. The implications of these developments extend far beyond immediate financial gains.

Analysts predict that this trend will continue, with further announcements expected in the coming weeks. Stakeholders are watching closely as the situation develops, recognizing the potential for both opportunities and challenges ahead.

The broader context includes shifting market dynamics, evolving consumer preferences, and technological advancements that are fundamentally changing how businesses operate. Companies that can adapt quickly will be best positioned for success.

Looking ahead, industry observers expect continued volatility but remain optimistic about long-term prospects. The key will be maintaining flexibility while staying focused on core strategic objectives.''',
              imageUrl: '',
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A3E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Image placeholder
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    category == 'TECHNOLOGY' 
                      ? const Color(0xFF5B9FED) 
                      : const Color(0xFFE8A647),
                    category == 'TECHNOLOGY' 
                      ? const Color(0xFF4A7FB8) 
                      : const Color(0xFFD39437),
                  ],
                ),
              ),
              child: const Icon(
                Icons.image,
                color: Colors.white54,
                size: 32,
              ),
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: const TextStyle(
                      color: Color(0xFF5B9FED),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
