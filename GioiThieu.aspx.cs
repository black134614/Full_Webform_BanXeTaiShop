using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GioiThieu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }
    public void LoadData() {
        DBEntities db = new DBEntities();
        var query = from d in db.Websites
                    where d.Status == true
                    select new
                    {
                        d.WebsiteDetail
                    };
        Repeater_Main.DataSource = query.ToList().Take(1);
        Repeater_Main.DataBind();
    }
}