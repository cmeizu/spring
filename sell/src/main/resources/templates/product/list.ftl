<html>

<#include "../common/header.ftl">

<body>

<div id="wrapper" class="toggled">
    <#--边栏sidebar-->
    <#include "../common/nav.ftl">
    <#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
            <#--分页-->
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>商品id</th>
                            <th>名称</th>
                            <th>图片</th>
                            <th>单价</th>
                            <th>库存</th>
                            <th>描述</th>
                            <th>类目</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                    <#list productInfoPage.content as productInfo>
                    <tr>
                        <td>${productInfo.productId}</td>
                        <td>${productInfo.productName}</td>
                        <td><img height="100" width="100" src="${productInfo.productIcon}" alt=""></td>
                        <td>${productInfo.productPrice}</td>
                        <td>${productInfo.productStock}</td>
                        <td>${productInfo.productDescription}</td>
                        <td>${productInfo.categoryType}</td>
                        <td>${productInfo.createTime}</td>
                        <td>${productInfo.updateTime}</td>
                        <td><a href="/sell/seller/product/index/?productId=${productInfo.productId}">修改</a></td>
                        <td>
                                <#if productInfo.getProductStatusEnum().message == "在架">
                                    <a href="/sell/seller/product/off_sale?productId=${productInfo.productId}">下架</a>
                                <#else>
                                    <a href="/sell/seller/product/on_sale?productId=${productInfo.productId}">上架</a>
                                </#if>
                        </td>
                    </tr>
                    </#list>
                        </tbody>
                    </table>
                <#--分页-->
                    <div class="col-md-12 column">
                        <ul class="pagination pull-right">
                            <li><a href="?page=1&size=${size}">首页</a></li>
                    <#if currentPage lte 1>
                                <li class="disabled"><a href="#">上一页</a></li>
                    <#else>
                                <li><a href="/sell/seller/product/list?page=${currentPage-1}&size=${size}">上一页</a> </li>
                    </#if>
                            <#assign totalPage=productInfoPage.getTotalPages()>
                            <#if totalPage lte 10>
                                <#assign maxCount=totalPage>
                            <#else>
                                <#assign maxCount=10>
                            </#if>
                            <#if totalPage-currentPage lte 5>
                                <#assign end=totalPage>
                                <#assign start=end-maxCount+1>
                            <#else>
                                <#if currentPage - 4 lte 1>
                                    <#assign start=1>
                                <#else>
                                    <#assign start=currentPage-4>
                                </#if>
                                <#assign end=start+maxCount-1>
                            </#if>
                            <#list start..end as index>
                                <#include "../tool/pageproduct.ftl">
                            </#list>
                            <#--<#if productInfoPage.getTotalPages() lte 10>-->
                                <#--<#list 1..productInfoPage.getTotalPages() as index>-->
                                    <#--<#include "../tool/pageproduct.ftl">-->
                                <#--</#list>-->
                            <#--<#elseif currentPage-4 lte 1>-->
                                <#--<#list 1..10 as index>-->
                                    <#--<#include "../tool/pageproduct.ftl">-->
                                <#--</#list>-->
                            <#--<#elseif (currentPage-4 gte 1) && (currentPage + 5) lte productInfoPage.getTotalPages()>-->
                                <#--<#list currentPage-4..currentPage+5 as index>-->
                                    <#--<#include "../tool/pageproduct.ftl">-->
                                <#--</#list>-->
                            <#--<#elseif (currentPage+5) gte productInfoPage.getTotalPages()>-->
                                <#--<#list (productInfoPage.getTotalPages()-9)..productInfoPage.getTotalPages() as index>-->
                                    <#--<#include "../tool/pageproduct.ftl">-->
                                <#--</#list>-->
                            <#--</#if>-->
                    <#if currentPage gte productInfoPage.getTotalPages()>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                            <li><a href="/sell/seller/product/list?page=${currentPage + 1}&size=${size}">下一页</a> </li>
                    </#if>
                            <li><a href="/sell/seller/product/list?page=${productInfoPage.getTotalPages()}&size=${size}">尾页</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>