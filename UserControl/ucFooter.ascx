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
                <div class="col-12 col-sm-6 col-lg-4 row">
                    <h4 class="col-12">Hoạt động của chúng tôi</h4>
                    <div class="col-12 text-center">
                        <a href="https://thietkeshowroomhanoi.com/wp-content/uploads/2017/07/Thiet-ke-showroom-xe-may-3.jpg"
                            data-fancybox="images-preview"
                            data-width="1500" data-height="1000"
                            data-thumbs='{"autoStart":true}'>
                            <img class="rounded" style="max-width: 350px; max-height: 200px" src="https://thietkeshowroomhanoi.com/wp-content/uploads/2017/07/Thiet-ke-showroom-xe-may-3.jpg" />
                        </a>
                        <div style="display: none;">
                            <a href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpGmPJM7PSHdod0gUfHtXOW0IitZZ764Nwbw&usqp=CAU" data-fancybox="images-preview"
                                data-width="1500" data-height="1000"
                                data-thumb="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpGmPJM7PSHdod0gUfHtXOW0IitZZ764Nwbw&usqp=CAU"></a>

                            <a href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxqqlYUiIRBS_9c9h-Q6RaHPDWozTCEddfUA&usqp=CAU" data-fancybox="images-preview"
                                data-width="1500" data-height="1000"
                                data-thumb="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxqqlYUiIRBS_9c9h-Q6RaHPDWozTCEddfUA&usqp=CAU"></a>

                            <a href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTQshBOxqFvzKsvFpBnrwpmtox3Px-Lmd-JA&usqp=CAU" data-fancybox="images-preview"
                                data-width="1500" data-height="1000"
                                data-thumb="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTQshBOxqFvzKsvFpBnrwpmtox3Px-Lmd-JA&usqp=CAU"></a>
                        </div>
                    </div>
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
