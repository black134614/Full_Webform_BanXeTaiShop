using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_ucMainCarousel : System.Web.UI.UserControl
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
        var query = from d in db.Products
                    where d.Status == true && d.IsDelete == false && d.Choice == true
                    select new
                    {
                        CID = d.CategoryID,
                        ID = d.ProductID,
                        d.Title,
                        d.Description,
                        d.BackGround
                    };
        Repeater_Main.DataSource = query.ToList();
        Repeater_Main.DataBind();
    }
}