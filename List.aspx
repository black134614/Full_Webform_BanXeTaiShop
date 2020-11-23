<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="List" %>

<%@ Register Src="~/UserControl/ucMainCategory.ascx" TagPrefix="uc1" TagName="ucMainCategory" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Danh sach - ten main-category</title>
    <meta name="description" content="Day la mo ta seo web site " />
    <meta name="keywords" content="Bo title vao" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="Server">
    <uc1:ucMainCategory runat="server" ID="ucMainCategory" />
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../Default.aspx">Trang Chủ</a></li>
            <asp:Repeater ID="Repeater_breadcrumb" runat="server">
                <ItemTemplate>
                    <li class="breadcrumb-item active"><%# Eval("Title") %>  </li>
                </ItemTemplate>
            </asp:Repeater>
            <li class="breadcrumb-item active" id="supportBreadcrumb" runat="server">Tất cả danh mục sản phẩm</li>
        </ol>
    </nav>
    <section class="container-fluid my-3">
        <div id="toolFilter" runat="server" class="tool row">
            <div class="col-1 text-center">
                <span class="fa fa-filter fa-2x"></span>
            </div>
            <div class="input-group mb-3 col-11 col-md-5">
                <div class="input-group-prepend">
                    <asp:LinkButton ID="buttonSearch" runat="server" OnClick="buttonSearch_Click"
                        class="btn btn-secondary m-0 px-3 py-2 z-depth-0 waves-effect">
                        <span class="fa fa-search"></span>
                    </asp:LinkButton>
                </div>
                <asp:DropDownList class="custom-select browser-default" ID="filterOption" runat="server">
                    <asp:ListItem Selected="True" Value="0" Text="Mới nhất" />
                    <asp:ListItem Value="1" Text="Cũ hơn" />
                </asp:DropDownList>
            </div>
            <div class="col-12 col-sm-6">
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-secondary active m-0 px-3 py-2 z-depth-0 waves-effect">
                        <input type="radio" name="options" id="inputViewAll" runat="server" checked>
                        Xem tất cả
                    </label>
                    <label class="btn btn-secondary m-0 px-3 py-2 z-depth-0 waves-effect">
                        <input type="radio" name="options" id="inputSale" runat="server">
                        Giảm giá
                    </label>
                    <label class="btn btn-secondary m-0 px-3 py-2 z-depth-0 waves-effect">
                        <input type="radio" name="options" id="inputChoice" runat="server">
                        Bình chọn
                    </label>
                </div>
            </div>
        </div>
        <asp:Repeater ID="Repeater_Main" runat="server">
            <ItemTemplate>
                <div>
                    <h3 class="text-center text-uppercase"><%# Eval("Title") %></h3>
                </div>
                <div class="product row mt-3">
                    <asp:Repeater DataSource='<%# Eval("Product") %>' runat="server">
                        <ItemTemplate>
                            <div class='<%# (Container.ItemIndex + 1) % 2 == 0 ? "item col-12 col-sm-6 col-lg-4 col-xl-3 bg-warning rounded text-center" : "item col-12 col-sm-6 col-lg-4 col-xl-3 rounded text-center" %>' data-aos="zoom-in">
                                <div>
                                    <a href='<%# String.Format("Detail.aspx?cID={0}&ID={1}",Eval("cID"),Eval("ID")) %>'>
                                        <img class="item-img img-fluid rounded animate-img" src='<%# Eval("Avatar") %>' alt='<%# Eval("Description") %>' />
                                    </a>
                                    <div class="item-content">
                                        <a href='<%# String.Format("Detail.aspx?cID={0}&ID={1}",Eval("cID"),Eval("ID")) %>'>
                                            <h5 class="item-title"><%# Eval("Title") %></h5>
                                        </a>
                                        <p class="price">
                                            <span class="fa fa-money"></span>
                                            <span class='<%# (int)Eval("salePrice") == 0 ? "money line-through d-none" : "money line-through" %>'><%# (int)Eval("salePrice") == 0 ? 0 : Eval("OriginalPrice") %></span>
                                            <span class="money"><%# (int)Eval("salePrice") == 0 ? Eval("OriginalPrice") :  Eval("SalePrice")%></span>
                                        </p>
                                        <p class="prev-price">
                                            Trả trước:
                                                    <span class="money"><%# Eval("Prepay") %></span>
                                        </p>
                                    </div>
                                    <div class="tool text-center">
                                        <asp:Repeater DataSource='<%# Eval("firstImage") %>' runat="server">
                                            <ItemTemplate>
                                                <a class="btn btn-info" href='<%# Eval("Link") %>'
                                                    data-caption='<%# Eval("Title") %>' data-fancybox='<%# Eval("ID","images{0}") %>' data-thumbs='{"autoStart":true}'>Xem thêm
                                                </a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <a class="btn btn-danger" href='<%# String.Format("Detail.aspx?cID={0}&ID={1}",Eval("cID"),Eval("ID")) %>'>Đặt Trước
                                        </a>
                                    </div>
                                    <div class="img-preview-item d-none">
                                        <asp:Repeater DataSource='<%# Eval("listImages") %>' runat="server">
                                            <ItemTemplate>
                                                <div data-fancybox='<%# Eval("ID","images{0}") %>' data-type="image" data-caption='<%# Eval("Title") %>'
                                                    data-thumbs='<%# Eval("Link") %>'>
                                                    <img src='<%# Eval("Link") %>' alt='<%# Eval("Description") %>' />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                                <div class='<%# (Container.ItemIndex + 1) % 2 != 0 ?"item-circle fa fa-circle fa-2x text-warning" : "item-circle fa fa-sun-o fa-2x text-warning" %>'></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script_holder" runat="Server">
    <script src="Plugins/FancyBox/jquery.fancybox.min.js"></script>
    <script src="Plugins/OwlCarousel2/owl.carousel.min.js"></script>
    <script src="Plugins/aos/aos.js"></script>
    <script src="Plugins/mask/jquery.mask.min.js"></script>
</asp:Content>

