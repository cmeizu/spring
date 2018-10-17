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
                            <th>订单id</th>
                            <th>姓名</th>
                            <th>机号</th>
                            <th>地址</th>
                            <th>金额</th>
                            <th>订单状态</th>
                            <th>支付状态</th>
                            <th>创建时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                    <#list orderDTOPage.content as orderDTO>
                    <tr>
                        <td>${orderDTO.orderId}</td>
                        <td>${orderDTO.buyerName}</td>
                        <td>${orderDTO.buyerPhone}</td>
                        <td>${orderDTO.buyerAddress}</td>
                        <td>${orderDTO.orderAmount}</td>
                        <td>${orderDTO.getOrderStatusEnum().message}</td>
                        <td>${orderDTO.getPayStatusEnum().message}</td>
                        <td>${orderDTO.createTime}</td>
                        <td><a href="/sell/seller/order/detail?orderId=${orderDTO.orderId}">详情</a></td>
                        <td>
                                <#if orderDTO.getOrderStatusEnum().message == "新订单">
                                    <a href="/sell/seller/order/cancel?orderId=${orderDTO.orderId}">取消</a>
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
                                <li><a href="/sell/seller/order/list?page=${currentPage-1}&size=${size}">上一页</a> </li>
                        </#if>
                            <#assign totalPage=orderDTOPage.getTotalPages()>
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
                                <#include "../tool/pageorder.ftl">
                            </#list>

                            <#--<#if orderDTOPage.getTotalPages() lte 10>-->
                                <#--<#list 1..orderDTOPage.getTotalPages() as index>-->
                                    <#--<#include "../tool/pageorder.ftl">-->
                                <#--</#list>-->
                            <#--<#elseif currentPage-4 lte 1>-->
                                <#--<#list 1..10 as index>-->
                                    <#--<#include "../tool/pageorder.ftl">-->
                                <#--</#list>-->
                            <#--<#elseif (currentPage-4 gte 1) && (currentPage + 5) lte orderDTOPage.getTotalPages()>-->
                                <#--<#list currentPage-4..currentPage+5 as index>-->
                                    <#--<#include "../tool/pageorder.ftl">-->
                                <#--</#list>-->
                            <#--<#elseif (currentPage+5) gte orderDTOPage.getTotalPages()>-->
                                <#--<#list (orderDTOPage.getTotalPages()-9)..orderDTOPage.getTotalPages() as index>-->
                                    <#--<#include "../tool/pageorder.ftl">-->
                                <#--</#list>-->
                            <#--</#if>-->
                    <#if currentPage gte orderDTOPage.getTotalPages()>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                            <li><a href="/sell/seller/order/list?page=${currentPage + 1}&size=${size}">下一页</a> </li>
                    </#if>
                            <li><a href="/sell/seller/order/list?page=${orderDTOPage.getTotalPages()}&size=${size}">尾页</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>