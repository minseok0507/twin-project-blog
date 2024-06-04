<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: minseok
  Date: 24. 6. 1.
  Time: 오전 1:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Yeseva+One&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Yeseva+One&display=swap"
          rel="stylesheet">
    <title>Blog</title>
    <style>
        /*body {*/
        /*    font-family: DM Serif Display, serif;*/
        /*}*/
        h1, h2, h3, h4, h5, h6 {
            font-family: Yeseva One, serif;
        }
    </style>
    <script>
        const html = [];
        const date = [];
        const popDate = [];
        let pageIndex = 0;
        let pageMax = ${maxPage}-1;
    </script>
</head>


<body>

<div class="flex flex-col min-h-screen">
    <header class="bg-gray-900 text-white py-4 shadow-md">
        <div class="container mx-auto flex items-center justify-between">
            <a class="flex items-center gap-2" href="<c:url value="/"/>">
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="h-6 w-6"
                >
                    <path d="m8 3 4 8 5-5 5 15H2L8 3z"></path>
                </svg>
                <span class="text-xl font-bold">Blog</span>
            </a>
            <nav class="hidden md:flex items-center gap-4">
                <a class="hover:underline" href="<c:url value="/"/>">
                    Blog
                </a>

                <c:if test="${sessionScope.user == null}">
                    <a class="hover:underline" href="<c:url value="/login"/>">
                        Login
                    </a>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <a class="hover:underline" href="<c:url value="/logout"/>">
                        logout
                    </a>
                </c:if>
                <c:if test="${sessionScope.user == 'admin'}">
                    <a class="hover:underline" href="<c:url value="/write"/>">
                        Write
                    </a>
                </c:if>


            </nav>
            <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3 md:hidden">
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="h-5 w-5"
                >
                    <line x1="4" x2="20" y1="12" y2="12"></line>
                    <line x1="4" x2="20" y1="6" y2="6"></line>
                    <line x1="4" x2="20" y1="18" y2="18"></line>
                </svg>
                <span class="sr-only">Toggle menu</span>
            </button>
        </div>
    </header>
    <main class="container mx-auto grid grid-cols-1 md:grid-cols-[3fr_1fr] gap-8 my-8">
        <div class="space-y-8">


            <c:forEach items="${posts}" var="post" varStatus="i">
                <article class="border rounded-lg shadow-sm overflow-hidden">
                    <img
                            src="https://kr.object.ncloudstorage.com/bitcamp124/image/${post.imageUrl}"
                            alt="${post.imageUrl}"
                            width="800"
                            height="400"
                            class="w-full h-48 object-cover"
                            style="aspect-ratio: 800 / 400; object-fit: cover;"
                    />
                    <div class="p-6">
                        <h2 class="text-2xl font-bold mb-2">
                            <a class="hover:underline" href="<c:url value="/detail?id=${post.id}"/>">
                                    ${post.title}
                            </a>
                        </h2>
                        <div class="flex items-center gap-4 mb-4">
                            <div class="flex items-center gap-2">
                    <span class="relative flex shrink-0 overflow-hidden rounded-full w-6 h-6">
                        <img class="aspect-square h-full w-full" alt="Author avatar"
                             src="https://generated.vusercontent.net/placeholder.svg"/>
                    </span>
                                <span class="text-gray-500">Minseok Jeong</span>
                            </div>
                            <span class="text-gray-500" id="date-${i.index}">

                            </span>
                        </div>
                        <p class="text-gray-700 line-clamp-3" id="content-${i.index}"></p>
                    </div>
                </article>
                <script>
                    html.push('${post.content}');
                    date.push('${post.createdAt}');
                </script>
            </c:forEach>
            <script>
            </script>


            <%--            <article class="border rounded-lg shadow-sm overflow-hidden">--%>
            <%--                <img--%>
            <%--                        src="https://generated.vusercontent.net/placeholder.svg"--%>
            <%--                        alt="Blog post cover image"--%>
            <%--                        width="800"--%>
            <%--                        height="400"--%>
            <%--                        class="w-full h-48 object-cover"--%>
            <%--                        style="aspect-ratio: 800 / 400; object-fit: cover;"--%>
            <%--                />--%>
            <%--                <div class="p-6">--%>
            <%--                    <h2 class="text-2xl font-bold mb-2">--%>
            <%--                        <a class="hover:underline" href="<c:url value="/detail"/>">--%>
            <%--                            The Rise of Artificial Intelligence--%>
            <%--                        </a>--%>
            <%--                    </h2>--%>
            <%--                    <div class="flex items-center gap-4 mb-4">--%>
            <%--                        <div class="flex items-center gap-2">--%>
            <%--              <span class="relative flex shrink-0 overflow-hidden rounded-full w-6 h-6">--%>
            <%--                <img class="aspect-square h-full w-full" alt="Author avatar"--%>
            <%--                     src="https://generated.vusercontent.net/placeholder.svg"/>--%>
            <%--              </span>--%>
            <%--                            <span class="text-gray-500">Jane Smith</span>--%>
            <%--                        </div>--%>
            <%--                        <span class="text-gray-500">April 15, 2023</span>--%>
            <%--                    </div>--%>
            <%--                    <p class="text-gray-700 line-clamp-3">--%>
            <%--                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl eget ultricies--%>
            <%--                        tincidunt,--%>
            <%--                        nisl nisl aliquam nisl, eget aliquam nisl nisl eget nisl. Sed euismod, nisl eget ultricies--%>
            <%--                        tincidunt,--%>
            <%--                        nisl nisl aliquam nisl, eget aliquam nisl nisl eget nisl.--%>
            <%--                    </p>--%>
            <%--                </div>--%>
            <%--            </article>--%>


        </div>


        <div class="space-y-8">
            <div class="border rounded-lg shadow-sm p-6">
                <h3 class="text-xl font-bold mb-4">Search</h3>
                <form class="flex items-center">
                    <input
                            class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 flex-1 rounded-l-lg"
                            placeholder="Search blog posts..."
                            type="text"
                    />
                    <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 px-4 py-2 rounded-r-lg">
                        <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="h-5 w-5"
                        >
                            <circle cx="11" cy="11" r="8"></circle>
                            <path d="m21 21-4.3-4.3"></path>
                        </svg>
                    </button>
                </form>
            </div>
            <div class="border rounded-lg shadow-sm p-6 relative">
                <h3 class="text-xl font-bold mb-4">list of documents.</h3>

                <nav aria-label="Page navigation example" class="absolute top-[20px] right-[20px]">
                    <ul class="pagination">
                        <li class="page-item">
                            <button class="page-link" aria-label="Previous" onclick="pageBackBtn()">
                                <span aria-hidden="true">&laquo;</span>
                            </button>
                        </li>
                        <li class="page-item">
                            <button class="page-link" aria-label="Next" onclick="pageNextBtn()">
                                <span aria-hidden="true">&raquo;</span>
                            </button>
                        </li>
                    </ul>
                </nav>

                <ul class="space-y-2" id="page_list">

                </ul>
            </div>
            <div class="border rounded-lg shadow-sm p-6">
                <h3 class="text-xl font-bold mb-4">Popular Posts</h3>
                <ul class="space-y-4">
                    <c:forEach items="${popularPosts}" var="post" varStatus="i">
                        <li>
                            <a class="flex items-center gap-4 hover:underline" href="<c:url value="/detail?id=${post.id}"/>">
                                <img
                                        src="https://kr.object.ncloudstorage.com/bitcamp124/image/${post.imageUrl}"
                                        alt="Recent post cover image"
                                        width="80"
                                        height="80"
                                        class="rounded-lg w-20 h-20 object-cover"
                                        style="aspect-ratio: 80 / 80; object-fit: cover;"
                                />
                                <div>
                                    <h4 class="text-lg font-medium">${post.title}</h4>
                                    <p class="text-gray-500" id="popDate-${i.index}"></p>
                                </div>
                            </a>
                        </li>
                        <script>
                            popDate.push('${post.createdAt}');
                        </script>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </main>


    <footer class="bg-gray-900 text-white py-6 mt-auto">
        <div class="container mx-auto flex items-center justify-between">
            <p>© 2024 Blog. All rights reserved.</p>
            <nav class="flex items-center gap-4">
                <a class="hover:underline" href="#">
                    Privacy
                </a>
                <a class="hover:underline" href="#">
                    Terms
                </a>
                <a class="hover:underline" href="#">
                    About
                </a>
            </nav>
        </div>
    </footer>
