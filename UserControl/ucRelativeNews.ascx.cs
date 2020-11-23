using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_ucRelativeNews : System.Web.UI.UserControl
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
        int ncID = 0;
        int nID = 0;
        int.TryParse(Request.QueryString["ncID"], out ncID);
        int.TryParse(Request.QueryString["nID"], out nID);
        //2 truong hop sai ID, Dung ID
        if (nID == 0)
        {
            Response.Redirect("404.html");
        }
        else
        {
            DBEntities db = new DBEntities();
            var query = from d in db.NewsCategories
                        where d.NewsCategoryID == ncID && d.Status == true && d.IsDelete == false
                        select new
                        {
                            d.Title,
                            News = (from s in db.News
                                    where s.NewsCategoryID == d.NewsCategoryID && s.Status == true && s.IsDelete == false && s.NewsID != nID
                                    select new { 
                                        ncID = s.NewsCategoryID,
                                        nID = s.NewsID,
                                        s.Title,
                                        s.Avatar,
                                        s.Description
                                    })
                        };
            if (query.Count() == 0)
            {
                Response.Redirect("404.html");
            }
            else
            {
                Repeater_Main.DataSource = query.ToList().Take(12);
                Repeater_Main.DataBind();
            }
        }
    }
 }