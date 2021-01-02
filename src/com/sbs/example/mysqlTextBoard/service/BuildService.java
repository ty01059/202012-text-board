package com.sbs.example.mysqlTextBoard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sbs.example.mysqlTextBoard.Container;
import com.sbs.example.mysqlTextBoard.dto.Article;
import com.sbs.example.mysqlTextBoard.dto.Board;
import com.sbs.example.mysqlTextBoard.util.Util;

public class BuildService {

	private ArticleService articleService;
	private DisqusApiService disqusApiService;

	public BuildService() {
		articleService = Container.articleService;
		disqusApiService = Container.disqusApiService;
	}

	public void buildSite() {
		System.out.println("site/article 폴더 생성");
		Util.mkdirs("site");

		Util.copy("site_template/app.css", "site/app.css");
		Util.copy("site_template/app.js", "site/app.js");
		Util.copy("site_template/favicon.ico", "site/favicon.ico");

		loadDataFromDisqus();
		loadDataFromGa4Data();
		
		buildIndexPage();
		buildArticleListPages();
		buildArticleDetailPages();
	}

	private void loadDataFromGa4Data() {
		Container.googleAnalyticsApiService.updatePageHits();
	}
	
	private void loadDataFromDisqus() {
		Container.disqusApiService.updateArticleCounts();
	}

	private void buildArticleListPage(Board board, int itemsInAPage, int pageBoxSize, List<Article> articles,
			int page) {
		StringBuilder sb = new StringBuilder();

		// 헤더 시작
		sb.append(getHeadHtml("article_list_" + board.code));

		// 바디 시작
		String bodyTemplate = Util.getFileContents("site_template/article_list.html");

		StringBuilder mainContent = new StringBuilder();

		int articlesCount = articles.size();
		int start = (page - 1) * itemsInAPage;
		int end = start + itemsInAPage - 1;

		if (end >= articlesCount) {
			end = articlesCount - 1;
		}

		for (int i = start; i <= end; i++) {
			Article article = articles.get(i);

			String link = getArticleDetailFileName(article.id);

			mainContent.append("<div>");
			mainContent.append("<div class=\"article-list__cell-id\">" + article.id + "</div>");
			mainContent.append("<div class=\"article-list__cell-reg-date\">" + article.regDate + "</div>");
			mainContent.append("<div class=\"article-list__cell-writer\">" + article.extra__writer + "</div>");
			mainContent.append("<div class=\"article-list__cell-title\">");
			mainContent.append("<div class=\"article-list__cell-view\">" + article.viewCount + "</div>");

			mainContent.append("<a href=\"" + link + "\" class=\"hover-underline\">" + article.title + "</a>");

			mainContent.append("</div>");
			mainContent.append("</div>");
		}

		StringBuilder pageMenuContent = new StringBuilder();

		// 토탈 페이지 계산
		int totalPage = (int) Math.ceil((double) articlesCount / itemsInAPage);

		// 현재 페이지 계산
		if (page < 1) {
			page = 1;
		}

		if (page > totalPage) {
			page = totalPage;
		}

		// 현재 페이지 박스 시작, 끝 계산
		int previousPageBoxesCount = (page - 1) / pageBoxSize;
		int pageBoxStartPage = pageBoxSize * previousPageBoxesCount + 1;
		int pageBoxEndPage = pageBoxStartPage + pageBoxSize - 1;

		if (pageBoxEndPage > totalPage) {
			pageBoxEndPage = totalPage;
		}

		// 이전버튼 페이지 계산
		int pageBoxStartBeforePage = pageBoxStartPage - 1;
		if (pageBoxStartBeforePage < 1) {
			pageBoxStartBeforePage = 1;
		}

		// 다음버튼 페이지 계산
		int pageBoxEndAfterPage = pageBoxEndPage + 1;

		if (pageBoxEndAfterPage > totalPage) {
			pageBoxEndAfterPage = totalPage;
		}

		// 이전버튼 노출여부 계산
		boolean pageBoxStartBeforeBtnNeedToShow = pageBoxStartBeforePage != pageBoxStartPage;
		// 다음버튼 노출여부 계산
		boolean pageBoxEndAfterBtnNeedToShow = pageBoxEndAfterPage != pageBoxEndPage;

		if (pageBoxStartBeforeBtnNeedToShow) {
			pageMenuContent.append("<li><a href=\"" + getArticleListFileName(board, pageBoxStartBeforePage)
					+ "\" class=\"flex flex-ai-c\">&lt; 이전</a></li>");
		}

		for (int i = pageBoxStartPage; i <= pageBoxEndPage; i++) {
			String selectedClass = "";

			if (i == page) {
				selectedClass = "article-page-menu__link--selected";
			}

			pageMenuContent.append("<li><a href=\"" + getArticleListFileName(board, i) + "\" class=\"flex flex-ai-c "
					+ selectedClass + "\">" + i + "</a></li>");
		}

		if (pageBoxEndAfterBtnNeedToShow) {
			pageMenuContent.append("<li><a href=\"" + getArticleListFileName(board, pageBoxEndAfterPage)
					+ "\" class=\"flex flex-ai-c\">다음 &gt;</a></li>");
		}

		String body = bodyTemplate.replace("${article-list__main-content}", mainContent.toString());
		body = body.replace("${article-page-menu__content}", pageMenuContent.toString());

		sb.append(body);

		// 푸터 시작
		sb.append(Util.getFileContents("site_template/foot.html"));

		// 파일 생성 시작
		String fileName = getArticleListFileName(board, page);
		String filePath = "site/" + fileName;

		Util.writeFile(filePath, sb.toString());
		System.out.println(filePath + " 생성");
	}

