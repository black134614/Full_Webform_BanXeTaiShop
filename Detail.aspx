<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Default2" %>

<%@ Register Src="~/UserControl/ucMainCarousel.ascx" TagPrefix="uc1" TagName="ucMainCarousel" %>
<%@ Register Src="~/UserControl/ucProductRelative.ascx" TagPrefix="uc1" TagName="ucProductRelative" %>
<%@ Register Src="~/UserControl/ucMainCategory.ascx" TagPrefix="uc1" TagName="ucMainCategory" %>
<%@ Register Src="~/UserControl/ucCustomerContact.ascx" TagPrefix="uc1" TagName="ucCustomerContact" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Chi tiet - ten san pham</title>
    <meta name="description" content="Day la mo ta seo web site " />
    <meta name="keywords" content="Bo title vao" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="Server">
    <uc1:ucMainCategory runat="server" ID="ucMainCategory" />
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../Default.aspx">Trang Chủ</a></li>
            <asp:Repeater ID="Repeater_breadcrumb" runat="server">
                <ItemTemplate>
                    <li class="breadcrumb-item"><a href='<%# Eval("cID","../List.aspx?cID={0}") %>'><%# Eval("Title") %></a></li>
                    <asp:Repeater DataSource='<%# Eval("Product") %>' runat="server">
                        <ItemTemplate>
                            <li class="breadcrumb-item active"><%# Eval("Title") %></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
            </asp:Repeater>
        </ol>
    </nav>
    <section class="container-fluid my-3">
        <asp:Repeater ID="Repeater_Main" runat="server">
            <ItemTemplate>
                <div class="item-info row">
                    <div class="col-12 col col-md-6 col-xl-4 text-center" data-aos="fade-left">
                        <img class="img-fluid" src='<%# Eval("Avatar") %>' alt='<%# Eval("Description") %>' />
                        <div class="d-none d-md-block">
                            <div class="mt-2 text-muted">
                                <span>Từ Khóa gợi ý:</span>
                                <asp:Repeater DataSource='<%# Eval("ProductRelative") %>' runat="server">
                                    <ItemTemplate>
                                        <%# Eval("Keywords") %>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="mt-2 text-muted">
                                <span>Bài viết liên quan:</span>
                                <asp:Repeater DataSource='<%# Eval("Relative") %>' runat="server">
                                    <ItemTemplate>
                                        <asp:Repeater DataSource='<%# Eval("News") %>' runat="server">
                                            <ItemTemplate>
                                                <a href='<%# String.Format("NewsDetail.aspx?ncID={0}&nID{1}",Eval("ncID"),Eval("nID")) %>'>
                                                    <%# Eval("Title") %>
                                                </a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col col-md-6 col-xl-4 item-content" data-aos="fade-in">
                        <h5 class="item-title text-uppercase"><%# Eval("Title") %></h5>
                        <p class="item-description font-weight-bold">
                            <%# Eval("Description") %>
                        </p>
                        <p class="price">
                            <span class="fa fa-money"></span>
                            <span class='<%# (int)Eval("salePrice") == 0 ? "money line-through d-none" : "money line-through" %>'>
                                <%# (int)Eval("salePrice") == 0 ? 0 : Eval("OriginalPrice") %>
                            </span>
                            <span class="money" style="font-size: 30px"><%# (int)Eval("salePrice") == 0 ? Eval("OriginalPrice") :  Eval("SalePrice")%></span>
                        </p>
                        <p class="prev-price">
                            Trả trước:
                        <span class="money" style="font-size: 25px"><%# Eval("Prepay") %></span>
                        </p>
                        <div class="item-tool">
                            <div class="d-inline-block light-box-item">
                                <a href="javascript:;" class="btn btn-warning" id="customerContact">Đặt Trước
                                </a>
                            </div>

                            <div class="d-inline-block light-box-item">
                                <a data-morphing data-src="#morphing-content1" href="javascript:;" class="btn btn-info">Dự Toán Trả Góp<span class="hot-icon fa fa-star fa-spin"></span>
                                </a>
                                <div style="display: none" id="morphing-content1" class="hidden rounded full-modal-morphing">
                                    <div class="row">
                                        <asp:Repeater DataSource='<%# Eval("ProductCost") %>' runat="server">
                                            <ItemTemplate>
                                                <div class="col-12 col-sm-6 left-column">
                                                    <h5 class="text-uppercase">CHI PHÍ LĂN BÁNH</h5>
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Giá xe (bao gồm VAT)
                                                            </span>
                                                        </div>
                                                        <input type="text" class="form-control" id="inputPrice" value='<%# Eval("VAT") %>' readonly>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Phí trước bạ (2%)
                                                            </span>
                                                        </div>
                                                        <input type="text" class="form-control" value='<%# Eval("PhiTruocBa") %>' readonly>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Phí đăng ký
                                                            </span>
                                                        </div>
                                                        <input type="text" class="form-control money" value='<%# Eval("PhiDangKi") %>' readonly>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Phí kiểm định
                                                            </span>
                                                        </div>
                                                        <input type="text" class="form-control money" value='<%# Eval("PhiKiemDinh") %>' readonly>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Phí sử dụng đường bộ
                                                            </span>
                                                        </div>
                                                        <input type="text" class="form-control money" value='<%# Eval("PhiSuDungDuongBo") %>' readonly>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Bảo hiểm TNDS
                                                            </span>
                                                        </div>
                                                        <input type="text" class="form-control money" value='<%# Eval("BaoHiemTNDS") %>' readonly>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Bộ định vị
                                                            </span>
                                                        </div>
                                                        <input type="text" class="form-control money" value='<%# Eval("Locator") %>' readonly>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Tổng chi phí
                                                            </span>
                                                        </div>
                                                        <input type="text" class="form-control money" value='<%# Eval("TotalForRun") %>' readonly>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <div class="col-12 col-sm-6 right-column">
                                            <h5 class="text-uppercase text-right">DỰ TOÁN VAY VỐN</h5>
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control money" value="699,000,000" readonly>
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">Giá xe (bao gồm VAT)</span>
                                                </div>
                                            </div>
                                            <div class="input-group mb-3">
                                                <select class="custom-select" id="inputGroupSelect02">
                                                    <option value="80" selected>80%</option>
                                                    <option value="75">75%</option>
                                                    <option value="70">70%</option>
                                                    <option value="65">65%</option>
                                                    <option value="60">60%</option>
                                                </select>
                                                <div class="input-group-append">
                                                    <label class="input-group-text" for="inputGroupSelect02">Số tiền vay</label>
                                                </div>
                                            </div>
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control money" value="559,200,000" readonly>
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">Tương đương</span>
                                                </div>
                                            </div>
                                            <div class="input-group mb-3">
                                                <select class="custom-select" id="inputGroupSelect02">
                                                    <option value="5" selected>5 năm</option>
                                                    <option value="6">6 năm</option>
                                                    <option value="7">7 năm</option>
                                                    <option value="8">8 năm</option>
                                                    <option value="9">9 năm</option>
                                                </select>
                                                <div class="input-group-append">
                                                    <label class="input-group-text" for="inputGroupSelect02">Thời gian</label>
                                                </div>
                                            </div>
                                            <div class="input-group mb-3">
                                                <select class="custom-select" id="inputGroupSelect02">
                                                    <option value="7.9" selected>7.9% / năm</option>
                                                </select>
                                                <div class="input-group-append">
                                                    <label class="input-group-text" for="inputGroupSelect02">Lãi suất</label>
                                                </div>
                                            </div>
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control money" value="9,320,000" readonly>
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">Tiền gốc hàng tháng</span>
                                                </div>
                                            </div>
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control money" value="1,840,700" readonly>
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">Tiền lãi trung bình hàng tháng</span>
                                                </div>
                                            </div>
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control money" value="11,160,700" readonly>
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">Phải trả trung bình hàng tháng</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="total-money">
                                        <label>Tổng chi phí trả trước</label>
                                        <div class="money total" style="font-size: 30px; text-decoration: underline">156,930,000</div>
                                        <label>(đã bao gồm phí lăn bánh)</label>
                                        <br />
                                        <i class="text-danger">Lưu ý: chi phí lăn bánh trên là cơ bản, có thể thay đổi tùy theo loại xe và tỉnh thành đăng ký biển số</i>
                                    </div>
                                </div>
                            </div>
                            <div class="d-inline-block light-box-item">
                                <a data-morphing data-src="#morphing-content2" href="javascript:;" class="btn btn-danger">Thông tin xe
                                </a>
                                <asp:Repeater DataSource='<%# Eval("ProductDetai") %>' runat="server">
                                    <ItemTemplate>
                                        <div style="display: none" id="morphing-content2" class="hidden rounded detail">
                                            <%# Eval("Detail") %>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="d-inline-block light-box-item">
                                <a data-morphing data-src="#morphing-content3" href="javascript:;" class="btn btn-success">Thông số kĩ thuật
                                </a>
                                <asp:Repeater DataSource='<%# Eval("ProductTech") %>' runat="server">
                                    <ItemTemplate>
                                        <div style="display: none" id="morphing-content3" class="hidden detail rounded">
                                            <%# Eval("Detail") %>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button_count" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>
                        </div>
                    </div>
                    <div class="col-12 col-xl-4" data-aos="fade-right">
                        <div id="facebook-comment">
                            <div class="comment">
                                <div class="fb-comments w-100" data-href="https://capnhatcoc.blogspot.com/2020/07/ban-co-biet-giai-au-quoc-te-clash-of.html"
                                    data-numposts="3" data-width="100%">
                                </div>
                            </div>
                            get 
                            <span class="fb-comments-count" data-href="https://capnhatcoc.blogspot.com/2020/07/ban-co-biet-giai-au-quoc-te-clash-of.html"></span>
                            comment to database
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </section>
    <uc1:ucCustomerContact runat="server" ID="ucCustomerContact" />
    <uc1:ucProductRelative runat="server" ID="ucProductRelative" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script_holder" runat="Server">
    <script src="Plugins/FancyBox/jquery.fancybox.min.js"></script>
    <script src="Plugins/modalOverlay/Overlay.js"></script>
    <script src="Plugins/OwlCarousel2/owl.carousel.min.js"></script>
    <script src="Plugins/aos/aos.js"></script>
    <script src="Plugins/mask/jquery.mask.min.js"></script>
</asp:Content>

