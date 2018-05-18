<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="pagination">
	<c:forEach var="index" begin="1" end="${page.totalPage}">  
	    <c:choose>  
	    	<c:when test="${index == 1}">  
	            <c:choose>  
	                <c:when test="${page.curPage == index}">  
	                    <a href="javascript:void(0)" class="btn active">${index}</a>  
	                </c:when>  
	                <c:otherwise>  
	                    <a href="${pageURL}?curPage=${index}" class="btn">${index}</a>  
	                </c:otherwise>  
	            </c:choose>  
	        </c:when>  
	        <c:otherwise>  
	            <c:choose>  
	                <c:when test="${index == page.totalPage}">  
	                    <c:choose>  
	                        <c:when test="${page.curPage == index}">  
	                            <a href="javascript:void(0)" class="btn active">${index}</a>
	                        </c:when>  
	                        <c:otherwise>  
	                            <a href="${pageURL}?curPage=${index}" class="btn">${index}</a>  
	                        </c:otherwise>  
	                    </c:choose>  
	                </c:when>  
	                <c:otherwise>  
	                    <c:choose>  
	                        <c:when test="${page.totalPage <= 10}">  
	                            <c:choose>  
	                                <c:when test="${page.curPage == index}">  
	                                    <a href="javascript:void(0)" class="btn active">${index}</a>
	                                </c:when>  
	                                <c:otherwise>  
	                                    <a href="${pageURL}?curPage=${index}" class="btn">${index}</a>  
	                                </c:otherwise>  
	                            </c:choose>  
	                        </c:when>  
	                        <c:otherwise>  
	                            <c:choose>  
	                                <c:when test="${page.curPage - index <= 3&& page.curPage-index >= -3 }">  
	                                    <c:choose>  
	                                        <c:when test="${page.curPage == index}">  
	                                            <a href="javascript:void(0)" class="btn active">${index}</a>
	                                        </c:when>  
	                                        <c:otherwise>  
	                                            <a href="${pageURL}?curPage=${index}" class="btn">${index}</a>  
	                                        </c:otherwise>  
	                                    </c:choose>  
	                                </c:when>  
	                                <c:otherwise>  
	                                    <c:choose>  
	                                        <c:when test="${index == 2}">  
	                                            <a href="javascript:void(0)" class="btn">...</a>  
	                                        </c:when>  
	                                        <c:when test="${index == page.totalPage - 1}">  
	                                            <a href="javascript:void(0)" class="btn">...</a>  
	                                        </c:when>  
	                                    </c:choose>  
	                                </c:otherwise>  
	                            </c:choose>  
	                        </c:otherwise>  
	                    </c:choose>  
	                </c:otherwise>  
	            </c:choose>  
	        </c:otherwise>  
		</c:choose>  
	</c:forEach> 
</div> 