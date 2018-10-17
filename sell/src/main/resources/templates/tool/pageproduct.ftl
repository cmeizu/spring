<#if currentPage==index>
       <li class="disabled"><a href="#">${index}</a></li>
<#else>
       <li><a href="/sell/seller/product/list?page=${index}&size=${size}">${index}</a></li>
</#if>