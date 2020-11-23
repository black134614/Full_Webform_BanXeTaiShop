<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GioiThieu.aspx.cs" Inherits="GioiThieu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Giới thiệu - ten web site</title>
    <meta name="description" content="Day la mo ta seo web site " />
    <meta name="keywords" content="Bo title vao" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" Runat="Server">
    <section class="container">
        <div class="text-justify">
            <asp:Repeater ID="Repeater_Main" runat="server">
                <ItemTemplate>
                    <%# Eval("WebsiteDetail") %>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script_holder" Runat="Server">
    <script src="Plugins/FancyBox/jquery.fancybox.min.js"></script>
    <script src="Plugins/OwlCarousel2/owl.carousel.min.js"></script>
    <script src="Plugins/aos/aos.js"></script>
    <script src="Plugins/mask/jquery.mask.min.js"></script>
</asp:Content>

