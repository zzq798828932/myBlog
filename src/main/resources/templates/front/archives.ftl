<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>11111</title>
    <link href="${base}/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${base}/css/blog.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div id="container-common">
        <div id="header">
            <div id="navbar">
                <ol class="breadcrumb">
                    <li>赵志强的网络日志</li>
                    <li><a href="${base}/article">首页</a></li>
                    <li><a href="${base}/archivesIndex">档案</a></li>
                </ol>
            </div>
            <hr/>
        </div>
        <div id="archives-content">
            <div id="archives-content-title">
                <div>${currentTag.name!''}(${(articleCount?c)!0}篇)</div>
            </div>
            <div id="archives-content-detail">
                <#if articleList??>
                <#list articleList as articleMap>
                <div class="archives-content-detail">
                    <h3>${articleMap.year}</h3>
                    <hr/>
                    <ul>
                        <#if (articleMap.articleList)??>
                        <#list articleMap.articleList as article >
                        <li><span><a
                                href="${base}/article/${(article.id)!''}">${article.title!''}</a><span>（@${(article.createTime)?date}）</span>
                        </li>
                    </#list>
                </#if>
                </ul>
            </div>
        </#list>
        <#else>
        <h3 style="margin:5rem auto">暂无内容</h3>
    </#if>
</div>
</div>
<div id="archives-category">
    <div id="archives-category-inner" style="border-radius: 2rem;border: solid 1px ;border-color: #0f0f0f33 ">
        <div style="margin: 2rem">
            <h3><strong><i>分类</i></strong></h3>
            <hr/>
            <div style="min-height:25rem;">
                <ul>
                    <#if tags??>
                    <#list tags as tag>
                    <li><a href="${base}/archives/${tag.id}">${tag.name}</a></li>
                </#list>
            </#if>
            </ul>
        </div>
    </div>
</div>
</div>
<div style="clear: both"></div>
</div>
<#include "../footer.ftl">
</div>
</div>
<script src="${base}/plugins/bootstrap/js/bootstrap.js"></script>
</body>
</html>
