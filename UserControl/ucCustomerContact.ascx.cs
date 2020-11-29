using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_ucContactModal : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        inputCustomerEmail.Attributes["type"] = "email";
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {

        String customerName = inputCustomerName.Value.Trim();
        String customerAddress = inputCustomerAddress.Value.Trim();
        String customerEmail = inputCustomerEmail.Value.Trim();
        String customerPhoneNumber = inputCustomerPhoneNumber.Value.Trim().Replace("-", "");
        String customerNote = textareaCustomerNote.Text;

        using (var context = new DBEntities())
        {
            var customer = new Contact()
            {
                ContactPhoneNumber = customerPhoneNumber,
                FullName = customerName,
                Address = customerAddress,
                Status = false,
                Email = customerEmail,
                MoreDetail = customerNote,
                CreateTime = DateTime.Now
            };
            try
            {
                context.Contacts.Add(customer);
                context.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Đã gửi thành công! Chúng tôi sẽ liên lạc với bạn sớm nhất!')", true);
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Có lỗi')", true);
                return;
            }
        }
    }
}