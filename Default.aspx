<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/UserControl/ucMainCarousel.ascx" TagPrefix="uc1" TagName="ucMainCarousel" %>
<%@ Register Src="~/UserControl/ucMainCategory.ascx" TagPrefix="uc1" TagName="ucMainCategory" %>
<%@ Register Src="~/UserControl/ucSupport.ascx" TagPrefix="uc1" TagName="ucSupport" %>
<%@ Register Src="~/UserControl/ucTopProduct.ascx" TagPrefix="uc1" TagName="ucTopProduct" %>
<%@ Register Src="~/UserControl/ucQuote.ascx" TagPrefix="uc1" TagName="ucQuote" %>
<%@ Register Src="~/UserControl/ucTopNews.ascx" TagPrefix="uc1" TagName="ucTopNews" %>







<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <title>Trang chủ - ten web site</title>
        <meta name="description" content="Day la mo ta seo web site " />
        <meta name="keywords" content="Bo title vao" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="Server">
    <uc1:ucMainCarousel runat="server" ID="ucMainCarousel" />
    <uc1:ucMainCategory runat="server" ID="ucMainCategory" />
    <uc1:ucSupport runat="server" ID="ucSupport" />
    <uc1:ucTopProduct runat="server" ID="ucTopProduct" />
    <uc1:ucQuote runat="server" ID="ucQuote" />
    <uc1:ucTopNews runat="server" ID="ucTopNews" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script_holder" runat="Server">
    <script src="Plugins/FancyBox/jquery.fancybox.min.js"></script>
    <script src="Plugins/OwlCarousel2/owl.carousel.min.js"></script>
    <script src="Plugins/aos/aos.js"></script>
    <script src="Plugins/mask/jquery.mask.min.js"></script>
</asp:Content>

