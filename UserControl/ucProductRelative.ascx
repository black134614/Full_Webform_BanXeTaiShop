<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucProductRelative.ascx.cs" Inherits="UserControl_ucProductRelative" %>
<section>
    <asp:Repeater ID="Repeater_Main" runat="server">
        <ItemTemplate>
            <div>
                <h3 class="text-center text-uppercase">Liên quan đến <%# Eval("Title") %></h3>
            </div>
            <div class="product owl-carousel owl-theme owl-list">
                <asp:Repeater DataSource='<%# Eval("Product") %>' runat="server">
                    <ItemTemplate>
                        <div class='<%# (Container.ItemIndex + 1) % 2 == 0 ? "item bg-warning rounded text-center" : "item rounded text-center" %>'>
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
                                        Trả trước: <span class="money"><%# Eval("Prepay") %></span>
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
            <a href='<%# Eval("cID","../List.aspx?cID={0}") %>'>Xem thêm <%# Eval("Title") %></a>
        </ItemTemplate>
    </asp:Repeater>
</section>
