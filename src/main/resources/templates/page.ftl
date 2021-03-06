<div id="pageInfo" style="background: #e6e6e6;color:#676a6c;display: block">
    <!-- 每页默认显示页数,默认20条 -->
    <input type="hidden" id="pageSize" name="pageSize" value="20"/>
    <!-- 默认显示的页码 -->
    <input type="hidden" id="pageNum" name="pageNum" value="1"/>
    <!-- 默认显示的导航页数量 -->
    <input type="hidden" id="navigatePages" name="navigatePages" value="5"/>
    <!-- 总记录条数 -->
    <span id="totalCount">${pageInfo.total?c}</span>条记录 &nbsp;&nbsp;
    <!-- 当前页码/总页数 -->
    <span id="currentPage">${(pageInfo.pageNum==0)?string('1',pageInfo.pageNum)}</span>/<span
        id="totalPage">${(pageInfo.pages==0)?string('1',pageInfo.pages)}</span>&nbsp;&nbsp;
        <#if pageInfo.pages!=0 >
        <!-- 上一页 -->
            <#if !pageInfo.isFirstPage>
        <button id="prePage" type="button" value="${pageInfo.prePage}">上一页</button>&nbsp;&nbsp;
            </#if>
        <!-- 下一页 -->
            <#if !pageInfo.isLastPage>
        <button id="nextPage" type="button" value="${pageInfo.nextPage}">下一页</button>&nbsp;&nbsp;
            </#if>
        <!-- 第一页 -->
        <button id="firstPage" type="button"
                value="1"  <#list pageInfo.navigatepageNums as navigatepage><#if navigatepage==1>style="display:none" <#break> </#if></#list> >
            第一页
        </button>&nbsp;&nbsp;
        <!-- 上5页 -->
            <#if pageInfo.navigateFirstPage gt 5>
            <button id="preFivePage" type="button" value="${(pageInfo.pageNum)-5}">上5页</button>&nbsp;&nbsp;
            </#if>
            <#if pageInfo.navigatepageNums??>
                <#list pageInfo.navigatepageNums as navigatepage>
                <button id="navigatepage_${navigatepage}" type="button" value="${navigatepage}"
                        <#if navigatepage==pageInfo.pageNum>style="background-color:#3498db"</#if> >${navigatepage}</button>&nbsp;&nbsp;
                </#list>
            </#if>
        <!-- 下5页 -->
            <#if pageInfo.navigateLastPage lt pageInfo.pages>
        <button id="nextFivePage" type="button" value="${(pageInfo.pageNum)+5}">下5页</button>&nbsp;&nbsp;
            </#if>
        <!-- 最后一页 -->
        <button id="lastPage" type="button"
                value="${pageInfo.pages}" <#list pageInfo.navigatepageNums as navigatepage><#if navigatepage==pageInfo.pages>style="display:none" <#break> </#if></#list> >
            最后一页
        </button>&nbsp;&nbsp;
        <!-- 全部,即不分页 -->
        <button id="noPaging" type="button" value="0">全部</button>&nbsp;&nbsp;
        </#if>
        <#if pageInfo.pageSize==0 >
        <button id="paging" type="button" value="1">分页</button>&nbsp;&nbsp;
        </#if>
</div>
<script type="text/javascript">

    $("#prePage,#nextPage,#firstPage,#preFivePage,#pageInfo button[id^='navigatepage_'],#nextFivePage,#lastPage,#paging").bind("click", function () {
        $("#pageNum").val(this.value);
        var $form_search = $("#form_search").serialize();
        var param = $("#pageSize,#pageNum,#navigatePages").serialize();
        if ($form_search) {
            param = param + "&" + $form_search;
        }
        var relativePath = window.location.pathname;
        window.location.href = relativePath + "?" + param;
    });

    $("#noPaging").bind("click", function () {
        $("#pageSize").val(this.value);
        var $form_search = $("#form_search").serialize();
        var param = $("#pageSize,#pageNum,#navigatePages").serialize();
        if ($form_search) {
            param = param + "&" + $form_search;
        }
        var relativePath = window.location.pathname;
        window.location.href = relativePath + "?" + param;
    });
</script>