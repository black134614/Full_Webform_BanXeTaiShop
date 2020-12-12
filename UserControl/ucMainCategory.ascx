<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucMainCategory.ascx.cs" Inherits="UserControl_ucMainCategory" %>
<section class="container-fluid px-5 bg-warning" data-aos="fade-up" data-aos-offset="0" data-aos-duration="1000">
    <asp:Repeater ID="Repeater_Main" runat="server">
        <ItemTemplate>
            <div>
                <h5 class="pt-3 text-center">Danh Mục <%# Eval("Title") %></h5>
            </div>

            <div id="main-category" class="owl-carousel owl-theme">
                <asp:Repeater DataSource='<%# Eval("Category") %>' runat="server">
                    <ItemTemplate>
                        <a href='<%# Eval("cID","../List.aspx?cID={0}") %>' class="item">
                            <img src='<%# Eval("Avatar") %>' alt='<%# Eval("Description") %>' />
                            <h6 class="item-title text-center"><%# Eval("Title") %></h6>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</section>

