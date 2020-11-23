using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
    }
    public void LoadData()
    {
        DBEntities db = new DBEntities();
        var query = from d in db.Websites
                    where d.Status == true
                    select d;
        Repeater_Main.DataSource = query.ToList();
        Repeater_Main.DataBind();
    }
}