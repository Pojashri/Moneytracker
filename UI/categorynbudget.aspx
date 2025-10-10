<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="categorynbudget.aspx.cs" Inherits="Tracker.categorynbudget" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
         button.btncustom1 {background-color: #9c8de5;  color: white;border: none;
            border-radius: 30px; padding: 8px 25px;font-weight: 500; transition: 0.3s ease;}
         button.btncustom1:hover {  background-color: #847ad8; }
         body,
        .intro     {height: 100%;}
         table td,
         table th  { text-overflow: ellipsis;white-space: nowrap;overflow: hidden;}
         tbody td  {font-weight: 500;color: #999999;}
         .btncustom{background-color: #9c8de5;  color: white;border: none;
            border-radius: 30px; padding: 8px 25px;font-weight: 500; transition: 0.3s ease; }
    </style>
    <!-- ✅ Bootstrap CSS -->
    <link href="~/Content/style.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-4">
        <!-- ✅ Add Transaction Button -->
        <div class="mb-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <button type="button"  class="btn  btncustom1 px-4 py-2" data-bs-toggle="modal" data-bs-target="#addTransactionModal">
                    + Add Transaction
                </button>
                <button type="button" class="btn btncustom1  px-4 py-2" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                    + Add Category
                </button>
            </div>
        </div>
        <!-- ✅ Transactions Table -->
        <section class="intro">
  <div class="gradient-custom-1 h-100">
    <div class="mask d-flex align-items-center h-100">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12">
            <div class="table-responsive bg-white">
              <table class="table mb-0">
                <thead>
                  <tr>
                    <th scope="col">DESCRIPTION</th>
                    <th scope="col">CATEGORY</th>
                    <th scope="col">CREATED DATE</th>
                    <th scope="col">AMOUNT</th>
                  </tr>
                </thead>
                <tbody id="tblTransactions">
            
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

    </div>
        <!-- ✅ Add Transaction Modal -->
        <div class="modal fade" id="addTransactionModal" tabindex="-1" aria-labelledby="addTransactionLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-light">
                        <h5 class="modal-title" id="addTransactionLabel">Add Transaction</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Amount</label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" TextMode="Number" />
                        </div>

                        <div class="mb-3 d-flex justify-content-between align-items-center">
                            <label class="form-label m-0">Category</label>
                            <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                                + Add New Category
                            </button>
                        </div>

                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSaveTransaction" runat="server" Text="Save Transaction" class="btncustom" OnClick="btnSaveTransaction_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!-- ✅ Add Category Modal -->
        <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-light">
                    <h5 class="modal-title" id="addCategoryLabel">Add Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <label class="form-label">Category Name</label>
                    <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control" />
                </div>

                <div class="modal-footer">
                    <asp:Button ID="btnSaveCategory" runat="server" Text="Save Category" class="btncustom" OnClick="btnSaveCategory_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- ✅ Bootstrap JS (last me load karna zaroori hai) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Optional: check JS trigger -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            console.log("Bootstrap JS Loaded ✅");
        });

        function loadTransactions() {
            console.log("entry successfully happned")
            $.ajax({
                type: "POST",
                url: "/UI/categorynbudget.aspx/GetTransactions",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
              
             
                success: function (response) {
                    var data = response.d;
                    var html = "";
                    $.each(data, function (i, item) {
                        html += `
                      <tr>
                          <td>${item.Description}</td>
                          <td>${item.CategoryName}</td>
                          <td>${item.CreatedAt}</td>
                          <td>${item.Price}</td>
                      </tr>`;
                    });
                    $("#tblTransactions").html(html);
                    console.log(response,"data");
                },
                error: function (xhr, status, error) {
                    console.error("Error loading transactions:", error);
                }
            });
        }

        // Page load par ek dafa load
        $(document).ready(function () {
            loadTransactions();
        });

        // 👇 jab transaction create ho jaye (insert success), tab call karo:
        function onTransactionSaved() {
            loadTransactions(); // refresh table
        }
    </script>



</asp:Content>

