using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            toolFilter.Visible = false;
            supportBreadcrumb.Visible = false;
            LoadData();
            LoadBreadrumb();
        }
    }
    public void LoadData()
    {
        //co 2 truong hop: 
        //1: khong cID thi se xem tat ca danh muc lien quan den san pham chinh
        //2: co cID xe cho ra tùy chọn lọc
        int cID = 0;
        int.TryParse(Request.QueryString["cID"], out cID);
        int filter = 0;
        int.TryParse(filterOption.SelectedValue, out filter);
        DBEntities db = new DBEntities();
        // 1
        if (cID == 0)
        {
            var queryAll = from d in db.Categories
                           where d.Status == true && d.IsDelete == false
                           select new
                           {
                               d.Title,
                               Product = (from s in db.Products
                                          where s.Status == true && s.IsDelete == false && s.CategoryID == d.CategoryID
                                          orderby s.CreateTime descending
                                          select new
                                          {
                                              cID = s.CategoryID,
                                              ID = s.ProductID,
                                              s.Title,
                                              s.Description,
                                              s.Avatar,
                                              s.OriginalPrice,
                                              s.SalePrice,
                                              s.Prepay,
                                              firstImage = (from ss in db.ProductPreviews
                                                            where ss.ProductID == s.ProductID
                                                            orderby ss.ProductPreviewID
                                                            select new
                                                            {
                                                                ID = ss.ProductID,
                                                                ss.Title,
                                                                ss.Link,
                                                                ss.Description,
                                                            }).Take(1),
                                              listImages = (from ss in db.ProductPreviews
                                                            where ss.ProductID == s.ProductID
                                                            orderby ss.ProductPreviewID
                                                            select new
                                                            {
                                                                ID = ss.ProductID,
                                                                ss.Title,
                                                                ss.Link,
                                                                ss.Description,
                                                            }).Skip(1)
                                          }).Take(12)
                           };
            Repeater_Main.DataSource = queryAll.ToList();
            Repeater_Main.DataBind();
        }
        //2
        else
        {
            if (filter == 0 && inputViewAll.Checked == true)
            {
                toolFilter.Visible = true;
                var queryDefault = from d in db.Categories
                                   where d.CategoryID == cID && d.Status == true && d.IsDelete == false
                                   select new
                                   {
                                       d.Title,
                                       Product = (from s in db.Products
                                                  where s.CategoryID == d.CategoryID && s.Status == true && s.IsDelete == false
                                                  orderby s.CreateTime descending
                                                  select new
                                                  {
                                                      cID = s.CategoryID,
                                                      ID = s.ProductID,
                                                      s.Title,
                                                      s.Description,
                                                      s.Avatar,
                                                      s.OriginalPrice,
                                                      s.SalePrice,
                                                      s.Prepay,
                                                      firstImage = (from ss in db.ProductPreviews
                                                                    where ss.ProductID == s.ProductID
                                                                    orderby ss.ProductPreviewID
                                                                    select new
                                                                    {
                                                                        ID = ss.ProductID,
                                                                        ss.Title,
                                                                        ss.Link,
                                                                        ss.Description,
                                                                    }).Take(1),
                                                      listImages = (from ss in db.ProductPreviews
                                                                    where ss.ProductID == s.ProductID
                                                                    orderby ss.ProductPreviewID
                                                                    select new
                                                                    {
                                                                        ID = ss.ProductID,
                                                                        ss.Title,
                                                                        ss.Link,
                                                                        ss.Description,
                                                                    }).Skip(1)
                                                  })
                                   };
                Repeater_Main.DataSource = queryDefault.ToList();
                Repeater_Main.DataBind();
                filterOption.SelectedValue = "0";
                inputSale.Checked = false;
                inputChoice.Checked = false;
                inputViewAll.Checked = true;
            }
            if (filter == 0 && inputSale.Checked == true)
            {
                toolFilter.Visible = true;
                var querySaleDes = from d in db.Categories
                                   where d.CategoryID == cID && d.Status == true && d.IsDelete == false
                                   select new
                                   {
                                       d.Title,
                                       Product = (from s in db.Products
                                                  where s.CategoryID == d.CategoryID && s.Status == true && s.IsDelete == false && s.SalePrice > 0
                                                  orderby s.CreateTime descending
                                                  select new
                                                  {
                                                      cID = s.CategoryID,
                                                      ID = s.ProductID,
                                                      s.Title,
                                                      s.Description,
                                                      s.Avatar,
                                                      s.OriginalPrice,
                                                      s.SalePrice,
                                                      s.Prepay,
                                                      firstImage = (from ss in db.ProductPreviews
                                                                    where ss.ProductID == s.ProductID
                                                                    orderby ss.ProductPreviewID
                                                                    select new
                                                                    {
                                                                        ID = ss.ProductID,
                                                                        ss.Title,
                                                                        ss.Link,
                                                                        ss.Description,
                                                                    }).Take(1),
                                                      listImages = (from ss in db.ProductPreviews
                                                                    where ss.ProductID == s.ProductID
                                                                    orderby ss.ProductPreviewID
                                                                    select new
                                                                    {
                                                                        ID = ss.ProductID,
                                                                        ss.Title,
                                                                        ss.Link,
                                                                        ss.Description,
                                                                    }).Skip(1)
                                                  })
                                   };
                Repeater_Main.DataSource = querySaleDes.ToList();
                Repeater_Main.DataBind();
                filterOption.SelectedValue = "0";
                inputSale.Checked = true;
                inputChoice.Checked = false;
                inputViewAll.Checked = false;
            }
            if (filter == 0 && inputChoice.Checked == true)
            {
                toolFilter.Visible = true;
                var queryChoiceDes = from d in db.Categories
                                     where d.CategoryID == cID && d.Status == true && d.IsDelete == false
                                     select new
                                     {
                                         d.Title,
                                         Product = (from s in db.Products
                                                    where s.CategoryID == d.CategoryID && s.Status == true && s.IsDelete == false && s.Choice == true
                                                    orderby s.CreateTime descending
                                                    select new
                                                    {
                                                        cID = s.CategoryID,
                                                        ID = s.ProductID,
                                                        s.Title,
                                                        s.Description,
                                                        s.Avatar,
                                                        s.OriginalPrice,
                                                        s.SalePrice,
                                                        s.Prepay,
                                                        firstImage = (from ss in db.ProductPreviews
                                                                      where ss.ProductID == s.ProductID
                                                                      orderby ss.ProductPreviewID
                                                                      select new
                                                                      {
                                                                          ID = ss.ProductID,
                                                                          ss.Title,
                                                                          ss.Link,
                                                                          ss.Description,
                                                                      }).Take(1),
                                                        listImages = (from ss in db.ProductPreviews
                                                                      where ss.ProductID == s.ProductID
                                                                      orderby ss.ProductPreviewID
                                                                      select new
                                                                      {
                                                                          ID = ss.ProductID,
                                                                          ss.Title,
                                                                          ss.Link,
                                                                          ss.Description,
                                                                      }).Skip(1)
                                                    })
                                     };
                Repeater_Main.DataSource = queryChoiceDes.ToList();
                Repeater_Main.DataBind();
                filterOption.SelectedValue = "0";
                inputSale.Checked = false;
                inputChoice.Checked = true;
                inputViewAll.Checked = false;
            }
            if (filter == 1 && inputSale.Checked == true)
            {
                toolFilter.Visible = true;
                var querySaleAsc = from d in db.Categories
                                   where d.CategoryID == cID && d.Status == true && d.IsDelete == false
                                   select new
                                   {
                                       d.Title,
                                       Product = (from s in db.Products
                                                  where s.CategoryID == d.CategoryID && s.Status == true && s.IsDelete == false && s.SalePrice > 0
                                                  orderby s.CreateTime ascending
                                                  select new
                                                  {
                                                      cID = s.CategoryID,
                                                      ID = s.ProductID,
                                                      s.Title,
                                                      s.Description,
                                                      s.Avatar,
                                                      s.OriginalPrice,
                                                      s.SalePrice,
                                                      s.Prepay,
                                                      firstImage = (from ss in db.ProductPreviews
                                                                    where ss.ProductID == s.ProductID
                                                                    orderby ss.ProductPreviewID
                                                                    select new
                                                                    {
                                                                        ID = ss.ProductID,
                                                                        ss.Title,
                                                                        ss.Link,
                                                                        ss.Description,
                                                                    }).Take(1),
                                                      listImages = (from ss in db.ProductPreviews
                                                                    where ss.ProductID == s.ProductID
                                                                    orderby ss.ProductPreviewID
                                                                    select new
                                                                    {
                                                                        ID = ss.ProductID,
                                                                        ss.Title,
                                                                        ss.Link,
                                                                        ss.Description,
                                                                    }).Skip(1)
                                                  })
                                   };
                Repeater_Main.DataSource = querySaleAsc.ToList();
                Repeater_Main.DataBind();
                filterOption.SelectedValue = "1";
                inputSale.Checked = true;
                inputChoice.Checked = false;
                inputViewAll.Checked = false;
            }
            if (filter == 1 && inputChoice.Checked == true)
            {
                toolFilter.Visible = true;
                var queryChoiceAsc = from d in db.Categories
                                     where d.CategoryID == cID && d.Status == true && d.IsDelete == false
                                     select new
                                     {
                                         d.Title,
                                         Product = (from s in db.Products
                                                    where s.CategoryID == d.CategoryID && s.Status == true && s.IsDelete == false && s.Choice == true
                                                    orderby s.CreateTime ascending
                                                    select new
                                                    {
                                                        cID = s.CategoryID,
                                                        ID = s.ProductID,
                                                        s.Title,
                                                        s.Description,
                                                        s.Avatar,
                                                        s.OriginalPrice,
                                                        s.SalePrice,
                                                        s.Prepay,
                                                        firstImage = (from ss in db.ProductPreviews
                                                                      where ss.ProductID == s.ProductID
                                                                      orderby ss.ProductPreviewID
                                                                      select new
                                                                      {
                                                                          ID = ss.ProductID,
                                                                          ss.Title,
                                                                          ss.Link,
                                                                          ss.Description,
                                                                      }).Take(1),
                                                        listImages = (from ss in db.ProductPreviews
                                                                      where ss.ProductID == s.ProductID
                                                                      orderby ss.ProductPreviewID
                                                                      select new
                                                                      {
                                                                          ID = ss.ProductID,
                                                                          ss.Title,
                                                                          ss.Link,
                                                                          ss.Description,
                                                                      }).Skip(1)
                                                    })
                                     };
                Repeater_Main.DataSource = queryChoiceAsc.ToList();
                Repeater_Main.DataBind();
                filterOption.SelectedValue = "1";
                inputSale.Checked = false;
                inputChoice.Checked = true;
                inputViewAll.Checked = false;
            }
        }
    }

    public void LoadBreadrumb()
    {
        int cID = 0;
        int.TryParse(Request.QueryString["cID"], out cID);
        DBEntities db = new DBEntities();
        var query = from d in db.Categories
                    where d.CategoryID == cID && d.Status == true && d.IsDelete == false
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

    protected void buttonSearch_Click(object sender, EventArgs e)
    {
        LoadData();
    }
}