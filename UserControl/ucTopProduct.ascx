<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucTopProduct.ascx.cs" Inherits="UserControl_ucTopProduct" %>
<section class="container-fluid my-3" data-aos="fade-up" data-aos-duration="1000">
    <asp:Repeater ID="Repeater_Main" runat="server">
        <ItemTemplate>
            <div>
                <h4 class="text-center"><%# Eval("Title") %> Mới Nhất! <span class="fa fa-star fa-spin hot-icon"></span></h4>
            </div>
            <asp:Repeater DataSource='<%# Eval("Category") %>' runat="server">
                <ItemTemplate>
                    <div class="product row">
                        <asp:Repeater DataSource='<%# Eval("product") %>' runat="server">
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
                </ItemTemplate>
            </asp:Repeater>
        </ItemTemplate>
    </asp:Repeater>
    <a href="../List.aspx">
        <h5 class="text-right">xem thêm</h5>
    </a>
</section>
