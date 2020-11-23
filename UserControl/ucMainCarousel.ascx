<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucMainCarousel.ascx.cs" Inherits="UserControl_ucMainCarousel" %>
<section id="main-carousel" class="owl-carousel owl-theme" data-aos="fade-right" data-aos-duration="1000">
    <asp:Repeater ID="Repeater_Main" runat="server">
        <ItemTemplate>
            <div class="item">
                <a href='<%# String.Format("Detail.aspx?cID={0}&ID={1}",Eval("cID"),Eval("ID")) %>'>
                    <div class="item-img">
                        <img class="img-fluid" src=<%# Eval("BackGround") %> />
                    </div>
                </a>
                <div class="item-content">
                    <a href='<%# String.Format("Detail.aspx?cID={0}&ID={1}",Eval("cID"),Eval("ID")) %>'>
                        <h5 class="item-title text-uppercase text-center mb-3">
                            <%# Eval("Title") %>
                        </h5>
                    </a>
                    <div class="item-description text-center">
                        <%# Eval("Description") %>
                    </div>
                    <div class="item-opption">
                        <a class="btn btn-info" href='<%# String.Format("Detail.aspx?cID={0}&ID={1}",Eval("cID"),Eval("ID")) %>'>Xem Thêm
                            <span class="fa fa-arrow-right"></span>
                        </a>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</section>