	private String getArticleListFileName(Board board, int page) {
		return getArticleListFileName(board.code, page);
	}

	private String getArticleListFileName(String boardCode, int page) {
		return "article_list_" + boardCode + "_" + page + ".html";
	}

	private void buildArticleListPages() {
		List<Board> boards = articleService.getForPrintBoards();

		int itemsInAPage = 10;
		int pageBoxMenuSize = 10;

		for (Board board : boards) {
			List<Article> articles = articleService.getForPrintArticles(board.id);
			int articlesCount = articles.size();
			int totalPage = (int) Math.ceil((double) articlesCount / itemsInAPage);

			for (int i = 1; i <= totalPage; i++) {
				buildArticleListPage(board, itemsInAPage, pageBoxMenuSize, articles, i);
			}
		}
	}

	private void buildIndexPage() {
		StringBuilder sb = new StringBuilder();

		String head = getHeadHtml("index");
		String foot = Util.getFileContents("site_template/foot.html");

		String mainHtml = Util.getFileContents("site_template/index.html");

		sb.append(head);
		sb.append(mainHtml);
		sb.append(foot);

		String filePath = "site/index.html";
		Util.writeFile(filePath, sb.toString());
		System.out.println(filePath + " 생성");
	}

	private void buildArticleDetailPages() {
		List<Board> boards = articleService.getForPrintBoards();

		String head = getHeadHtml("article_detail");
		String bodyTemplate = Util.getFileContents("site_template/article_detail.html");
		String foot = Util.getFileContents("site_template/foot.html");

		for (Board board : boards) {
			List<Article> articles = articleService.getForPrintArticles(board.id);

			// 5
			// i : 0 ~ 4
			// 0, 1, 2, 3, 4
			for (int i = 0; i < articles.size(); i++) {
				Article article = articles.get(i);
				Article prevArticle = null;
				int prevArticleIndex = i + 1;
				int prevArticleId = 0;

				if (prevArticleIndex < articles.size()) {
					prevArticle = articles.get(prevArticleIndex);
					prevArticleId = prevArticle.id;
				}

				Article nextArticle = null;
				int nextArticleIndex = i - 1;
				int nextArticleId = 0;

				if (nextArticleIndex >= 0) {
					nextArticle = articles.get(nextArticleIndex);
					nextArticleId = nextArticle.id;
				}

				StringBuilder sb = new StringBuilder();

				sb.append(head);

				String body = bodyTemplate.replace("${article-detail__title}", article.title);
				body = body.replace("${article-detail__board-name}", article.extra__boardName);
				body = body.replace("${article-detail__reg-date}", article.regDate);
				body = body.replace("${article-detail__writer}", article.extra__writer);
				body = body.replace("${article-detail__body}", article.body);
				body = body.replace("${article-detail__likes-count}", article.likesCount + "");
				body = body.replace("${article-detail__comments-count}", article.commentsCount + "");
				body = body.replace("${article-detail__view-count}", article.viewCount + "");

				body = body.replace("${article-detail__link-prev-article-url}",
						getArticleDetailFileName(prevArticleId));
				body = body.replace("${article-detail__link-prev-article-title-attr}",
						prevArticle != null ? prevArticle.title : "");
				body = body.replace("${article-detail__link-prev-article-class-addi}",
						prevArticleId == 0 ? "a-pointer-events-none" : "");
				body = body.replace("${article-detail__link-list-url}",
						getArticleListFileName(article.extra__boardCode, 1));
				body = body.replace("${article-detail__link-list-class-addi}", "");
				body = body.replace("${article-detail__link-next-article-url}",
						getArticleDetailFileName(nextArticleId));
				body = body.replace("${article-detail__link-next-article-title-attr}",
						nextArticle != null ? nextArticle.title : "");
				body = body.replace("${article-detail__link-next-article-class-addi}",
						nextArticleId == 0 ? "a-pointer-events-none" : "");
				body = body.replace("${article-detail__link-youtube}", article.extra__boardCode.equals("free")
						? "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/iQqa20RTLIU\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>"
						: "");

				body = body.replace("${site-domain}", "blog.yhj.kr");
				body = body.replace("${file-name}", getArticleDetailFileName(article.id));

				sb.append(body);

				sb.append(foot);

				String fileName = getArticleDetailFileName(article.id);

				String filePath = "site/" + fileName;

				Util.writeFile(filePath, sb.toString());
				System.out.println(filePath + " 생성");
			}
		}
	}

