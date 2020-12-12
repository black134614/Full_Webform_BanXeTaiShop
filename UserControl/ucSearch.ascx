<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucSearch.ascx.cs" Inherits="UserControl_ucSearch" %>

<section style="display: none" class="rouned" id="searchBox">
    <h3>Mời bạn nhập từ khóa tìm kiếm <span class="fa fa-search text-primary"></span></h3>
    <div class="md-form input-group mb-3">
        <input type="text" class="form-control Material-input-search" placeholder="Từ khóa có 2 kí tự trở lên">
        <div class="input-group-append">
            <button class="btn btn-md btn-primary m-0 px-3 waves-effect waves-light" type="button" id="MaterialButton-search">Tìm</button>
        </div>
    </div>
    <span>Gợi ý: từ khóa tìm kiếm cần chính xác trùng khớp với sản phẩm hoặc bài viết.</span>
</section>
