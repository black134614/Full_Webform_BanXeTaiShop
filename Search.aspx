<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Tìm kiếm</title>
    <meta name="description" content="Day la mo ta seo web site " />
    <meta name="keywords" content="Bo title vao" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="Server">
    <div class="min-vh-100">
        <h3 id="message" runat="server" class="text-center mx-5">Kết quả tìm kiếm cho từ khóa:
        <asp:Label Text="..." ID="lableKeyWord" runat="server" /></h3>
        <h4 id="countResult" runat="server" class="text-center mb-3">Có
        <span id="productResult" runat="server">4 sản phẩm</span>
            <span id="newsResult" runat="server">5 bài viết</span>
            liên quan đến từ khóa của bạn</h4>
        <div id="toolFilter" runat="server" class="tool mx-3 row">
            <div class="col-1 text-center">
                <span class="fa fa-filter fa-2x"></span>
            </div>
            <div class="input-group mb-3 col-11 col-md-5">
                <div class="input-group-prepend">
                    <button id="buttonSearch"
                        class="btn btn-secondary m-0 px-3 py-2 z-depth-0 waves-effect">
                        <span class="fa fa-search"></span>
                    </button>
                </div>
                <input type="text" id="inputKeyWord" runat="server" class="form-control inputKeyWord" placeholder="Từ Khóa nhiều hơn 2 kí tự" value="" />
            </div>

        </div>
        <section class="container-fluid my-3">
            <div class="product row mt-3">
                <asp:Repeater ID="Repeater_Product" runat="server">
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
        </section>
        <hr class="mb-3" />
        <h4 id="newsSession" runat="server" class="text-center mb-3">Bài viết chứa từ khóa</h4>
        <section class="container-fluid my-3">
            <div class="news row">
                <asp:Repeater ID="Repeater_News" runat="server">
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
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script_holder" runat="Server">
    <script src="Plugins/FancyBox/jquery.fancybox.min.js"></script>
    <script src="Plugins/OwlCarousel2/owl.carousel.min.js"></script>
    <script src="Plugins/aos/aos.js"></script>
    <script src="Plugins/mask/jquery.mask.min.js"></script>
</asp:Content>

