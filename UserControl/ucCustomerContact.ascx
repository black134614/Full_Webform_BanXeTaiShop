<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucCustomerContact.ascx.cs" Inherits="UserControl_ucContactModal" %>
<div id="customerContact" class="rounded modal fade" data-backdrop="static" data-keyboard="true" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông tin của bạn</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-row">
                    <div class="col-12 text-info text-center mb-3" id="messageCustomer">
                        tin nhắn
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputEmail4">Tên của bạn</label>
                        <input type="text" class="form-control CustomerName" id="inputCustomerName" placeholder="*" runat="server">
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
                        <input type="text" maxlength="10" placeholder="*" class="form-control CustomerPhoneNumber phone-number" id="inputCustomerPhoneNumber" runat="server">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputAddress2">Ghi chú thêm</label>
                    <asp:TextBox class="form-control CustomerNote" TextMode="multiline" Rows="5" placeholder="Lời nhắn của bạn!" ID="textareaCustomerNote" runat="server" />
                </div>
            </div>
            <div class="modal-footer">
                <asp:LinkButton class="btn btn-primary bntSendCustomerContact" ID="btnSend" OnClick="btnSend_Click" runat="server">Gửi</asp:LinkButton>
            </div>
        </div>
    </div>
</div>