</div>


<script>

    pageList(pageIndex);
    for (let i = 0; i < html.length; i++) {
        document.getElementById("content-"+i).textContent = new DOMParser().parseFromString(html[i], 'text/html').body.textContent.trim();
        document.getElementById("date-"+i).textContent = formetDate(date[i]);
        document.getElementById("popDate-"+i).textContent = formetDate(popDate[i]);
    }

    function formetDate(isoDateString) {
        // Date 객체로 변환
        const date = new Date(isoDateString);

        // 옵션을 사용하여 날짜 형식을 지정
        const options = {year: 'numeric', month: 'long', day: 'numeric'};
        return date.toLocaleDateString('en-US', options);
    }

    function pageList(index){
        fetch('/list?index='+index, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(data => {
                let s = "";
                data.forEach(post => {
                    s +=
                        `
                    <li>
                        <a class="hover:underline" href="<c:url value="/detail?id=\${post.id}"/>">
                            \${post.title}
                        </a>
                    </li>
                    `;
                })
                document.getElementById("page_list").innerHTML = s;
            })
            .catch(error => {
                // 에러 처리 코드
                console.error(error);
            });
    }

    function pageBackBtn(){
        pageIndex--;
        if (pageIndex < 0){
            pageIndex = 0;
            return;
        }
        pageList(pageIndex);
    }
    function pageNextBtn(){
        pageIndex++;
        if (pageIndex > pageMax){
            pageIndex = pageMax;
            return;
        }
        pageList(pageIndex);
    }
</script>

</body>
</html>
