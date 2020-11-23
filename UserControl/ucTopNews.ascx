<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucTopNews.ascx.cs" Inherits="UserControl_ucTopNews" %>
<section class="container-fluid my-3" data-aos="fade-up" data-aos-duration="1000">
    <div>
        <h4 class="text-center">Tin Tổng Hợp Mới Nhất!</h4>
    </div>
    <div class="news row">
        <asp:Repeater ID="Repeater_Main" runat="server">
            <ItemTemplate>
                <div class="item col-12 col-sm-6 col-lg-4 col-xl-3" data-aos="flip-up">
                    <a href='<%# String.Format("NewsDetail.aspx?ncID={0}&nID={1}",Eval("cID"),Eval("ID")) %>'>
                        <img class="img-fluid rounded animate-img" src='<%# Eval("Avatar") %>'
                            alt='<%# Eval("Description") %>'
                            data-toggle="tooltip" title='<%# Eval("Title") %>' />
                        <h5 class="item-title"><%# Eval("Title") %></h5>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <a href="../NewsList.aspx">
        <h5 class="text-right">xem thêm</h5>
    </a>
</section>
