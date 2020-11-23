using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            supportBreadcrumb.Visible = false;
            LoadData();
            LoadBreadrumb();
        }
    }
    public void LoadData()
    {
        int ncID = 0;
        int.TryParse(Request.QueryString["ncID"], out ncID);
        DBEntities db = new DBEntities();
        if (ncID == 0)
        {
            var queryAll = from d in db.NewsCategories
                           where d.Status == true && d.IsDelete == false
                           orderby d.NewsCategoryID
                           select new
                           {
                               d.Title,
                               News = (from s in db.News
                                       where s.NewsCategoryID == d.NewsCategoryID && s.Status == true && s.IsDelete == false
                                       orderby s.CreateTime
                                       select new
                                       {
                                           ncID = s.NewsCategoryID,
                                           nID = s.NewsID,
                                           s.Title,
                                           s.Description,
                                           s.Avatar
                                       }).Take(12)
                           };
            Repeater_Main.DataSource = queryAll.ToList();
            Repeater_Main.DataBind();
        }
        else
        {
            var query = from d in db.NewsCategories
                        where d.Status == true && d.IsDelete == false && d.NewsCategoryID == ncID
                        orderby d.NewsCategoryID
                        select new
                        {
                            d.Title,
                            News = (from s in db.News
                                    where s.NewsCategoryID == d.NewsCategoryID && s.Status == true && s.IsDelete == false
                                    orderby s.CreateTime
                                    select new
                                    {
                                        ncID = s.NewsCategoryID,
                                        nID = s.NewsID,
                                        s.Title,
                                        s.Description,
                                        s.Avatar
                                    })
                        };
            if (query.Count() == 0)
            {
                Response.Redirect("404.html");
            }
            Repeater_Main.DataSource = query.ToList();
            Repeater_Main.DataBind();
        }
    }
    public void LoadBreadrumb()
    {
        int ncID = 0;
        int.TryParse(Request.QueryString["ncID"], out ncID);
        DBEntities db = new DBEntities();
        var query = from d in db.NewsCategories
                    where d.NewsCategoryID == ncID
                    select new
                    {
                        d.Title
                    };
        if (query.Count() == 0)
        {
            supportBreadcrumb.Visible = true;
        }
        Repeater_breadcrumb.DataSource = query.ToList();
        Repeater_breadcrumb.DataBind();
    }
}