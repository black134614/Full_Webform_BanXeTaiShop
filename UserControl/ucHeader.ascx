<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucHeader.ascx.cs" Inherits="UserControl_ucMainMenu" %>
<header>
    <nav class="navbar navbar-expand-xl main-navbar py-3">
        <a class="navbar-brand" href="../Default.aspx">
            <img class="img-fluid" src="fileUploads/system/brand.png" />
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
            <span class="fa fa-toggle-off text-danger"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav main-menu text-center mr-auto">
                <li class="nav-item active">
                    <a class="nav-link d-none d-xl-block" href="../Default.aspx">
                        <span class="fa fa-home"></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="GioiThieu.aspx">Giới thiệu
                    </a>
                </li>
                <asp:Repeater ID="Repeater_ProductCategory" runat="server">
                    <ItemTemplate>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id='<%# Eval("ID","Product{0}") %>'  data-toggle="dropdown">
                                <%# Eval("Title") %>
                            </a>
                            <div class="dropdown-menu dropdown-primary">
                                <span class="dropdown-menu-arrow"></span>
                                <asp:Repeater DataSource='<%# Eval("sub") %>' runat="server">
                                    <ItemTemplate><a class="dropdown-item" href='<%# Eval("ID","../List.aspx?cID={0}") %>'><%# Eval("Title") %></a></ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="Repeater_NewsCategory" runat="server">
                    <ItemTemplate>
                        <li class="nav-item dropdown">
                           <a class="nav-link dropdown-toggle" href="#" id='<%# Eval("ID","News{0}") %>'  data-toggle="dropdown">
                                <%# Eval("Title") %>
                            </a>
                            <div class="dropdown-menu dropdown-primary">
                                <span class="dropdown-menu-arrow"></span>
                                <asp:Repeater DataSource='<%# Eval("sub") %>' runat="server">
                                    <ItemTemplate><a class="dropdown-item" href='<%# Eval("ID","../NewsList.aspx?ncID={0}") %>'><%# Eval("Title") %></a></ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                <li class="nav-item">
                    <a data-fancybox data-animation-duration="700" data-src="#contactModal" href="javascript:;" class="nav-link">Liên hệ
                    </a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0 justify-content-center">
                <input class="form-control mr-sm-2 d-none" type="search" placeholder="Search">
                <button class="btn btn-primary my-2 my-sm-0" type="button"
                    data-fancybox data-animation-duration="700" data-src="#searchBox" href="javascript:;">
                    <span class="fa fa-search"></span>
                </button>
            </form>
        </div>
    </nav>
</header>
