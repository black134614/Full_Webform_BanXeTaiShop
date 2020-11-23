<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucCustomerContact.ascx.cs" Inherits="UserControl_ucContactModal" %>
<div id="morphing-content" class="rounded">
    <div>
        <div class="form-row">
            <div class="col-12 text-info text-center mb-3" id="messageCustomer">
                tin nhắn
            </div>
            <div class="col-12">
                <button class="btn btn-warning float-right" id="closeCustomerContact">X</button>
            </div>
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
                <input type="text" maxlength="10" class="form-control CustomerPhoneNumber phone-number" id="inputCustomerPhoneNumber" runat="server">
            </div>
        </div>
        <div class="form-group">
            <label for="inputAddress2">Ghi chú thêm</label>
            <asp:TextBox class="form-control CustomerNote" TextMode="multiline" Rows="5" placeholder="Lời nhắn của bạn!" ID="textareaCustomerNote" runat="server" />
        </div>
        <asp:LinkButton class="btn btn-primary bntSendCustomerContact" ID="btnSend" OnClick="btnSend_Click" runat="server">Gửi</asp:LinkButton>
    </div>
</div>

