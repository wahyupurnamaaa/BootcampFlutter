import 'package:flutter/material.dart';
import 'detail_news_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _allNews = [];
  List<Map<String, String>> _filteredNews = [];

  @override
  void initState() {
    super.initState();
    _initializeNews();
    _filteredNews = _allNews;
  }

  void _initializeNews() {
    _allNews = [
      {
        'title': 'Microsoft launches Copilot+, a new AI-infused tool for designers',
        'category': 'TECHNOLOGY',
        'author': 'Samuel Newtor',
        'date': '8 hours ago',
      },
      {
        'title': 'Insurtech startup PolicyBazaar gets \$54 million — Series B',
        'category': 'TECHNOLOGY',
        'author': 'News Editor',
        'date': '5 hours ago',
      },
      {
        'title': 'The IPO parade continues as Wish files, Bumble',
        'category': 'FINANCE',
        'author': 'News Editor',
        'date': '5 hours ago',
      },
      {
        'title': 'Hypatos gets \$11M for deep learning approach',
        'category': 'TECHNOLOGY',
        'author': 'News Editor',
        'date': '5 hours ago',
      },
      {
        'title': 'Apple announces new M3 chip with breakthrough performance',
        'category': 'TECHNOLOGY',
        'author': 'Tech Reporter',
        'date': '2 hours ago',
      },
      {
        'title': 'Global markets rally on positive economic data',
        'category': 'FINANCE',
        'author': 'Finance News',
        'date': '3 hours ago',
      },
    ];
  }

  void _filterNews(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredNews = _allNews;
      } else {
        _filteredNews = _allNews
            .where((news) =>
                news['title']!.toLowerCase().contains(query.toLowerCase()) ||
                news['category']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Search News',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Search Bar
                  TextField(
                    controller: _searchController,
                    onChanged: _filterNews,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search articles, topics...',
                      hintStyle: const TextStyle(color: Colors.white54),
                      prefixIcon: const Icon(Icons.search, color: Colors.white54),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear, color: Colors.white54),
                              onPressed: () {
                                _searchController.clear();
                                _filterNews('');
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: const Color(0xFF2A2A3E),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Results
            Expanded(
              child: _filteredNews.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.white54,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _searchController.text.isEmpty
                                ? 'Start searching for news'
                                : 'No results found',
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _filteredNews.length,
                      itemBuilder: (context, index) {
                        final news = _filteredNews[index];
                        return _buildNewsItem(
                          context,
                          news['title']!,
                          news['category']!,
                          news['author']!,
                          news['date']!,
                        );
                      },
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
    String author,
    String date,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailNewsPage(
              title: title,
              category: category,
              author: author,
              date: date,
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
                  const SizedBox(height: 4),
                  Text(
                    '$author • $date',
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 11,
                    ),
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
