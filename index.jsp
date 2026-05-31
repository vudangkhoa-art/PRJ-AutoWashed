
<%@page import="dto.Customer"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>G6 CarWash</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #0f172a; 
            color: #f8fafc;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .container {
            width: 85%;
            max-width: 1200px;
            margin: 0 auto;
        }

        header {
            background-color: #1e293b;
            padding: 15px 0;
            border-bottom: 1px solid #334155;
        }

        header .header-wrap {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo a {
            font-size: 24px;
            font-weight: bold;
            text-transform: uppercase;
            color: #38bdf8; 
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .auth-buttons {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .btn-login {
            color: #94a3b8;
            padding: 8px 16px;
            transition: color 0.3s;
        }

        .btn-login:hover {
            color: #fff;
        }

        .btn-register {
            background-color: #38bdf8;
            color: #0f172a;
            padding: 8px 20px;
            border-radius: 6px;
            font-weight: 600;
            transition: background 0.3s;
        }

        .btn-register:hover {
            background-color: #0ea5e9;
        }
        nav {
            background-color: #0f172a;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.5);
            padding: 12px 0;
            border-bottom: 1px solid #1e293b;
        }

        nav ul {
            display: flex;
            justify-content: center;
            list-style: none;
            gap: 30px;
        }

        nav ul li a {
            font-size: 16px;
            font-weight: 500;
            color: #cbd5e1;
            transition: color 0.3s;
        }

        nav ul li a:hover, nav ul li a.active {
            color: #38bdf8;
        }

        .hero-section {
            padding: 60px 0;
        }

        .hero-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            align-items: center;
        }

        .hero-image-box {
            position: relative;
        }

        .hero-image-box img {
            width: 100%;
            height: auto;
            border-radius: 12px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.7);
            object-fit: cover;
        }
    .slider-container {
    position: relative;
    width: 100%;
    height: 400px; 
    border-radius: 12px;
    overflow: hidden; 
    box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.7);
    }

    .slide {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    opacity: 0; 
    transition: opacity 0.6s ease-in-out; 
    }

    .slide.active {
    opacity: 1;
    }

    .slide img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    }
    .slide-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(15, 23, 42, 0.6);
    color: white;
    border: none;
    font-size: 20px;
    padding: 12px 16px;
    cursor: pointer;
    border-radius: 50%;
    transition: background 0.3s;
    z-index: 10;
    }

    .slide-btn:hover {
    background-color: #38bdf8; 
    }

    .prev-btn { left: 15px; }
    .next-btn { right: 15px; }

    .slide-dots {
    position: absolute;
    bottom: 15px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 8px;
    z-index: 10;
    }

    .dot {
    width: 10px;
    height: 10px;
    background-color: rgba(255, 255, 255, 0.4);
    border-radius: 50%;
    cursor: pointer;
    transition: background 0.3s;
    }

    .dot.active {
    background-color: #38bdf8; 
    width: 20px;
    border-radius: 5px;
    }
        .hero-content h1 {
            font-size: 36px;
            line-height: 1.3;
            margin-bottom: 20px;
            color: #fff;
        }

        .hero-content h1 span {
            color: #38bdf8;
        }

        .hero-content .subtitle {
            font-size: 18px;
            color: #94a3b8;
            margin-bottom: 30px;
        }

        .benefit-list {
            margin-bottom: 35px;
        }

        .benefit-item {
            display: flex;
            align-items: flex-start;
            gap: 15px;
            margin-bottom: 20px;
        }

        .benefit-icon {
            background-color: rgba(56, 189, 248, 0.1);
            color: #38bdf8;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            font-size: 18px;
        }

        .benefit-text h3 {
            font-size: 18px;
            color: #f1f5f9;
            margin-bottom: 4px;
        }

        .benefit-text p {
            color: #94a3b8;
            font-size: 15px;
            line-height: 1.5;
        }
        .cta-btn {
            display: inline-block;
            background: linear-gradient(135deg, #38bdf8 0%, #0284c7 100%);
            color: #fff;
            padding: 14px 30px;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
            box-shadow: 0 4px 14px rgba(56, 189, 248, 0.4);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .cta-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(56, 189, 248, 0.6);
        }

        @media (max-width: 768px) {
            .hero-grid {
                grid-template-columns: 1fr;
                gap: 30px;
            }
            nav ul {
                gap: 15px;
            }
        }
    </style>
</head>
<body>

    <header>
        <div class="container header-wrap">
            <div class="logo">
                <a href="MainController?action=home">
                    <i class="fa-solid fa-car-wash" style="color: #38bdf8;"></i>G6 CARWASH
                </a>
            </div>
            <div class="auth-buttons">
                <% 
                Customer us = (Customer) session.getAttribute("USER");
                
                if (us == null) { 
            %>
                    <a href="MainController?action=login" class="btn-login">Login</a>
                    <a href="MainController?action=register" class="btn-register">Register</a>
            <% 
                } else { 
            %>
                   <a href="MainController?action=customerDashboard_page" class="welcome-msg">Welcome, <%= us.getFullname() %></a>
                    <a href="MainController?action=logout" class="btn-logout" style="color: #ef4444; margin-left: 15px;">Logout</a>
            <% 
                } 
            %>
            </div>
        </div>
    </header>

    <nav>
        <div class="container">
            <ul>
                <li><a href="MainController?action=home" class="active">Home</a></li>
                <li><a href="MainController?action=booking">Booking</a></li>
                <li><a href="MainController?action=car_management">Car Management</a></li>
                <li><a href="MainController?action=membership">Membership</a></li>
                <li><a href="MainController?action=about_us">About us</a></li>
            </ul>
        </div>
    </nav>

    <main class="hero-section">
        <div class="container hero-grid">
            
          <div class="hero-image-box">
    <div class="slider-container">
        <div class="slide active">
            <img src="${pageContext.request.contextPath}/assets/xe1.jpg" alt="Automatic Washing">
        </div>
        <div class="slide">
            <img src="${pageContext.request.contextPath}/assets/xe2.jpg" alt="Automatic Washing">
        </div>
        <div class="slide">
            <img src="${pageContext.request.contextPath}/assets/xe3.jpg" alt="Premium Foam Wash">
        </div>
         <div class="slide">
            <img src="${pageContext.request.contextPath}/assets/logo.png" alt="Logo">
        </div>
        <button class="slide-btn prev-btn" onclick="moveSlide(-1)">&#10094;</button>
        <button class="slide-btn next-btn" onclick="moveSlide(1)">&#10095;</button>
        
        <div class="slide-dots">
            <span class="dot active" onclick="currentSlide(0)"></span>
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
            <span class="dot" onclick="currentSlide(3)"></span>
        </div>
    </div>
 </div>

            <div class="hero-content">
                <h1>Become a Member<br><span>Unlock Exclusive Privileges</span></h1>
                <p class="subtitle">Sign up for an account today to treat your beloved car to the ultimate professional care while maximizing your savings.</p>
                
                <div class="benefit-list">
                    
                    <div class="benefit-item">
                        <div class="benefit-icon">
                            <i class="fa-solid fa-gift"></i>
                        </div>
                        <div class="benefit-text">
                            <h3>First Wash on Us for Free!</h3>
                            <p>A special welcome gift reserved exclusively for new members. Enjoy a free car wash right after successfully activating your account.</p>
                        </div>
                    </div>

                    <div class="benefit-item">
                        <div class="benefit-icon">
                            <i class="fa-solid fa-gem"></i>
                        </div>
                        <div class="benefit-text">
                            <h3>Earn Points, Claim Various Rewards</h3>
                            <p>Every service counts! Accumulate points on every visit to level up your membership status and gain various rewards.</p>
                        </div>
                    </div>

                    <div class="benefit-item">
                        <div class="benefit-icon">
                            <i class="fa-solid fa-calendar-check"></i>
                        </div>
                        <div class="benefit-text">
                            <h3>Priority Booking - Zero Waiting Time</h3>
                            <p>Higher-tier members unlock our "Priority Booking" feature. Secure your slot during peak hours and get serviced immediately without waiting in line.</p>
                        </div>
                    </div>

                </div>

                <a href="MainController?action=register" class="cta-btn">Claim Your Rewards Now!</a>
            </div>

        </div>
    </main>
<script>
    let currentSlideIndex = 0;
    const slides = document.querySelectorAll('.slide');
    const dots = document.querySelectorAll('.dot');
    let slideTimer;

    function showSlide(index) {
        if (index >= slides.length) { currentSlideIndex = 0; }
        else if (index < 0) { currentSlideIndex = slides.length - 1; }
        else { currentSlideIndex = index; }

        slides.forEach(slide => slide.classList.remove('active'));
        dots.forEach(dot => dot.classList.remove('active'));

        slides[currentSlideIndex].classList.add('active');
        dots[currentSlideIndex].classList.add('active');
    }

    function moveSlide(step) {
        clearInterval(slideTimer); 
        showSlide(currentSlideIndex + step);
        startAutoSlide(); 
    }

    function currentSlide(index) {
        clearInterval(slideTimer);
        showSlide(index);
        startAutoSlide();
    }

    function startAutoSlide() {
        slideTimer = setInterval(() => {
            showSlide(currentSlideIndex + 1);
        }, 3000); 
    }
    startAutoSlide();
</script>
</body>
</html>