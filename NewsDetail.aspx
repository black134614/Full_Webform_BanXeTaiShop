<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewsDetail.aspx.cs" Inherits="NewsDetail" %>

<%@ Register Src="~/UserControl/ucMainCategory.ascx" TagPrefix="uc1" TagName="ucMainCategory" %>
<%@ Register Src="~/UserControl/ucRelativeNews.ascx" TagPrefix="uc1" TagName="ucRelativeNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>chi tiet - tin tuc</title>
    <meta name="description" content="Day la mo ta seo web site " />
    <meta name="keywords" content="Bo title vao" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="Server">
    <uc1:ucMainCategory runat="server" ID="ucMainCategory" />
    <section class="container-fluid my-3">
        <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../Default.aspx">Trang Chủ</a></li>
            <asp:Repeater ID="Repeater_breadcrumb" runat="server">
                <ItemTemplate>
                    <li class="breadcrumb-item"><a href='<%# Eval("cID","../List.aspx?cID={0}") %>'><%# Eval("Title") %></a></li>
                    <asp:Repeater DataSource='<%# Eval("Product") %>' runat="server">
                        <ItemTemplate>
                            <li class="breadcrumb-item active"><%# Eval("Title") %></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
            </asp:Repeater>
        </ol>
    </nav>
        <div class="item-info row">
            <asp:Repeater ID="Repeater_Main" runat="server">
                <ItemTemplate>
                    <div class="col-12 col-xl-8 detail">
                        <h4 class="text-center text-primary my-3 title"><%# Eval("Title") %></h4>
                        <div class="description font-weight-bold text-center" style="text-indent: 2rem;">
                            <%# Eval("Description") %>
                        </div>
                        <p class="lh-base">
                            <%# Eval("Detail") %>
                        </p>
                        <div class="my-3">
                            <h5>Gợi ý cho bạn</h5>
                            <div class="mt-2 text-muted">
                                <span>Từ Khóa gợi ý:</span>
                                <%# Eval("Keywords") %>
                            </div>
                            <div class="mt-2 text-muted">
                                <span>Sản phẩm liên quan:</span>
                                <asp:Repeater DataSource='<%# Eval("Relative") %>' runat="server">
                                    <ItemTemplate>
                                        <asp:Repeater DataSource='<%# Eval("Product") %>' runat="server">
                                            <ItemTemplate><a href='<%# String.Format("Detail.aspx?cID={0}&ID={1}",Eval("cID"),Eval("ID")) %>'><%# Eval("Title") %></a></ItemTemplate>
                                        </asp:Repeater>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="col-12 col-xl-4">
                <div id="facebook-comment">
                    <div class="comment">
                        <div class="fb-comments w-100" data-href="https://developers.facebook.com/docs/plugins/comments"
                            data-numposts="3" data-width="100%">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <uc1:ucRelativeNews runat="server" ID="ucRelativeNews" />
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script_holder" runat="Server">
    <script src="Plugins/FancyBox/jquery.fancybox.min.js"></script>
    <script src="Plugins/OwlCarousel2/owl.carousel.min.js"></script>
    <script src="Plugins/aos/aos.js"></script>
    <script src="Plugins/mask/jquery.mask.min.js"></script>
</asp:Content>

