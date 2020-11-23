<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucRelativeNews.ascx.cs" Inherits="UserControl_ucRelativeNews" %>
<asp:Repeater ID="Repeater_Main" runat="server">
    <ItemTemplate>
        <section>
            <div>
                <h3 class="text-center text-uppercase">Bài Viết <%# Eval("Title") %> Liên quan</h3>
            </div>
            <div class="news row">
                <asp:Repeater DataSource='<%# Eval("News") %>' runat="server">
                    <ItemTemplate>
                        <div class="item col-12 col-sm-6 col-lg-4 col-xl-3">
                            <a href='<%# String.Format("NewsDetail.aspx?ncID={0}&n=ID{1}",Eval("ncID"),Eval("nID")) %>'>
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
