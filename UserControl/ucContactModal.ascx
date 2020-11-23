<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucContactModal.ascx.cs" Inherits="UserControl_ucContactModal" %>
<section style="display: none" id="contactModal">
    <asp:Repeater ID="Repeater_Main" runat="server">
        <ItemTemplate>
            <iframe src='<%# Eval("Map") %>' frameborder="0" style="border: 0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            <div class="contact-info py-3 px-5 rounded">
                <a href="#">
                    <h1><%# Eval("WebsiteName") %></h1>
                </a>
                <ul class="info">
                    <li><%# Eval("Address") %></li>
                    <li>Hotline <b class="d-inline-block phone-number"><%# Eval("Hotline") %></b></li>
                    <li><%# Eval("Email") %></li>
                </ul>
                <a class="view" href="GioiThieu.aspx">Xem chi tiết &gt;&gt;</a>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</section>