	public String getArticleDetailFileName(int id) {
		return "article_detail_" + id + ".html";
	}

	private String getHeadHtml(String pageName) {
		return getHeadHtml(pageName, null);
	}

	private String getHeadHtml(String pageName, Object relObj) {
		String head = Util.getFileContents("site_template/head.html");

		StringBuilder boardMenuContentHtml = new StringBuilder();
		List<Board> forPrintBoards = articleService.getForPrintBoards();

		for (Board board : forPrintBoards) {
			boardMenuContentHtml.append("<li>");

			String link = getArticleListFileName(board, 1);

			boardMenuContentHtml.append("<a href=\"" + link + "\" class=\"block\">");

			boardMenuContentHtml.append(getTitleBarContentByPageName("article_list_" + board.code));

			boardMenuContentHtml.append("</a>");

			boardMenuContentHtml.append("</li>");
		}

		head = head.replace("${menu-bar__menu-1__board-menu-content}", boardMenuContentHtml.toString());

		String titleBarContentHtml = getTitleBarContentByPageName(pageName);

		head = head.replace("${title-bar__content}", titleBarContentHtml);

		String pageTitle = getPageTitle(pageName, relObj);

		head = head.replace("${page-title}", pageTitle);

		String siteName = Container.config.getSiteName();
		String siteSubject = "개발자의 기술/일상 블로그";
		String siteDescription = "개발자의 기술/일상 관련 글들을 공유합니다.";
		String siteKeywords = "HTML, CSS, JAVASCRIPT, JAVA, SPRING, MySQL, 리눅스, 리액트";
		String siteDomain = "blog.yhj.kr";
		String siteMainUrl = "https://" + siteDomain;
		String currentDate = Util.getNowDateStr().replace(" ", "T");

		if (relObj instanceof Article) {
			Article article = (Article) relObj;
			siteSubject = article.title;
			siteDescription = article.body;
			siteDescription = siteDescription.replaceAll("[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]", "");
		}

		head = head.replace("${site-name}", siteName);
		head = head.replace("${site-subject}", siteSubject);
		head = head.replace("${site-description}", siteDescription);
		head = head.replace("${site-domain}", siteDomain);
		head = head.replace("${site-domain}", siteDomain);
		head = head.replace("${current-date}", currentDate);
		head = head.replace("${site-main-url}", siteMainUrl);
		head = head.replace("${site-keywords}", siteKeywords);

		head = head.replace("${title-bar__content}", titleBarContentHtml);

		return head;
	}

	private String getPageTitle(String pageName, Object relObj) {
		StringBuilder sb = new StringBuilder();

		String forPrintPageName = pageName;

		if (forPrintPageName.equals("index")) {
			forPrintPageName = "home";
		}

		forPrintPageName = forPrintPageName.toUpperCase();
		forPrintPageName = forPrintPageName.replaceAll("_", " ");

		sb.append(Container.config.getSiteName() + " | ");
		sb.append(forPrintPageName);

		if (relObj instanceof Article) {
			Article article = (Article) relObj;

			sb.insert(0, article.title + " | ");
		}

		return sb.toString();
	}

	private String getTitleBarContentByPageName(String pageName) {
		if (pageName.equals("index")) {
			return "<i class=\"fas fa-home\"></i> <span>HOME</span>";
		} else if (pageName.equals("article_detail")) {
			return "<i class=\"fas fa-file-alt\"></i> <span>ARTICLE DETAIL</span>";
		} else if (pageName.startsWith("article_list_free")) {
			return "<i class=\"fab fa-free-code-camp\"></i> <span>FREE LIST</span>";
		} else if (pageName.startsWith("article_list_notice")) {
			return "<i class=\"fas fa-flag\"></i> <span>NOTICE LIST</span>";
		} else if (pageName.startsWith("article_list_java")) {
			return "<i class=\"fas fa-flag\"></i> <span>JAVA LIST</span>";
		} else if (pageName.startsWith("article_list_jsp")) {
			return "<i class=\"fas fa-clipboard-list\"></i> <span>JSP LIST</span>";
		}

		return "";
	}
}
