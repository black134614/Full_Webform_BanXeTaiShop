using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_ucTopNews : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }
    public void LoadData()
    {
        DBEntities db = new DBEntities();
        var query = from d in db.News
                    where d.Status == true && d.IsDelete == false && d.Show == true
                    select new
                    {
                        cID = d.NewsCategoryID,
                        ID = d.NewsID,
                        d.Title,
                        d.Avatar,
                        d.Description
                    };
        Repeater_Main.DataSource = query.ToList().Take(12);
        Repeater_Main.DataBind();   
    }
}