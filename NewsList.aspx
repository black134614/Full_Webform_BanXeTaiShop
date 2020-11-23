<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewsList.aspx.cs" Inherits="NewsList" %>

<%@ Register Src="~/UserControl/ucMainCategory.ascx" TagPrefix="uc1" TagName="ucMainCategory" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Tin tuc - ten category</title>
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
    <asp:Repeater ID="Repeater_Main" runat="server">
        <ItemTemplate>
            <section class="container-fluid my-3">
                <div>
                    <h3 class="text-center text-uppercase"><%# Eval("Title") %></h3>
                </div>
                <div class="news row">
                    <asp:Repeater DataSource='<%# Eval("News") %>' runat="server">
                        <ItemTemplate>
                            <div class="item col-12 col-sm-6 col-lg-4 col-xl-3">
                                <a href='<%# String.Format("NewsDetail.aspx?ncID={0}&nID={1}",Eval("ncID"),Eval("nID")) %>'>
                                    <img class="img-fluid rounded animate-img" src='<%# Eval("Avatar") %>'
                                        alt='<%# Eval("Description") %>'
                                        data-toggle="tooltip" title='<%# Eval("Title") %>' />
                                    <h5 class="item-title"><%# Eval("Title") %></h5>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </section>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script_holder" runat="Server">
    <script src="Plugins/FancyBox/jquery.fancybox.min.js"></script>
    <script src="Plugins/OwlCarousel2/owl.carousel.min.js"></script>
    <script src="Plugins/aos/aos.js"></script>
    <script src="Plugins/mask/jquery.mask.min.js"></script>
</asp:Content>

