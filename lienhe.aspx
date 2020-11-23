<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="lienhe.aspx.cs" Inherits="lienhe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>lien he</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" Runat="Server">
    <div>
            <div class="form-row">
                <div class="col-12 text-info text-center mb-3" id="messageCustomer">tin nhắn</div>
                <div class="form-group col-md-6">
                    <label for="inputEmail4">Tên của bạn</label>
                    <input type="text" class="form-control CustomerName" id="inputCustomerName" runat="server">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputPassword4">Địa chỉ</label>
                    <input type="text" placeholder="Không bắt buộc" class="form-control CustomerAddress" id="inputCustomerAddress" runat="server">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputEmail4">Email</label>
                    <input placeholder="Không bắt buộc" class="form-control CustomerEmail" id="inputCustomerEmail" runat="server">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputPassword4">Số điện thoại</label>
                    <input type="text" maxlength="10" class="form-control CustomerPhoneNumber"  id="inputCustomerPhoneNumber" runat="server">
                </div>
            </div>
            <div class="form-group">
                <label for="inputAddress2">Ghi chú thêm</label>
                <asp:TextBox  class="form-control CustomerNote" TextMode="multiline"  Rows="5" placeholder="Lời nhắn của bạn!" id="textareaCustomerNote" runat="server" />
            </div>
            <asp:LinkButton class="btn btn-primary bntSendCustomerContact" ID="btnSend" OnClick="btnSend_Click" runat="server"></asp:LinkButton>   
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script_holder" Runat="Server">
     <script src="Plugins/FancyBox/jquery.fancybox.min.js"></script>
    <script src="Plugins/modalOverlay/Overlay.js"></script>
    <script src="Plugins/OwlCarousel2/owl.carousel.min.js"></script>
    <script src="Plugins/aos/aos.js"></script>
    <script src="Plugins/mask/jquery.mask.min.js"></script>
</asp:Content>

