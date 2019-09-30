<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 하단 시작  -->
<div id="ft">

    <div id="ft_wr">
        <div id="ft_link">
            <a href="">회사소개</a>
            <a href="">개인정보처리방침</a>
            <a href="">서비스이용약관</a>
        </div>
        <div id="ft_catch"><img src="<%=request.getContextPath()%>/images/khLogo.png" alt="우마오"></div>
        <div id="ft_copy">Copyright © <b>소유하신 도메인.</b> All rights reserved.</div>
    </div>

    <button type="button" id="top_btn"><i class="fa fa-arrow-up" aria-hidden="true"></i></button>
    <script>

        $(function () {
            $("#top_btn").on("click", function () {
                $("html, body").animate({ scrollTop: 0 }, '500');
                return false;
            });
        });
    </script>
</div>
</body>
<!-- 하단 끝 -->