<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fahasa Library - Quản lý Sách</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: #e0e0e0;
            overflow-x: hidden;
            min-height: 100vh;
            line-height: 1.6;
        }

        /* Left Bar */
        .left-bar {
            position: fixed;
            top: 0;
            left: -200px;
            width: 200px;
            height: 100vh;
            background: linear-gradient(135deg, #ff6f61, #e65b50);
            padding: 20px 10px;
            transition: all 0.3s ease;
            z-index: 1001;
            box-shadow: 5px 0 15px rgba(0, 0, 0, 0.3);
        }

        .left-bar.active {
            left: 0;
        }

        .left-bar .logo {
            text-align: center;
            margin-bottom: 30px;
            padding-right: 20px;
        }

        .left-bar .logo img {
            height: 60px;
            transition: transform 0.3s ease;
        }

        .left-bar .logo img:hover {
            transform: scale(1.1);
        }

        .left-bar .nav-item {
            padding: 12px 15px;
            margin: 10px 0;
            border-radius: 8px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #fff;
            font-weight: 500;
        }

        .left-bar .nav-item i {
            margin-right: 10px;
            font-size: 20px;
        }

        .left-bar .nav-item:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateX(5px);
        }

        .toggle-btn {
            position: fixed;
            top: 20px;
            left: 20px;
            background: rgba(255, 255, 255, 0.2);
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 24px;
            color: #fff;
            cursor: pointer;
            z-index: 1002;
            transition: all 0.3s ease;
        }

        .toggle-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: rotate(90deg);
        }

        /* Header */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 15px 30px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .header .logo img {
            height: 50px;
        }

        .search-and-filter {
            display: flex;
            align-items: center;
        }

        .search-bar {
            display: flex;
            align-items: center;
            max-width: 500px;
            width: 100%;
            margin-right: 20px;
        }

        .search-input {
            width: 100%;
            padding: 10px 20px;
            border: none;
            border-radius: 25px 0 0 25px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            font-size: 16px;
            outline: none;
            transition: all 0.3s ease;
        }

        .search-input::placeholder {
            color: #ccc;
        }

        .search-input:focus {
            background: rgba(255, 255, 255, 0.3);
        }

        .search-btn {
            padding: 10px 20px;
            background: linear-gradient(135deg, #4fc3f7, #42a5f5);
            border: none;
            border-radius: 0 25px 25px 0;
            color: #fff;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .search-btn:hover {
            background: linear-gradient(135deg, #42a5f5, #2196f3);
            transform: scale(1.05);
        }

        /* Filter Section */
        .filter-section {
            position: relative;
            display: inline-block;
        }

        .filter-btn {
            padding: 10px 20px;
            background: rgba(255, 255, 255, 0.2);
            border: none;
            border-radius: 25px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .filter-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
        }

        .filter-dropdown {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            padding: 10px;
            z-index: 1000;
            color: #2c3e50;
            width: 250px;
        }

        .filter-dropdown.active {
            display: block;
        }

        .filter-dropdown h4 {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .filter-dropdown ul {
            list-style: none;
            padding: 0;
        }

        .filter-dropdown ul li {
            padding: 5px 0;
            cursor: pointer;
        }

        .filter-dropdown ul li:hover {
            color: #e74c3c;
        }

        /* Main Content */
        .main-content {
            margin-top: 80px;
            padding: 30px;
            transition: margin-left 0.3s ease;
        }

        .main-content.shifted {
            margin-left: 200px;
        }

        /* Banner */
        .banner-section {
            position: relative;
            height: 500px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            margin-bottom: 30px;
        }

        .banner-carousel .carousel-item {
            height: 100%;
        }

        .banner-carousel .carousel-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease, filter 0.6s ease;
        }

        .banner-carousel .carousel-item:hover img {
            transform: scale(1.1);
            filter: brightness(1.2);
        }

        .banner-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: #fff;
        }

        .banner-overlay h1 {
            font-family: 'Playfair Display', serif;
            font-size: 56px;
            font-weight: 700;
            margin-bottom: 10px;
            animation: fadeInDown 1s ease-out;
        }

        .banner-overlay p {
            font-size: 20px;
            margin-bottom: 20px;
            animation: fadeInUp 1s ease-out;
        }

        .banner-overlay .cta-btn {
            padding: 10px 30px;
            background: linear-gradient(135deg, #ff6f61, #e65b50);
            border: none;
            border-radius: 25px;
            color: #fff;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .banner-overlay .cta-btn:hover {
            background: linear-gradient(135deg, #e65b50, #ff6f61);
            transform: scale(1.05);
        }

        @keyframes fadeInDown {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        /* Management Section */
        .management-section {
            margin-top: 20px;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            color: #2c3e50;
        }

        .management-section h2 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #34495e;
        }

        .management-form {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 20px;
        }

        .management-form input, .management-form textarea {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            width: 200px;
        }

        .management-form button {
            padding: 8px 20px;
            background: linear-gradient(135deg, #4fc3f7, #42a5f5);
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .management-form button:hover {
            background: linear-gradient(135deg, #42a5f5, #2196f3);
            transform: scale(1.05);
        }

        .management-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .management-table th, .management-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .management-table th {
            background: #f5f6fa;
            color: #34495e;
        }

        .management-table td a {
            color: #e74c3c;
            text-decoration: none;
            margin-right: 10px;
        }

        .management-table td a:hover {
            text-decoration: underline;
        }

        /* Chat and Social Icons */
        .chat-icon, .social-icon {
            position: fixed;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(135deg, #4fc3f7, #42a5f5);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-size: 24px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            z-index: 1000;
        }

        .chat-icon:hover, .social-icon:hover {
            transform: scale(1.2);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        .chat-icon {
            bottom: 20px;
            right: 20px;
        }

        .social-icon {
            bottom: 90px;
            right: 20px;
        }

        .chat-popup {
            position: fixed;
            bottom: 100px;
            right: 20px;
            width: 350px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            display: none;
            z-index: 1000;
        }

        .chat-header {
            background: linear-gradient(135deg, #4fc3f7, #42a5f5);
            padding: 10px 15px;
            color: #fff;
            font-weight: 600;
        }

        .chat-header .close-btn {
            float: right;
            border: none;
            background: none;
            color: #fff;
            font-size: 20px;
            cursor: pointer;
        }

        .chat-body {
            padding: 15px;
            height: 300px;
            overflow-y: auto;
            background: #f9fbfd;
        }

        .chat-footer {
            padding: 10px;
            background: #fff;
            display: flex;
            gap: 10px;
        }

        .chat-footer input {
            flex-grow: 1;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
        }

        .chat-footer button {
            padding: 8px 15px;
            background: linear-gradient(135deg, #4fc3f7, #42a5f5);
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
        }

        .chat-footer button:hover {
            background: linear-gradient(135deg, #42a5f5, #2196f3);
        }

        .message {
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
            max-width: 70%;
        }

        .user-message {
            background: #4fc3f7;
            color: #fff;
            align-self: flex-end;
        }

        .bot-message {
            background: #e0e0e0;
            color: #333;
            align-self: flex-start;
        }
    </style>
</head>
<body>
<button class="toggle-btn" onclick="toggleLeftBar()">
    <i class="bi bi-list"></i>
</button>

<div class="left-bar" id="leftBar">
    <div class="logo">
        <a href="/book">
            <img src="https://th.bing.com/th/id/OIP.Q2amTWlPUanyIlSCtEcoSwHaFZ?w=231&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Logo">
        </a>
    </div>
    <c:if test="${empty sessionScope.user}">
        <a href="/login" class="nav-item"><i class="bi bi-person-fill"></i> Tài khoản</a>
    </c:if>
    <c:if test="${not empty sessionScope.user}">
        <a href="/logout" class="nav-item"><i class="bi bi-box-arrow-right"></i> Đăng xuất</a>
    </c:if>
    <c:if test="${sessionScope.roleId == 1}">
        <div class="dropdown">
            <a href="#" class="nav-item" onclick="toggleDropdown(event)">
                <i class="bi bi-person-lines-fill"></i> Quản lý
            </a>
            <div class="dropdown-menu" id="dropdownMenu">
                <a href="/users"><i class="bi bi-people"></i> Quản lý Người dùng</a>
                <a href="/managementBook"><i class="bi bi-book"></i> Quản lý Sách</a>
                <a href="/orderDetails"><i class="bi bi-cart"></i> Quản lý Đơn hàng</a>
            </div>
        </div>
    </c:if>
    <a href="/orderpage" class="nav-item"><i class="bi bi-cart-fill"></i> Thanh toán</a>
</div>

<header class="header">
    <div class="logo">
        <a href="/book">
            <img src="https://th.bing.com/th/id/OIP.Q2amTWlPUanyIlSCtEcoSwHaFZ?w=231&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Logo">
        </a>
    </div>
    <div class="search-and-filter">
        <form action="/book" method="GET" class="search-bar">
            <input type="hidden" name="type" value="title">
            <input type="text" class="search-input" name="query" placeholder="Tìm kiếm sách...">
            <button type="submit" class="search-btn"><i class="bi bi-search"></i></button>
        </form>
        <div class="filter-section">
            <button class="filter-btn" onclick="toggleFilterDropdown()">Lọc</button>
            <div class="filter-dropdown" id="filterDropdown">
                <form action="/book" method="GET" id="filterForm">
                    <h4>Tác Giả</h4>
                    <ul>
                        <li><a href="#" onclick="filterByAuthor('Nam Cao')">Nam Cao</a></li>
                        <li><a href="#" onclick="filterByAuthor('Vũ Trọng Phụng')">Vũ Trọng Phụng</a></li>
                        <li><a href="#" onclick="filterByAuthor('Nguyễn Nhất Anh')">Nguyễn Nhất Anh</a></li>
                    </ul>
                    <h4>Giá</h4>
                    <ul>
                        <li><a href="#" onclick="filterByPrice(0, 50000)">0đ - 50.000đ</a></li>
                        <li><a href="#" onclick="filterByPrice(50000, 100000)">50.000đ - 100.000đ</a></li>
                        <li><a href="#" onclick="filterByPrice(100000, 150000)">100.000đ - 150.000đ</a></li>
                        <li><a href="#" onclick="filterByPrice(150000, 300000)">150.000đ - 300.000đ</a></li>
                    </ul>
                    <input type="hidden" name="type" id="filterType">
                    <input type="hidden" name="query" id="filterQuery">
                    <input type="hidden" name="minPrice" id="minPrice">
                    <input type="hidden" name="maxPrice" id="maxPrice">
                </form>
            </div>
        </div>
    </div>
</header>

<main class="main-content" id="mainContent">
    <div class="container">
        <div class="banner-section">
            <div id="bannerCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://cdn0.fahasa.com/media/magentothem/banner7/valentine_t2_840x320.jpg" class="d-block w-100" alt="Banner 1">
                    </div>
                    <div class="carousel-item">
                        <img src="https://cdn0.fahasa.com/media/magentothem/banner7/trangct2_152_840x320.jpg" class="d-block w-100" alt="Banner 2">
                    </div>
                    <div class="carousel-item">
                        <img src="https://cdn0.fahasa.com/media/magentothem/banner7/DinhTi_0225_840x320.jpg" class="d-block w-100" alt="Banner 3">
                    </div>
                    <div class="carousel-item">
                        <img src="https://cdn0.fahasa.com/media/magentothem/banner7/thanhtoankhongtienmat_t2_840x320.jpg" class="d-block w-100" alt="Banner 4">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#bannerCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#bannerCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <div class="banner-overlay">
                <h1>Fahasa Library</h1>
                <p>Quản lý Sách Hiệu Quả</p>
                <a href="#management-section" class="cta-btn">Bắt đầu ngay</a>
            </div>
        </div>

        <div class="management-section" id="management-section">
            <h2>Quản lý Sách</h2>
            <!-- Form Thêm Sách -->
            <form action="/managementBook" method="post" class="management-form">
                <input type="hidden" name="action" value="add">
                <input type="text" name="title" placeholder="Tiêu đề" required>
                <input type="text" name="author" placeholder="Tác giả" required>
                <input type="number" name="price" placeholder="Giá (VND)" step="0.01" required>
                <input type="text" name="imageURL" placeholder="URL ảnh" required>
                <input type="number" name="stockQuantity" placeholder="Số lượng tồn" required>
                <textarea name="bookDescription" placeholder="Mô tả sách" required></textarea>
                <button type="submit">Thêm Sách</button>
            </form>

            <!-- Bảng Danh Sách Sách -->
            <table class="management-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tiêu đề</th>
                    <th>Tác giả</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Mô tả</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td>${book.id}</td>
                        <td>${book.title}</td>
                        <td>${book.author}</td>
                        <td><fmt:formatNumber value="${book.price}" type="number" pattern="#,##0.00" /> VND</td>
                        <td>${book.stockQuantity}</td>
                        <td>${book.bookDescription}</td>
                        <td>
                            <a href="/managementBook?action=editForm&id=${book.id}">Sửa</a> |
                            <a href="/managementBook?action=deleteBook&id=${book.id}" onclick="return confirm('Bạn có chắc?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</main>

<div class="social-icon" onclick="window.open('https://www.facebook.com/profile.php?id=61562398671906', '_blank')">
    <i class="bi bi-facebook"></i>
</div>
<div class="chat-icon" id="chatButton">
    <i class="bi bi-chat-fill"></i>
</div>
<div class="chat-popup" id="chatPopup">
    <div class="chat-header">
        Chatbot Hỗ Trợ <button class="close-btn" id="closeChat">×</button>
    </div>
    <div class="chat-body" id="chatBody"></div>
    <div class="chat-footer">
        <input type="text" id="chatInput" placeholder="Nhập tin nhắn...">
        <button onclick="sendMessage()">Gửi</button>
    </div>
</div>

<script>
    function toggleLeftBar() {
        const leftBar = document.getElementById('leftBar');
        const mainContent = document.getElementById('mainContent');
        leftBar.classList.toggle('active');
        mainContent.classList.toggle('shifted');
    }

    function toggleDropdown(event) {
        event.preventDefault();
        const menu = document.getElementById('dropdownMenu');
        menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
    }

    function toggleFilterDropdown() {
        const dropdown = document.getElementById('filterDropdown');
        dropdown.classList.toggle('active');
    }

    function filterByAuthor(author) {
        const form = document.getElementById('filterForm');
        document.getElementById('filterType').value = 'author';
        document.getElementById('filterQuery').value = author;
        document.getElementById('minPrice').value = '';
        document.getElementById('maxPrice').value = '';
        form.submit();
    }

    function filterByPrice(minPrice, maxPrice) {
        const form = document.getElementById('filterForm');
        document.getElementById('filterType').value = 'findByPrice';
        document.getElementById('filterQuery').value = '';
        document.getElementById('minPrice').value = minPrice;
        document.getElementById('maxPrice').value = maxPrice;
        form.submit();
    }

    document.getElementById('chatButton').addEventListener('click', function() {
        const chatPopup = document.getElementById('chatPopup');
        chatPopup.style.display = 'block';
    });

    document.getElementById('closeChat').addEventListener('click', function() {
        document.getElementById('chatPopup').style.display = 'none';
    });

    async function sendMessage() {
        const input = document.getElementById('chatInput').value.trim();
        const chatBody = document.getElementById('chatBody');
        if (!input) return;

        const userMsg = document.createElement('div');
        userMsg.className = 'message user-message';
        userMsg.textContent = input;
        chatBody.appendChild(userMsg);

        document.getElementById('chatInput').value = '';
        chatBody.scrollTop = chatBody.scrollHeight;

        const loadingMsg = document.createElement('div');
        loadingMsg.className = 'message bot-message';
        loadingMsg.textContent = 'Đang trả lời...';
        chatBody.appendChild(loadingMsg);

        try {
            const response = await fetch("https://openrouter.ai/api/v1/chat/completions", {
                method: "POST",
                headers: {
                    "Authorization": "Bearer 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",
                    "HTTP-Referer": "http://localhost:8080/",
                    "X-Title": "HelloServlet",
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    "model": "deepseek/deepseek-r1:free",
                    "messages": [{"role": "user", "content": input}]
                })
            });

            const data = await response.json();
            chatBody.removeChild(loadingMsg);

            const botMsg = document.createElement('div');
            botMsg.className = 'message bot-message';
            botMsg.textContent = data.choices?.[0]?.message?.content || 'Không có phản hồi.';
            chatBody.appendChild(botMsg);
            chatBody.scrollTop = chatBody.scrollHeight;
        } catch (error) {
            chatBody.removeChild(loadingMsg);
            const errorMsg = document.createElement('div');
            errorMsg.className = 'message bot-message';
            errorMsg.textContent = 'Lỗi: ' + error.message;
            chatBody.appendChild(errorMsg);
            chatBody.scrollTop = chatBody.scrollHeight;
        }
    }

    // Đóng dropdown khi nhấp ra ngoài
    document.addEventListener('click', function(event) {
        const dropdown = document.getElementById('filterDropdown');
        const filterBtn = document.querySelector('.filter-btn');
        if (!filterBtn.contains(event.target) && !dropdown.contains(event.target)) {
            dropdown.classList.remove('active');
        }

        const menu = document.getElementById('dropdownMenu');
        const dropdownTrigger = document.querySelector('.dropdown .nav-item');
        if (menu && !dropdownTrigger.contains(event.target) && !menu.contains(event.target)) {
            menu.style.display = 'none';
        }
    });
</script>
</body>
</html>