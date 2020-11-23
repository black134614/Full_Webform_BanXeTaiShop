<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucFooter.ascx.cs" Inherits="UserControl_WebUserControl" %>
<footer data-aos="fade-up">
    <asp:Repeater ID="Repeater_Main" runat="server">
        <ItemTemplate>
            <div class="website-info row container-fluid m-0">
                <div class="col-12 col-sm-6 col-lg-4 d-none d-lg-block">
                    <h4><%# Eval("WebsiteName") %></h4>
                    <span class="fa fa-globe"><%# Eval("Description") %></span>
                    <br />
                    <span class="fa fa-map-marker"><%# Eval("Address")%></span>
                    <br />
                    <a href='<%# Eval("Hotline","callto:{0}") %>'><span class="fa fa-phone">HOTLINE PKD <strong class="phone-number"><%# Eval("Hotline") %></strong></span></a>
                    <br />
                    <a href='<%# Eval("Email","mailto:{0}?&subject=Big%20News&body=Body-goes-here") %>'><span class="fa fa-envelope"></span><%# Eval("Email") %></a>
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <h4>Bạn cần thêm thông tin<span class="animate__animated animate__heartBeat animate__infinite d-inline-block">?</span></h4>
                    <span class="">Để lại thông tin chúng tôi có thể giúp bạn!</span>
                    <div class="md-form input-with-post-icon">
                        <i class="fa fa-phone input-prefix text-danger"></i>
                        <input type="text" id="input_Contact" runat="server" class="form-control" Readonly>
                        <label for="input_Contact">Số điện thoại của bạn</label>
                    </div>
                    <button type="button" class="btn btn-primary btn-rounded">Gửi</button>
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <h4 class="follow">Theo dõi chúng tôi <span class="fa fa-hand-o-down"></span></h4>
                    <div class="fb-page mt-3" data-href='<%# Eval("Facebook") %>' data-tabs="" data-width="" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
                        <blockquote cite='<%# Eval("Facebook") %>' class="fb-xfbml-parse-ignore"><a href='<%# Eval("Facebook") %>'><%#Eval("WebsiteName") %></a></blockquote>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div style="height: 30px; width: 100%; background-color: #000">
    </div>
</footer>
