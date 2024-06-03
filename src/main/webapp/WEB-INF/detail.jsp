<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: minseok
  Date: 24. 6. 1.
  Time: 오전 2:37
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
    <style>
        h1, h2, h3, h4, h5, h6 {
            font-family: Yeseva One, serif;
        }
        #commentSubmitBtn{
            color: white;
        }
        #commentSubmitBtn:hover{
            color: black;
        }
    </style>
    <title>Title</title>
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
                <a class="hover:underline" href="<c:url value="/login"/>">
                    Login
                </a>
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
            <article class="border rounded-lg shadow-sm overflow-hidden">
                <img
                        src="https://kr.object.ncloudstorage.com/bitcamp124/image/${post.imageUrl}"
                        alt="Blog post cover image"
                        width="800"
                        height="400"
                        class="w-full h-48 object-cover"
                        style="aspect-ratio: 800 / 400; object-fit: cover;"
                />
                <div class="p-6">
                    <%--                    본문 제목--%>
                    <h1 class="text-3xl font-bold mb-4">${post.title}</h1>
                    <div class="flex items-center gap-4 mb-4">
                        <div class="flex items-center gap-2">
              <span class="relative flex shrink-0 overflow-hidden rounded-full w-6 h-6">
                <img src="https://generated.vusercontent.net/placeholder.svg" alt="Author avatar"/>
                <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">JM</span>
              </span>
                            <%--                            본문 작성자--%>
                            <span class="text-gray-500">Minseok Jeong</span>
                        </div>
                        <%--                        본문 날짜--%>
                        <span class="text-gray-500"><fmt:formatDate value="${post.createdAt}" pattern="MMM d, yyyy" /></span>
                    </div>
                    <%--                    본문 내용--%>
                    <div class="prose prose-lg">
                        ${post.content}
                    </div>
                </div>


                <%--                댓글 container --%>
                <div class="border-t p-6">
                    <h2 class="text-2xl font-bold mb-4">Comments</h2>
                    <div class="space-y-4">

                        <%--            댓글 block --%>
                        <div class="flex items-start gap-4">
                            <span class="relative flex shrink-0 overflow-hidden rounded-full w-10 h-10">
                                <span class="flex h-full w-full items-center justify-center rounded-full bg-muted">JD</span>
                            </span>
                            <div class="flex-1">
                                <div class="flex items-center justify-between mb-2">
                                    <div class="font-medium">Jane Doe</div>
                                    <div class="text-gray-500 text-sm">May 2, 2023</div>
                                </div>
                                <p>Great article! I really enjoyed reading about the future of web development.</p>
                            </div>
                        </div>


                    </div>
                    <div class="mt-6">
              <textarea
                      id="commentContent"
                      class="flex min-h-[80px] bg-background text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 w-full rounded-lg border border-gray-300 p-2"
                      placeholder="Write your comment..."
              ></textarea>
                        <input type="hidden" id="userId" name="userId" value="${sessionScope.userId}">
                        <input type="hidden" id="postId" name="postId" value="${post.id}">
                        <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 mt-2"
                                onclick="submitComment()"
                                id="commentSubmitBtn"
                        >
                            Submit
                        </button>
                    </div>
                </div>


            </article>
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
                            <button class="page-link" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </button>
                        </li>
                        <li class="page-item">
                            <button class="page-link" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </button>
                        </li>
                    </ul>
                </nav>

                <ul class="space-y-2">
                    <li>
                        <a class="hover:underline" href="#">
                            Web Development
                        </a>
                    </li>
                    <li>
                        <a class="hover:underline" href="#">
                            Artificial Intelligence
                        </a>
                    </li>
                    <li>
                        <a class="hover:underline" href="#">
                            Technology Trends
                        </a>
                    </li>
                    <li>
                        <a class="hover:underline" href="#">
                            Programming Languages
                        </a>
                    </li>
                </ul>
            </div>
            <div class="border rounded-lg shadow-sm p-6">
                <h3 class="text-xl font-bold mb-4">Popular Posts</h3>
                <ul class="space-y-4">
                    <li>
                        <a class="flex items-center gap-4 hover:underline" href="#">
                            <img
                                    src="https://generated.vusercontent.net/placeholder.svg"
                                    alt="Recent post cover image"
                                    width="80"
                                    height="80"
                                    class="rounded-lg w-20 h-20 object-cover"
                                    style="aspect-ratio: 80 / 80; object-fit: cover;"
                            />
                            <div>
                                <h4 class="text-lg font-medium">The Future of Remote Work</h4>
                                <p class="text-gray-500">May 10, 2023</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a class="flex items-center gap-4 hover:underline" href="#">
                            <img
                                    src="https://generated.vusercontent.net/placeholder.svg"
                                    alt="Recent post cover image"
                                    width="80"
                                    height="80"
                                    class="rounded-lg w-20 h-20 object-cover"
                                    style="aspect-ratio: 80 / 80; object-fit: cover;"
                            />
                            <div>
                                <h4 class="text-lg font-medium">The Impact of 5G Technology</h4>
                                <p class="text-gray-500">April 25, 2023</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a class="flex items-center gap-4 hover:underline" href="#">
                            <img
                                    src="https://generated.vusercontent.net/placeholder.svg"
                                    alt="Recent post cover image"
                                    width="80"
                                    height="80"
                                    class="rounded-lg w-20 h-20 object-cover"
                                    style="aspect-ratio: 80 / 80; object-fit: cover;"
                            />
                            <div>
                                <h4 class="text-lg font-medium">The Rise of Sustainable Tech</h4>
                                <p class="text-gray-500">April 1, 2023</p>
                            </div>
                        </a>
                    </li>
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
    function submitComment(){
        const content = document.getElementById("commentContent").value;
        const postId = document.getElementById("postId").value;
        const userId = document.getElementById("userId").value;
        if (content.length === 0){
            alert("Enter A Comment");
            return;
        }
        const formData = new FormData();
        formData.append('content', content);
        formData.append('postId', postId);
        formData.append('userId', userId);

        console.log(postId + userId);
        fetch('/comments', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (response.ok) {
                    alert("Comment created successfully");
                    window.location.reload();
                } else {
                    alert("Failed to create comment");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred. Please try again later.');
            });
    }
</script>

</body>
</html>
